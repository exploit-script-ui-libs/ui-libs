-- { Services } --
local playerService = game:GetService("Players")
local runService = game:GetService("RunService")
local tweenService = game:GetService("TweenService")
local httpService = game:GetService("HttpService")
local networkClient = game:GetService("NetworkClient")
local virtualUser = game:GetService("VirtualUser")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local userInputService = game:GetService("UserInputService")
local lib = loadstring(game:HttpGet"https://raw.githubusercontent.com/killjoyelite67/Prim-Ui-lib/main/uilibPrim.lua")()
local loadConfig;
local saveConfig; local fps;

-- { Client Variables } --

local client = {}
    client.player = playerService.LocalPlayer
    client.fakeLagReady = true
    client.mouse = client.player:GetMouse()
        client.getCharacter = function()
            return client.player.Character or client.player.Character.CharacterAdded:Wait()
        end
        client.isFullyLoaded = function(table)
            local checks = {"Head","HumanoidRootPart","UpperTorso"}
            if table ~= nil then for i,v in pairs(table) do table.insert(checks, v) end end
            for i,v in pairs(checks) do
                if not client.getCharacter():FindFirstChild(v) then
                     return false
                end
            end
            return true
        end

-- { Game Variables } --

local players = workspace.Players

-- { Local Variables / Functions } --

local keybinds = {}; local velpred = 1009

local sessionSettings = {
    ["silentaim"] = false,
    ["fovcircle"] = {255, 0, 0},
    ["fovcircle3"] = -1,
    ["fovamount"] = 1,
    ["fovsides"] = 20,
    ["uiaccent"] = {218, 154, 169},
    ["watermark"] = {255,255,255},
    ["watermark2"] = false,
    ["watermarkpos"] = {},
    ["watermarktext"] = "none",
    ["ambiance"] = {0,0,0},
    ["outsideambiance"] = {187, 187, 187},
    ["brightness"] = 100,
    ["circleoffsetx"] = 0,
    ["circleoffsety"] = 40,
}

local function circle()
    task.wait(2)
	local newCircle = Drawing.new("Circle")
	newCircle.NumSides = lib.flags["fovsides"]
	newCircle.Radius = lib.flags["fovamount"]
	newCircle.Color = lib.flags["fovcircle"]
	newCircle.Thickness = 1
	newCircle.Visible = false

    return newCircle
end

local silentAim = {}
silentAim.target = nil
silentAim.circle = coroutine.wrap(circle)()

function getClosest()
	local closestTarg = math.huge
	local Target = nil

	for _, Player in next, playerService:GetPlayers() do
        if Player ~= client then
            if Player.Character then
                local playerHumanoid = Player.Character:FindFirstChild("Humanoid")
                local playerPart = Player.Character:FindFirstChild("HumanoidRootPart")
                if playerPart and playerHumanoid then
                    local hitVector, onScreen = workspace.CurrentCamera:WorldToScreenPoint(playerPart.Position)
                    if onScreen and playerHumanoid.Health > 0 then
                        local CCF = workspace.CurrentCamera.CFrame.p
                        local hitTargMagnitude = (Vector2.new(client.mouse.X, client.mouse.Y) - Vector2.new(hitVector.X, hitVector.Y)).magnitude
						if client.isFullyLoaded() then
							if hitTargMagnitude < closestTarg and hitTargMagnitude <= lib.flags["fovamount"]*8 and (client.getCharacter().HumanoidRootPart.Position-playerPart.Position).magnitude < 500 then
								Target = Player
								closestTarg = hitTargMagnitude
							end
						else
						end
                    else
                    end
                end
            end
		end
	end
	return Target
end

client.player.Chatted:Connect(function(msg)
    if string.sub(msg, 1, 3) == "/e " and string.sub(msg, 4, 9) ~= "dance" then
        local args = string.split(msg, " ")
        if args[2] == "kb" then
            if sessionSettings[args[4]] ~= nil then
                if args[5] == nil then
                    if args[3] ~= nil and args[3] ~= "" then
                        keybinds[string.upper(args[3])] = string.upper(args[3])..' '..args[4]
                    end
                else
                    if args[3] ~= nil and args[3] ~= "" then
                        keybinds[string.upper(args[3])] = string.upper(args[3])..' '..args[4]..' '..args[5]
                    end
                end
            else
                warn('unknown feature '..args[4]..' passed as arg4')
            end
        elseif args[2] == "dkb" then
            if keybinds[string.upper(args[3])] ~= nil then
                keybinds[string.upper(args[3])] = nil
                old[args[4]] = nil
            end
        end
    end
end)

game.Lighting:GetPropertyChangedSignal("Ambient"):Connect(function()
    if type(lib.flags["ambiance"]) == "table" then
        game.Lighting.Ambient = Color3.fromRGB(unpack(lib.flags["ambiance"]))
    else
        game.Lighting.Ambient = lib.flags["ambiance"]
    end
end)

game.Lighting:GetPropertyChangedSignal("Brightness"):Connect(function()
    game.Lighting.Brightness = lib.flags["brightness"]/100
end)

game.Lighting:GetPropertyChangedSignal("OutdoorAmbient"):Connect(function()
    if type(lib.flags["ambiance"]) == "table" then
        game.Lighting.OutdoorAmbient = Color3.fromRGB(unpack(lib.flags["outsideambiance"]))
    else
        game.Lighting.OutdoorAmbient = lib.flags["outsideambiance"]
    end
end)

client.player.Idled:connect(function()
	virtualUser:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
	task.wait(1)
	virtualUser:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

local function YROTATION(cframe)
	local x, y, z = cframe:ToOrientation()
	return CFrame.new(cframe.Position) * CFrame.Angles(0,y,0)
end

local function XYROTATION(cframe)
	local x, y, z = cframe:ToOrientation()
	return CFrame.new(cframe.Position) * CFrame.Angles(x,y,0)
end

local function check()
    local KOd = client.getCharacter():WaitForChild("BodyEffects")["K.O"].Value
    local Grabbed = client.getCharacter():FindFirstChild("GRABBING_CONSTRAINT") ~= nil
 
    if (KOd or Grabbed) then
        return false
    end
 
    return true
end

-- { UI Library }

local watermarkui = Instance.new("ScreenGui")
local watermarkback = Instance.new("Frame")
local watermarkback2 = Instance.new("Frame")
local watermarkLabel = Instance.new("TextLabel")
local watermarkLine = Instance.new("ImageLabel")

watermarkui.Name = " "
watermarkui.Parent = game.CoreGui
watermarkui.ResetOnSpawn = false
watermarkui.Enabled = false

watermarkback.Name = "watermarkback"
watermarkback.Parent = watermarkui
watermarkback.BackgroundColor3 = Color3.fromRGB(27, 22, 20)
watermarkback.BorderSizePixel = 0
watermarkback.Size = UDim2.new(0, 190, 0, 28)
watermarkback.BackgroundTransparency = 1
local uiCorner = Instance.new("UICorner",watermarkback); uiCorner.CornerRadius = UDim.new(0,6)
watermarkback:GetPropertyChangedSignal("Position"):Connect(function()
    sessionSettings["watermarkpos"] = {watermarkback.Position.X.Scale, watermarkback.Position.X.Offset, watermarkback.Position.Y.Scale, watermarkback.Position.Y.Offset}
end); watermarkback.Position = UDim2.new(1, -245, 0, -28)

watermarkback2.Name = "watermarkback2"
watermarkback2.Parent = watermarkback
watermarkback2.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
watermarkback2.BorderSizePixel = 0
watermarkback2.Position = UDim2.new(0, 1, 0, 1)
watermarkback2.Size = UDim2.new(1, -2, 1, -2)
watermarkback2.BackgroundTransparency = 1
local uiCorner = Instance.new("UICorner",watermarkback2); uiCorner.CornerRadius = UDim.new(0,6)

watermarkLabel.Name = "watermarkLabel"
watermarkLabel.Parent = watermarkback2
watermarkLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
watermarkLabel.BackgroundTransparency = 1.000
watermarkLabel.Position = UDim2.new(0, 0, 0, 2)
watermarkLabel.Size = UDim2.new(1, 0, 0, 20)
watermarkLabel.Font = Enum.Font.Arial
watermarkLabel.Text = ""
watermarkLabel.TextColor3 = Color3.fromRGB(218, 218, 218)
watermarkLabel.TextSize = 14.000
watermarkLabel.TextStrokeColor3 = Color3.fromRGB(14, 14, 14)
watermarkLabel.TextStrokeTransparency = 0.220

watermarkLine.Name = "watermarkLine"
watermarkLine.Parent = watermarkLabel
watermarkLine.BackgroundColor3 = Color3.fromRGB(172, 159, 162)
watermarkLine.BackgroundTransparency = 1.000
watermarkLine.BorderSizePixel = 0
watermarkLine.Position = UDim2.new(0.5, -64, 1, 0)
watermarkLine.Size = UDim2.new(0, 128, 0, 2)
watermarkLine.Image = "http://www.roblox.com/asset/?id=8753817226"
watermarkLine.ImageColor3 = Color3.fromRGB(218, 154, 169)

local dragging2
local dragInput2
local dragStart2
local startPos2

local function update2(input)
	local delta = input.Position - dragStart2
	watermarkback.Position = UDim2.new(startPos2.X.Scale, startPos2.X.Offset + delta.X, startPos2.Y.Scale, startPos2.Y.Offset + delta.Y)
    sessionSettings["watermarkpos"] = {watermarkback.Position.X.Scale, watermarkback.Position.X.Offset, watermarkback.Position.Y.Scale, watermarkback.Position.Y.Offset}
end

watermarkback.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging2 = true
		dragStart2 = input.Position
		startPos2 = watermarkback.Position
		
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging2 = false
			end
		end)
	end
end)

watermarkback.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput2 = input
	end
end)

userInputService.InputChanged:Connect(function(input)
	if input == dragInput2 and dragging2 then
		update2(input)
	end
end)

coroutine.wrap(function()
    local TimeFunction = runService:IsRunning() and time or os.clock

    local LastIteration, Start
    local FrameUpdateTable = {}
    
    local function HeartbeatUpdate()
        LastIteration = TimeFunction()
        for Index = #FrameUpdateTable, 1, -1 do
            FrameUpdateTable[Index + 1] = FrameUpdateTable[Index] >= LastIteration - 1 and FrameUpdateTable[Index] or nil
        end
    
        FrameUpdateTable[1] = LastIteration
        fps = tostring(math.floor(TimeFunction() - Start >= 1 and #FrameUpdateTable or #FrameUpdateTable / (TimeFunction() - Start)))
    end
    
    Start = TimeFunction()
    runService.Heartbeat:Connect(HeartbeatUpdate)
end)()

local window = lib.init("Primordial", Color3.fromRGB(218, 154, 169), Enum.KeyCode.Insert)
local general = window.createTab("general", "rbxassetid://8667132506")
    local aim = general.createSection("aim")
        local silent = aim.createToggle("silent aim", false, "silentaim", function(bool)
            sessionSettings["silentaim"] = bool
        end)
        local fovcircle = aim.createColorpicker("circle color", Color3.fromRGB(255,0,0), false, "fovcircle", function(clr3, trans)
            sessionSettings["fovcircle"] = {clr3.r*255, clr3.g*255, clr3.b*255}
            sessionSettings["fovcircle3"] = trans
        end)
        local fovsize = aim.createSlider("circle size", 1, 1, 150, "", "fovamount", function(int)
            sessionSettings["fovamount"] = int
        end)
        local fovsides = aim.createSlider("circle sides", 20, 3, 60, "", "fovsides", function(int)
            sessionSettings["fovsides"] = int
        end)
        local circleoffsetx = aim.createSlider("x offset", 0, 0, 125, "", "circleoffsetx", function(int)
            sessionSettings["circleoffsetx"] = int
        end)
        local circleoffsety = aim.createSlider("y offset", 40, 0, 125, "", "circleoffsety", function(int)
            sessionSettings["circleoffsety"] = int
        end)
local visuals = window.createTab("visuals", "rbxassetid://8595329857")
    local aim = general.createSection("aim")
    local world = visuals.createSection("world")
    local ambiance = world.createColorpicker("ambiance", Color3.fromRGB(0,0,0), false, "ambiance", function(clr3, trans)
        sessionSettings["ambiance"] = {clr3.r*255, clr3.g*255, clr3.b*255}
        game.Lighting.Ambient = Color3.fromRGB(unpack({clr3.r*255, clr3.g*255, clr3.b*255}))
    end)
    local outsideambiance = world.createColorpicker("outside ambiance", Color3.fromRGB(187,187,187), false, "outsideambiance", function(clr3, trans)
        sessionSettings["outsideambiance"] = {clr3.r*255, clr3.g*255, clr3.b*255}
        game.Lighting.OutdoorAmbient = Color3.fromRGB(unpack({clr3.r*255, clr3.g*255, clr3.b*255}))
    end)
    local brightness = world.createSlider("brightness", 100, 1, 100, "", "brightness", function(int)
        sessionSettings["brightness"] = int
        game.Lighting.Brightness = int/100
    end)
    local ui = visuals.createSection("ui")
        local watermark = ui.createColorpicker("watermark", Color3.fromRGB(255,255,255), true, "watermark", function(clr3, trans, bool)
            watermarkui.Enabled = bool
            sessionSettings["watermark"] = {clr3.r*255, clr3.g*255, clr3.b*255}
            lib.flags["watermark"] = {clr3.r*255, clr3.g*255, clr3.b*255}
            sessionSettings["watermark2"] = bool
            if type(lib.flags["watermark"]) == "table" then
                watermarkLabel.TextColor3 = Color3.fromRGB(unpack(lib.flags["watermark"]))
            else
                watermarkLabel.TextColor3 = lib.flags["watermark"]
            end
        end)
        local watermarktext = ui.createDropdown("watermark name", {"Primordial"}, "watermarktext", function(str)
            sessionSettings["watermarktext"] = str
            if lib.flags["watermarktext"] ~= "none" then
                watermarkLabel.Text = lib.flags["watermarktext"].." | "..fps.." fps | "..tostring(math.floor(client.player:GetNetworkPing()*2000)).." ping"
            else
                watermarkLabel.Text = fps.." fps | "..tostring(math.floor(client.player:GetNetworkPing()*2000)).." ping"
            end
        end)
        local uiaccent = ui.createColorpicker("ui accent", Color3.fromRGB(218, 154, 169), false, "uiaccent", function(clr3, trans)
            sessionSettings["uiaccent"] = {clr3.r*255, clr3.g*255, clr3.b*255}
            watermarkLine.ImageColor3 = Color3.fromRGB(unpack({clr3.r*255, clr3.g*255, clr3.b*255}))
            lib.setAccent(Color3.fromRGB(unpack({clr3.r*255, clr3.g*255, clr3.b*255})))
        end)

-- { Metatable Tampering } --

local oldindex = nil
local oldnamecall = nil

oldindex = hookmetamethod(game, "__index", newcclosure(function(Self, Index)
    if not checkcaller() and string.lower(Index) == "target" and Self == client.mouse and lib.flags["silentaim"] and check() then
        if silentAim.target ~= nil then
            return silentAim.target.Character.HumanoidRootPart
        end
    elseif not checkcaller() and string.lower(Index) == "hit" and Self == client.mouse and lib.flags["silentaim"] and check() then
        if silentAim.target ~= nil then
            local vel = silentAim.target.Character.HumanoidRootPart.Velocity
            local realPing = client.player:GetNetworkPing()*2000
            if realPing > 100 and realPing < 160 then
                realPing = 100
            elseif realPing > 40 and realPing < 60 then
                realPing = 50
            end
            return CFrame.new(silentAim.target.Character.HumanoidRootPart.Position.X + (vel.X/18.3)*(realPing)/75, silentAim.target.Character.HumanoidRootPart.Position.Y, silentAim.target.Character.HumanoidRootPart.Position.Z + (vel.Z/18.3)*(realPing)/75)
        end
    end
    return oldindex(Self, Index)
end))

oldnamecall = hookmetamethod(game, "__namecall", newcclosure(function(Self, ...)
	local args = {...}
    local callingmethod = getnamecallmethod()

    if not checkcaller() and string.lower(callingmethod) == "kick" then
		return wait(math.huge)
    elseif not checkcaller() and string.lower(callingmethod) == "breakjoints" then
        return wait(math.huge)
    elseif not checkcaller() and string.lower(callingmethod) == "fireserver" and string.find(string.lower(tostring(Self)),"kick") then
        return wait(math.huge)
    elseif not checkcaller() and string.lower(callingmethod) == "fireserver" and string.find(string.lower(tostring(Self)),"ban") then
        return wait(math.huge)
	end
    return oldnamecall(Self, ...)
end))

-- { Loops }

local circlee = nil
coroutine.wrap(function()
    circlee = circle()
end)()

coroutine.wrap(function()
    while true do
        task.wait(1)
        if lib.flags["watermark2"] then
            if lib.flags["watermarktext"] ~= "none" then
                if type(lib.flags["watermark"]) == "table" then
                    watermarkLabel.TextColor3 = Color3.fromRGB(unpack(lib.flags["watermark"]))
                else
                    watermarkLabel.TextColor3 = lib.flags["watermark"]
                end
                watermarkLabel.Text = lib.flags["watermarktext"].." | "..fps.." fps | "..tostring(math.floor(client.player:GetNetworkPing()*2000)).." ping"
            else
                watermarkLabel.Text = fps.." fps | "..tostring(math.floor(client.player:GetNetworkPing()*2000)).." ping"
            end
        end
    end
end)()

runService.Stepped:Connect(function()
    runService.Stepped:Wait()
    runService.Stepped:Wait()
    if client.isFullyLoaded() then
        if lib.flags["silentaim"] then
            silentAim.target = getClosest()
        end
        if circlee ~= nil then
            if lib.flags["silentaim"] then
                circlee.Visible = true
                circlee.Position = Vector2.new(client.mouse.X + lib.flags["circleoffsetx"], client.mouse.Y + lib.flags["circleoffsety"])
                circlee.Radius = lib.flags["fovamount"]*8
                circlee.Color = lib.flags["fovcircle"]
                circlee.Transparency = -lib.flags["fovcircle3"]
                circlee.NumSides = lib.flags["fovsides"]
            else
                circlee.Visible = false
            end
        end
    end
end)
