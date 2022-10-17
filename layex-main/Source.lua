--
-- Layex: Tiny UI framework for Roblox
--   - Made by ribet
--

-- Util
local function copyTable(tbl)
	local copy = {}
	for k,v in pairs(tbl) do copy[k] = v end
	return copy
end

local function merge(...)
	local args = {...}
	local merged = {}
	for _, merging in ipairs(args) do
		for mergeK, mergeKV in pairs(merging) do
			merged[mergeK] = mergeKV
		end
	end
	return merged
end

-- Checks thing
local checks = setmetatable({
	checks = {},
}, {
	__index = {
		add = function(self, check)
			if check.default then
				check.name = "default"
			end
			self.checks[check.name] = check
		end,
		check = function(self, value)
			for _, check in pairs(self.checks) do
				if check.name ~= "default" and check.check(value) then
					return check.name
				end
			end
			return "default"
		end,
		getCheck = function(self, name)
			return self.checks[name]
		end,
		getTypes = function(self, tbl)
			local types = {}
			for key, val in pairs(tbl) do
				types[key] = self:check(val)
			end
			return types
		end,
	},
})

-- changeParent function
local parent_checks = setmetatable({checks = {}}, getmetatable(checks))
local function changeParent(inst, parent)
	local callback = parent_checks:getCheck(parent_checks:check(parent)).callback
	callback(inst, parent)
end

parent_checks:add {
	default = true,
	callback = function(inst, parent)
		inst.Parent = parent
	end,
}

-- setProperties function
local function setProperties(inst, ...)
	local props = merge(...)
	local returnmap = {}

	for prop, val in pairs(props) do
		local callback = checks:getCheck(checks:check(prop)).callback

		local ck, cv = callback(prop, val, inst, props, returnmap)
		if ck then
			returnmap[ck] = cv
		end
	end

	return inst, returnmap
end

local default_checks = setmetatable({checks = {}}, getmetatable(checks))
checks:add {
	default = true,
	callback = function(key, val, inst, props, returnmap)
		local valtype = default_checks:getCheck(default_checks:check(val))
		return key, valtype.callback(key, val, inst, returnmap)
	end,
}
default_checks:add {
	default = true,
	callback = function(key, val, inst)
		inst[key] = val
	end,
}

-- new function
local component_checks = setmetatable({checks = {}}, getmetatable(checks))
local function new(component, parent, ...)
	local component_type = component_checks:getCheck(component_checks:check(component))
	return component_type.callback(component, parent, ...)
end

-- host components
component_checks:add {
	default = true,
	callback = function(classname, parent, ...)
		local inst = Instance.new(classname)
		changeParent(inst, parent)
		return setProperties(inst, merge(...)) -- setProperties return inst and returnmap
	end,
}

-- function components
component_checks:add {
	name = "functioncomponent",
	check = function(val)
		return type(val) == "function"
	end,
	callback = function(func, parent, ...)
		return func(merge(...), parent)
	end,
}

-- stateful component
local component = {}
component.__index = component
component.__component = component -- used to check if a table extended from it its a component

function component:new()
	return setmetatable({
		state = {},
		extra = nil,
		super = self.__super,
	}, self)
end

function component:extend()
	local copy = copyTable(self)
	copy.__index = copy
	copy.__super = self
	return copy
end

function component:init() end
function component:update() end

function component:setState(state, extra)
	for k, v in pairs(state) do
		self.state[k] = v
	end
	self.extra = extra

	self:update(self.state, self.extra)
end

-- add it as a way to be used in the first layex.new(... argument
component_checks:add {
	name = "statefulcomponent",
	check = function(val)
		return type(val) == "table" and val.__component == component
	end,
	callback = function(comp, parent, ...)
		local compinst = comp:new()
		compinst:init(merge(...), parent)
		compinst:update(compinst.state, compinst.extra)
		return compinst
	end,
}

-- events
local event_identifier = {}
local function event(event, name)
	return setmetatable({eventname = event, name = name}, event_identifier)
end
checks:add {
	name = "event",
	check = function(val)
		return type(val) == "table" and getmetatable(val) == event_identifier
	end,
	callback = function(key, val, inst, props, returnmap)
		local obj = {instance = inst; connection = nil;}
		obj.connection = inst[key.eventname]:Connect(function(...)
			val(obj, ...)
		end)
		return key.name, obj.connection
	end,
}

-- bindings
local binding = {}
binding.__index = binding
binding.__tostring = function(self)return("Binding{%s}"):format(tostring(self.value))end

local bindingsub = {}
bindingsub.__index = bindingsub
bindingsub.__tostring = function()return"Binding subscription"end
function bindingsub.new(from, func)
	return setmetatable({binding = from, func = func}, bindingsub)
end
function bindingsub:unsubscribe()
	self.binding.connections[self] = nil
end

function binding.new(val, extra)
	return setmetatable({value = val, connections = {}, extra = extra}, binding)
end

function binding:set(value, extra)
	self.value = value
	self.extra = extra

	for sub in pairs(self.connections) do
		sub.func(value, extra)
	end
end

function binding:get()
	return self.value, self.extra
end

function binding:subscribe(func)
	local sub = bindingsub.new(self, func)
	self.connections[sub] = true

	return sub
end

local binding_map_identifier = {}
function binding:map(f)
	return setmetatable({func = f, binding = self}, binding_map_identifier)
end

local multiple_maps_identifier = {}
local function mapBinds(...)
	local args = {...}
	local func = args[#args]
	table.remove(args, #args)
	
	-- args: bindings to map
	-- func: func to map to bindings
	return setmetatable({func = func, binds = args}, multiple_maps_identifier)
end

-- make bindings work as a prop
default_checks:add {
	name = "binding",
	check = function(val)
		return type(val) == "table" and getmetatable(val) == binding
	end,
	callback = function(key, val, inst)
		local sub = val:subscribe(function(bindingval, bindingextra)
			setProperties(inst, {[key] = bindingval})
		end)
		setProperties(inst, {[key] = (val:get())}) -- :get() returns 2 vals
		return sub
	end,
}
default_checks:add { -- maps
	name = "bindingmap",
	check = function(val)
		return type(val) == "table" and getmetatable(val) == binding_map_identifier
	end,
	callback = function(key, val, inst, returnmap)
		local sub = val.binding:subscribe(function(bindingval, bindingextra)
			setProperties(inst, {[key] = val.func(bindingval, bindingextra, inst, returnmap)})
		end)
		local bindval, bindextra = val.binding:get()
		setProperties(inst, {[key] = val.func(bindval, bindextra, inst, returnmap)})
		return sub
	end,
}
default_checks:add { -- multiplemaps
	name = "multiplemaps",
	check = function(val)
		return type(val) == "table" and getmetatable(val) == multiple_maps_identifier
	end,
	callback = function(key, val, inst, returnmap)
		local subs = {}
		for _, bind in ipairs(val.binds) do
			table.insert(subs, bind:subscribe(function(bindingval, bindingextra)
				setProperties(inst, {[key] = val.func(unpack(val.binds))})
			end))
		end
		setProperties(inst, {[key] = val.func(unpack(val.binds))})
		
		return subs
	end,
}

-- tweens
local ts = game:GetService("TweenService")
local tween_identifier = {}
local function tween(props, tweeninfo, initval)
	return setmetatable({props = props, tweeninfo = tweeninfo, init = initval}, tween_identifier)
end

-- make tween work as prop
default_checks:add {
	name = "tween",
	check = function(val)
		return type(val) == "table" and getmetatable(val) == tween_identifier
	end,
	callback = function(key, val, inst)
		local tween = ts:Create(inst, val.tweeninfo or TweenInfo.new(0.2), {[key] = val.props})
		if val.init then inst[key] = val.init end
		tween.Completed:Connect(function() -- if the tween gets cancelled it destroys too
			tween:Destroy()
		end)
		tween:Play()
		return tween
	end,
}

-- childs
local childs_identifier = {}
local function childs()
	return setmetatable({}, childs_identifier)
end
checks:add {
	name = "childs",
	check = function(val)
		return type(val) == "table" and getmetatable(val) == childs_identifier
	end,
	callback = function(key, value, inst, props, returnmap)
		local created_childs = {}
		for childname, child in pairs(value) do
			local childtype = child[1]
			local descendants = child[2]
			child[1], child[2] = nil
			child[key] = descendants -- 'key' is a layex.childs

			created_childs[childname] = new(childtype, inst, child)
		end
		return "childs", created_childs
	end,
}

-- signal
local signal = {}
signal.__index = signal
signal.__tostring = function()return"Signal"end
local signalconnection = {}
signalconnection.__index = signalconnection
signalconnection.__tostring = function()return"Connection"end

function signal.new()
	return setmetatable({connections = {}}, signal)
end
function signal:Connect(func)
	local con = setmetatable({func = func, event = self}, signalconnection)
	self.connections[con] = true
	return con
end
function signal:Fire(...)
	for connection in pairs(self.connections) do
		connection.func(...)
	end
end
function signalconnection:Disconnect()
	self.event.connections[self] = nil
end

-- Export Layex
local layex = {}

layex.setProperties = setProperties
layex.new = new
layex.event = event
layex.tween = tween
layex.Binding = binding.new
layex.MapBindings = mapBinds
layex.Component = component
layex.Signal = signal.new

setmetatable(layex, {
	__index = function(self, k)
		if k == "childs" then
			return childs()
		end
	end,
})

return layex
