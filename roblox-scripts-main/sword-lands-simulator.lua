if shared.cleanup then
	shared.cleanup()
end

local ui = loadstring(game:HttpGet('https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua'))()
local notify = loadstring(game:HttpGet('https://gist.githubusercontent.com/wally-rblx/e010db020afe8259048a0c3c7262cdf8/raw/76ae0921ac9bd3215017e635d2c1037a37262240/notif.lua'))()

local window = ui.Load({ 
	Title = 'Sword Lands Simulator', 
	Style = 3,

	SizeX = 400,
	SizeY = 420,

	Theme = "Dark",

	ColorOverrides = {
		MainFrame = Color3.fromRGB(10, 10, 10),
		NavBar = Color3.fromRGB(24, 24, 24),
		TitleBar = Color3.fromRGB(22, 22, 22),
		Content = Color3.fromRGB(50, 50, 50),
	}
})

local client = game.Players.LocalPlayer

local network = require(game.ReplicatedStorage:WaitForChild('Shared'):WaitForChild('Network'))
local clientStore = require(game.ReplicatedStorage:WaitForChild('Client'):WaitForChild('Store'))
local floorData = require(game.ReplicatedStorage:WaitForChild('Shared'):WaitForChild('FloorData'))
local monsterDatabase = game.ReplicatedStorage:WaitForChild('Shared'):WaitForChild('MonsterDatabase')
local pointInCylinder = require(game.ReplicatedStorage:WaitForChild('Shared'):WaitForChild('PointInCylinder'))

local features = game.ReplicatedStorage.Client:WaitForChild('Features')

local shopGui = require(features.shop)
local upgraderGui = require(features.upgrades)
local craftingGui = require(features.craft)

local Events = {
	DoDamage = network.GetEvent('DoDamage')
}

local Settings = {
	Killaura = false,
	KillauraRange = 20,
	KillauraDelay = 300,
	KillauraAttacks = 5,

	Autofarm = false,
	AutofarmOffset = 5,

	Fly = false,
	FlySpeed = 30,

	Speedhack = false,
	WalkSpeed = 30,
}

local Util = {}
do
	Util.Bosses = {}
	Util.SafeZones = {}

	for _, module in next, monsterDatabase:GetChildren() do
		local result = require(module)
		if type(result) == 'table' and rawget(result, 'MobType') == 'Boss' then
			Util.Bosses[module.Name] = true
		end
	end

	for _, zone in next, workspace:WaitForChild('Zones'):GetChildren() do
		local config = zone:FindFirstChild('Configuration')

		if type(config) == 'table' and config.IsSafe then
			table.insert(Util.SafeZones, zone)
		end
	end

	function Util.Notify(text, duration)
		return notify.Notify({
	        Title = 'Sword lands simulator', 
	        Description = text,
	        Duration = duration or 5,
	    })
	end

	function Util.IsPartInSafeZone(part)
		for i, zone in next, Util.SafeZones do
			if pointInCylinder(part.Position, zone) then
				return true
			end
		end
		return false
	end


	function Util.Attack(targets)
		local packet = {}

		for _, mob in next, targets do
			for _, part in next, mob:GetChildren() do
				if not part:IsA('BasePart') then continue end

				-- haha no more stupid for loop
				local packed = table.create(45, { mob, part.Name })
				table.move(packed, 1, #packed, #packet + 1, packet)
			end
		end

		Events.DoDamage:FireServer(packet)
	end

	function Util.GetAutofarmTarget()
		local mobs = {}
		for _, mob in next, workspace:WaitForChild('Monsters'):GetChildren() do
			if not Util.IsMobAlive(mob) then continue end

			if Settings.BossPriority and Util.Bosses[mob.Name] then
				Util.Notify('Found a boss named: ' .. mob.Name)
				table.clear(mobs)
				table.insert(mobs, mob)
				break
			end

			table.insert(mobs, mob)
		end

		table.sort(mobs, function(m0, m1)
			local d0 = client:DistanceFromCharacter(m0.PrimaryPart.Position)
			local d1 = client:DistanceFromCharacter(m1.PrimaryPart.Position)
			return d0 < d1
		end)

		return mobs[1]
	end

	function Util.GetTargetsInRadius(radius)
		local targets = {}

		if Settings.KillauraTargets['Attack mobs'] then
			for _, mob in next, workspace:WaitForChild('Monsters'):GetChildren() do
				if not Util.IsMobAlive(mob) then continue end
				if client:DistanceFromCharacter(mob.PrimaryPart.Position) > radius then continue end

				table.insert(targets, mob)
			end
		end

		if Settings.KillauraTargets['Attack players'] and game.PlaceId ~= 9605515605 then
			for _, plr in next, game.Players:GetPlayers() do
				if plr == client then continue end

				if not Util.IsPlayerAlive(plr) then continue end
				if Util.IsPartInSafeZone(plr.Character.PrimaryPart) then continue end
				if client:DistanceFromCharacter(plr.Character.PrimaryPart.Position) > radius then continue end

				table.insert(targets, plr.Character)
			end
		end

		return targets
	end

	function Util.IsMobAlive(mob)
		if not mob.PrimaryPart then 
			return false
		end

		local health = mob.PrimaryPart:FindFirstChild('Health')
		if health and health.Value > 0 then
			return true
		end
	end

	function Util.IsPlayerAlive(plr)
		local character = plr.Character
		local humanoid = character and character:FindFirstChild('Humanoid')
		local rootPart = character and character:FindFirstChild('HumanoidRootPart')

		if rootPart and (humanoid and humanoid.Health > 0) then
			return true 
		end
	end

	function Util.IsAlive()
		return Util.IsPlayerAlive(client)
	end

	function Util.Teleport(cf)
		if Util.IsAlive() then
			client.Character.PrimaryPart:PivotTo(cf)
		end
	end

	function Util.SetSetting(name)
		return function(value)
			Settings[name] = value
		end
	end

	function Util.SpeedhackUpdate(value)
		if type(value) == 'boolean' then
			Settings.Speedhack = value
		elseif type(value) == 'number' then
			Settings.WalkSpeed = value
		end

		-- warn('SpeedhackUpdate called!', value, type(value))

		if Util.IsAlive() then
			local connections = getconnections(client.Character.Humanoid:GetPropertyChangedSignal('WalkSpeed'))
			for i, con in next, connections do
				con:Disable()
			end
			client.Character.Humanoid.WalkSpeed = Settings.Speedhack and Settings.WalkSpeed or 16
		end
	end
end

local Functions = {}
do
	function Functions.AutoAttack()
		while true do
			task.wait()
			if Settings.Killaura or Settings.Autofarm then
				local targets = nil
				if Settings.Autofarm then 
					targets = { Settings.AttackTarget }
				else 
					targets = Util.GetTargetsInRadius(Settings.KillauraRange)
				end

				if #targets == 0 then 
					continue 
				end

				Util.Attack(targets)
				task.wait(1)
			end
		end
	end

	function Functions.Autofarm()
		while true do
			task.wait()
			if Settings.Autofarm then
				local target = Util.GetAutofarmTarget()
				if not target then continue end

				Settings.AttackTarget = target
				while Settings.Autofarm do
					task.wait()

					if not Util.IsMobAlive(target) then break end
					if not Util.IsAlive() then break end

					if Util.BossSpawned then
						Util.BossSpawned = false
						break
					end

					local cf, size = target:GetBoundingBox()

					local flat = CFrame.new(cf.p)
					local top = flat * CFrame.new(0, (size.Y / 2) + 4, 0)

					client.Character:PivotTo(top)
					client.Character.PrimaryPart.Velocity = Vector3.zero
				end
				Settings.AttackTarget = nil

				task.wait(0.5)
			end
		end
	end

	function Functions.Flyhack()
		-- ripped this straight from kiriothub's wild west fly (WHICH I WROTE!!!)
		while true do
			local delta = task.wait()
			if Settings.Fly and Util.IsAlive() then
				local character = client.Character
				local root = character.HumanoidRootPart

				if not Settings.FlyCF then
					Settings.FlyCF = CFrame.new(root.CFrame.p)
				end

				local mouse = client:GetMouse()
				local camCF = Settings.FlyFollowsMouse and mouse.Hit or workspace.CurrentCamera.CFrame
				local speed = Settings.FlySpeed

				local force = Vector3.zero

				if game.UserInputService:IsKeyDown(Enum.KeyCode.W) then force = force + (camCF.lookVector   * speed) end
				if game.UserInputService:IsKeyDown(Enum.KeyCode.S) then force = force + (-camCF.lookVector  * speed) end
				if game.UserInputService:IsKeyDown(Enum.KeyCode.A) then force = force + (-camCF.rightVector * speed) end
				if game.UserInputService:IsKeyDown(Enum.KeyCode.D) then force = force + (camCF.rightVector  * speed) end
				
				if game.UserInputService:IsKeyDown(Enum.KeyCode.Space) then force = force + (camCF.upVector  * speed) end
				if game.UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then force = force + (-camCF.upVector * speed) end

				force = force * delta

				Settings.FlyCF = Settings.FlyCF * CFrame.new(force)

				root.CFrame = CFrame.lookAt(Settings.FlyCF.p, camCF.p + (camCF.lookVector * 10000))
				root.Velocity = Vector3.new()

				continue
			end

			Settings.FlyCF = nil
		end
	end

	function Functions.RejoinServer()
		game.TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId)
	end

	function Functions.JoinSmallestServer()
		local ServerList = {}

		-- https://games.roblox.com/v1/games/171336322/servers/Public?sortOrder=Asc&excludeFullGames=false&limit=100&cursor=

		local Cursor = ''
		local BaseUrl = 'https://games.roblox.com/v1/games/%s/servers/Public?sortOrder=Asc&excludeFullGames=true&limit=100&cursor=%s'

		while true do
			local url = string.format(BaseUrl, game.PlaceId, Cursor)
			local suc, res = pcall(game.HttpGet, game, url)

			if not suc then
			--	warn('Failed request', suc, res)
				task.wait(1)
				continue
			end

			local suc, dec = pcall(game.HttpService.JSONDecode, game.HttpService, res)
			if not suc then
			--	warn('Failed JSON decode', suc, dec)
				task.wait(1)
				continue
			end

			local data = dec.data
			for i = 1, #data do
				local server = data[i]

				if server.id == game.JobId then continue end
				if not server.playing then continue end
				if server.playing >= server.maxPlayers then continue end

				table.insert(ServerList, server)
			end

			Cursor = dec.nextPageCursor
			if not Cursor then
				break
			end

			task.wait(0.1)
		end

		table.sort(ServerList, function(s0, s1)
			return s0.playing < s1.playing
		end)

		if ServerList[1] then
			game.TeleportService:TeleportToPlaceInstance(game.PlaceId, ServerList[1].id)
		end
	end
end

-- Cleanup system
do
	local tasks = {}
	function shared.onCleanup(callback)
		table.insert(tasks, callback)
	end

	function shared.cleanup()
		for i = #tasks, 1, -1 do
			local func = table.remove(tasks, i)
			pcall(func)
		end
	end
end

-- Anticheat bypass
do
	local oldKick
	oldKick = hookfunction(game.Players.LocalPlayer.Kick, function(...)
		local plr, msg = ...
		if plr == game.Players.LocalPlayer and typeof(msg) ~= 'userdata' then
			return
		end
		return oldKick(...)
	end)

	local namecall
	namecall = hookmetamethod(game, '__namecall', function(self, ...)
		local args = { ... }
		local method = getnamecallmethod()

		if self == client and (method == 'Kick' or method == 'kick') then
			if typeof(args[1]) ~= 'userdata' then
				return
			end
		end

		return namecall(self, ...)
	end)

	local newindex
	newindex = hookmetamethod(game, '__newindex', function(self, key, value)
		if not checkcaller() then
			if key == 'Anchored' or key == 'Velocity' or key == 'CFrame' then
				local root = client.Character and client.Character:FindFirstChild('HumanoidRootPart')
				if self == root then
					return
				end
			end
		end
		return newindex(self, key, value)
	end)

	shared.onCleanup(function()
		hookfunction(game.Players.LocalPlayer.Kick, oldKick)

		hookmetamethod(game, '__namecall', namecall, false)
		hookmetamethod(game, '__newindex', newindex, false)
	end)
end

-- Connections
do
	local function onMonsterAdded(monster)
		if Util.IsMobAlive(monster) and Util.Bosses[monster.Name] then
			Util.Notify('A boss named: ' .. monster.Name .. ' has spawned!')
			Util.BossSpawned = true
		end
	end

	Settings.CharacterAdded = client.CharacterAdded:Connect(function()
		task.defer(Util.SpeedhackUpdate)
	end)

	Settings.MonsterAdded = workspace:WaitForChild('Monsters').ChildAdded:Connect(function(monster)
		task.defer(onMonsterAdded, monster)
	end)

	shared.onCleanup(function()
		Settings.CharacterAdded:Disconnect()
		Settings.CharacterAdded = nil

		Settings.MonsterAdded:Disconnect()
		Settings.MonsterAdded = nil
	end)
end

local Tabs = {}

Tabs.Autofarm = window.New({ Title = 'Autofarm' })
do
	Tabs.Autofarm.Toggle({ Text = 'Autofarm', Callback = Util.SetSetting('Autofarm') })
	Tabs.Autofarm.Label({ Text = 'Settings' })
	Tabs.Autofarm.Slider({ Text = 'Teleport offset', Min = 0, Max = 10, Def = Settings.AutofarmOffset, Callback = Util.SetSetting('AutofarmOffset')  })
	Tabs.Autofarm.Toggle({ Text = 'Prioritize boss', Callback = Util.SetSetting('BossPriority') })
end

Tabs.Killaura = window.New({ Title = 'Killaura' })
do
	Tabs.Killaura.Toggle({ 
		Text = 'Killaura', 
		Callback = Util.SetSetting('Killaura'),
	})

	Tabs.Killaura.Label({ Text = 'Settings' })
	Tabs.Killaura.Slider({ Text = 'Attack distance', Min = 0, Max = 20, Def = Settings.KillauraRange, Callback = Util.SetSetting('KillauraRange')  })

	Tabs.Killaura.ChipSet({
		Text = 'Killaura targets', 
		Callback = Util.SetSetting('KillauraTargets'),
		Options = {
			['Attack mobs'] = true,
			['Attack players'] = false,
		}
	})
end

Tabs.Movement = window.New({ Title = 'Movement' })
do
	Tabs.Movement.Label({ Text = 'Fly' })
	Tabs.Movement.Toggle({ Text = 'Fly', Callback = Util.SetSetting('Fly') })
	Tabs.Movement.Toggle({ Text = 'Fly follows mouse', Callback = Util.SetSetting('FlyFollowsMouse')  })
	Tabs.Movement.Slider({ Text = 'Fly speed', Min = 30, Max = 120, Def = Settings.FlySpeed, Callback = Util.SetSetting('FlySpeed')  })

	Tabs.Movement.Label({ Text = 'Speedhack' })
	Tabs.Movement.Toggle({ Text = 'Enabled', Callback = Util.SpeedhackUpdate })
	Tabs.Movement.Slider({ Text = 'Walk speed', Min = 30, Max = 120, Def = Settings.WalkSpeed, Callback = Util.SpeedhackUpdate  })
end

Tabs.Locations = window.New({ Title = 'Locations' })
do
	task.spawn(function()
		Tabs.Locations.Label({ Text = 'Location teleports' })
		local teleports = workspace:WaitForChild('Teleports', 10)
		if teleports then
			local teleporters = teleports:GetChildren()
			table.sort(teleporters, function(a, b) return a.Name:lower() < b.Name:lower() end)

			for i = 1, #teleporters do
				local location = teleporters[i]
				local cf = location:FindFirstChild('Receiver').CFrame * CFrame.new(0, 0, -5)

				Tabs.Locations.Button({ Text = 'Teleport to ' .. string.lower(location.Name), Callback = function()
					Util.Teleport(cf)
				end })
			end
		end
	end)
end

Tabs.Menus = window.New({ Title = 'Quick menu' })
do
	local function OpenGui(callback)
		clientStore:dispatch(shopGui.actions.toggle(false))
		clientStore:dispatch(upgraderGui.actions.toggle(false))
	 	clientStore:dispatch(craftingGui.actions.toggle(false))
			
	 	if callback == false then
	 		return
	 	end

		task.wait(0.1)
		callback()
	end

	local Shops = {}
	do
		for i, shop in next, workspace.Shops:GetChildren() do
			local root = shop:FindFirstChild('Root')
			local title = root and root:findFirstChild('Title')
			local label = title and title:findFirstChild('Label')
			if label == nil then continue end

			local shopType = label.Text:match('(%w+) SHOP')
			if shopType == nil then continue end

			table.insert(Shops, { 
				type = shopType:lower(), 
				data = require(shop:FindFirstChild('Configuration')) 
			})
		end
		table.sort(Shops, function(s0, s1) return s0.type < s0.type end)
	end

	Tabs.Menus.Label{ Text = 'Shops' }
	for _, shop in next, Shops do
		Tabs.Menus.Button{ Text = 'Open ' .. shop.type .. ' shop', Callback = function()
			OpenGui(function()	
				clientStore:dispatch(shopGui.actions.setItems(shop.data))
				clientStore:dispatch(shopGui.actions.toggle(true))
			end)
		end }
	end

	Tabs.Menus.Label{ Text = 'Crafting' }
	for i, craft in next, workspace.Crafting:GetChildren() do
		local craftData = require(craft:FindFirstChild('Configuration'))
		Tabs.Menus.Button{ Text = 'Open ' .. craft.Name:lower() .. ' menu', Callback = function()
			OpenGui(function()	
				clientStore:dispatch(craftingGui.actions.setItems(craftData))
				clientStore:dispatch(craftingGui.actions.toggle(true))
			end)
		end }
	end

	Tabs.Menus.Label{ Text = 'Other' }
	Tabs.Menus.Button{ Text = 'Open upgrader menu', Callback = function()
		OpenGui(function()	
			clientStore:dispatch(upgraderGui.actions.toggle(true))
		end)
	end }

	Tabs.Menus.Button{ Text = 'Hide menus', Callback = function()
		OpenGui(false)
	end }
end

Tabs.Teleports = window.New({ Title = 'Teleports' })
do
	Tabs.Teleports.Label({ Text = 'Floor teleports' })
	for i = 0, #floorData do
		if floorData[i] then
			Tabs.Teleports.Button({ Text = string.format('Teleport to floor %s', i), Callback = function()
				game.TeleportService:Teleport(floorData[i])
			end })
		end
	end
end

Tabs.Util = window.New({ Title = 'Utilities' })
do
	Tabs.Util.Button({ Text = 'Rejoin server', Callback = Functions.RejoinServer })
	Tabs.Util.Button({ Text = 'Join smallest server', Callback = Functions.JoinSmallestServer })
end

shared.onCleanup(function()
	if OldInstance then
		pcall(game.Destroy, OldInstance)
	end
end)

for _, idx in next, { 'AutoAttack', 'Autofarm', 'Flyhack' } do
	local func = Functions[idx]
	if type(func) == 'function' then
		local thread = task.spawn(func)
		shared.onCleanup(function()
			coroutine.close(thread)
		end)
		continue
	end
end