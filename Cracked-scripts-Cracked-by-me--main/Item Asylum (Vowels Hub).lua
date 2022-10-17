local CrackedBySyndi = true
if not(game:IsLoaded()) then
	game.Loaded:Wait()
end

if (game.CoreGui:FindFirstChild("vowels")) then
	game.CoreGui.vowels:Destroy()
end

local blocklist = {
}



local players = game:GetService("Players")
local player = players.LocalPlayer
local ID = player.UserId
local isBlocked = false
local isMaster = true

for i,v in pairs(blocklist) do
	if v == ID then
		isBlocked = true
		break
	end
end

for i,v in pairs(masterlist) do
	if v == ID then
		isMaster = true
		break
	end
end

if CrackedBySyndi==false then
print(":(")
else
	local verNum = "v0.5"
	local dumbQuotes = {
		"ffa_smallplate is totally balanced trust me",
		"STOP STUNLOCKING ME!!!!!!",
		"Like taking candy from a baby.",
		"Could probably use some polishing!",
		"Wait this isn't a camera",
		("Set the parent of " .. player.Name .. "to nil!"),
		"Meh, I liked Risk of Rain 2 better.",
		"You need a fairly high IQ to understand Vowels.",
		"Jake, from State Farm?!",
		"What would *you* do for a Klondike bar?",
		"Made in Lua!",
		"sys.exit!",
		"bruh nerf chinalake",
		"Because the devs won't do it.",
		"Petition YOUR local developer for more updates!",
		"why are you buying clothes at the soup store",
		"I just wanna be a normal GUI with normal knees."
	}

	warn([[        
			__     __                        _      
			\ \   / /  ___  __      __ ___  | | ___ 
			 \ \ / /  / _ \ \ \ /\ / // _ \ | ||__ \
			  \ V /  | (_) | \ V  V / \__  || |/ __/
		 	  \_/    \___/   \_/\_/  |___/ |_|\___|  ]] .. verNum)
	print("------------------------")
	print(dumbQuotes[math.random(1,18)])
	print("------------------------")
	warn("Welcome to Vowels, " .. player.Name .. "!")
	warn("You're on the Stable branch of Vowels")
	warn("Questions or concerns? Let us know in the Discord,")
	warn("or email Earth himself at earthtoaccess@gmail.com!")
	wait(0.5)

	if isMaster then
		warn("---------------------------------------------------------")   
		warn("Loaded in using the Master List! Overriding access given.")
		warn("---------------------------------------------------------")
	end

	-- GUI Instances, Events and Functions

	local vowels = Instance.new("ScreenGui")
	vowels.Name = "vowels"
	vowels.Parent = game:WaitForChild("CoreGui")

	game.CoreGui.ChildRemoved:connect(function(child)
		if child.Name == "vowels" then
			closedforever = true
			buttonsopened = false
			commandsopened = false
			buttonsdebounce = true
			commanddebounce = true
			terminateuis = true
			UIS = nil
			SpeedhackEnabled = nil
			SetSpeed = nil
			IgnorePhysicsEnabled = nil
			AntiGravityEnabled = nil			
			ClickTPEnabled = nil
			FreezeEnabled = nil
			viewing = nil
			TPTargetEnabled = nil
			LoopTPTargetEnabled = nil
			ESPEnabled = nil
			FPSDropping = nil
		end
	end)

	local mouse = player:GetMouse()

	local borders = {}

	local buttonsmain = Instance.new("Frame")
	buttonsmain.Name = "buttonsmain"
	buttonsmain.Position = UDim2.new(1.25, 0, 0.65, 0)
	buttonsmain.Size = UDim2.new(0.4, 0, 0.225, 0)
	table.insert(borders, buttonsmain)

	buttonsdebounce = false
	buttonsopened = true

	local commandsmain = Instance.new("Frame")
	commandsmain.Name = "commandsmain"
	commandsmain.Position = UDim2.new(1.25, 0, 0.45, 0)
	commandsmain.Size = UDim2.new(0.3, 0, 0.175, 0)
	table.insert(borders, commandsmain)

	commanddebounce = false
	commandsopened = true

	closedforever = false

	local frames = {}

	-- Frame for around the buttons.
	local buttonsframe = Instance.new("Frame")
	buttonsframe.Name = "buttonsframe"
	buttonsframe.BackgroundColor3 = Color3.fromRGB(0, 33, 137)
	buttonsframe.BorderColor3 = Color3.fromRGB(128, 128, 128)
	buttonsframe.BorderSizePixel = 2
	buttonsframe.AnchorPoint = Vector2.new(0.5, 0.5)
	buttonsframe.Position = UDim2.new(0.5, 0, 0.5, 0)
	buttonsframe.Size = UDim2.new(0.9, 0, 0.85, 0)
	table.insert(frames, buttonsframe)
	buttonsframe.Parent = buttonsmain

	-- Frame for around the command box.
	local commandsframe = Instance.new("Frame")
	commandsframe.Name = "commandsframe"
	commandsframe.AnchorPoint = Vector2.new(0.5, 0.5)
	commandsframe.BackgroundColor3 = Color3.fromRGB(0, 33, 137)
	commandsframe.BorderColor3 = Color3.fromRGB(128, 128, 128)
	commandsframe.BorderSizePixel = 2
	commandsframe.Position = UDim2.new(0.5, 0, 0.5, 0)
	commandsframe.Size = UDim2.new(0.9, 0, 0.85, 0)
	table.insert(frames, commandsframe)
	commandsframe.Parent = commandsmain

	-- Command box. This is where users type in commands and targets.
	local commandBox = Instance.new("TextBox")
	commandBox.Name = "commandBox"
	commandBox.AnchorPoint = Vector2.new(0.5, 0.5)
	commandBox.BackgroundColor3 = Color3.fromRGB(31, 10, 40)
	commandBox.BorderColor3 = Color3.fromRGB(128, 128, 128)
	commandBox.BorderSizePixel = 2
	commandBox.Position = UDim2.new(0.5, 0, 0.3, 0)
	commandBox.Size = UDim2.new(0.85, 0, 0.20, 0)
	commandBox.Font = Enum.Font.TitilliumWeb
	commandBox.Text = ""
	commandBox.TextColor3 = Color3.fromRGB(251, 251, 255)
	commandBox.TextScaled = true
	commandBox.TextSize = 14.000
	commandBox.TextWrapped = true
	commandBox.ClearTextOnFocus = false
	commandBox.Parent = commandsframe

	local labels = {}

	-- The output for the command box, AKA the white text below that lists your target.
	local commandBoxOutput = Instance.new("TextLabel")
	commandBoxOutput.Name = "commandBoxOutput"
	commandBoxOutput.AnchorPoint = Vector2.new(0.5, 0.5)
	commandBoxOutput.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	commandBoxOutput.BackgroundTransparency = 1.000
	commandBoxOutput.BorderColor3 = Color3.fromRGB(128, 128, 128)
	commandBoxOutput.BorderSizePixel = 0
	commandBoxOutput.Position = UDim2.new(0.5, 0, 0.6, 0)
	commandBoxOutput.Size = UDim2.new(0.9, 0, 0.2, 0)
	commandBoxOutput.Font = Enum.Font.TitilliumWeb
	commandBoxOutput.Text = "Current Target | (None)"
	commandBoxOutput.TextColor3 = Color3.fromRGB(251, 251, 255)
	commandBoxOutput.TextScaled = true
	commandBoxOutput.TextSize = 14.000
	commandBoxOutput.TextWrapped = true
	table.insert(labels, commandBoxOutput)
	commandBoxOutput.Parent = commandsframe

	-- The information above the buttons, e.g. user's name, channel
	local Details = Instance.new("TextLabel")
	Details.Name = "Details"
	Details.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Details.BackgroundTransparency = 1.000
	Details.BorderColor3 = Color3.fromRGB(128, 128, 128)
	Details.Position = UDim2.new(0, 0, 0.0141414143, 0)
	Details.Size = UDim2.new(1, 0, 0.15, 0)
	Details.Font = Enum.Font.TitilliumWeb
	Details.Text = player.Name .. " | Vowels | Stable"
	Details.TextColor3 = Color3.fromRGB(251, 251, 255)
	Details.TextScaled = true
	Details.ZIndex = 5
	Details.TextSize = 14.000
	Details.TextWrapped = true
	table.insert(labels, Details)
	Details.Parent = buttonsframe

	-- "Close this GUI" for the command box.
	local Details2 = Instance.new("TextLabel")
	Details2.Name = "Details2"
	Details2.AnchorPoint = Vector2.new(0.5, 0.5)
	Details2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Details2.BackgroundTransparency = 1.000
	Details2.BorderColor3 = Color3.fromRGB(128, 128, 128)
	Details2.Position = UDim2.new(0.5, 0, 0.9, 0)
	Details2.Size = UDim2.new(1, 0, 0.15, 0)
	Details2.Font = Enum.Font.TitilliumWeb
	Details2.Text = "Press ] to open and close this GUI."
	Details2.TextColor3 = Color3.fromRGB(251, 251, 255)
	Details2.TextScaled = true
	Details2.TextSize = 14.000
	Details2.TextWrapped = true
	table.insert(labels, Details2)
	Details2.Parent = commandsframe

	-- "Close this GUI" for the buttons.
	local Details3 = Instance.new("TextLabel")
	Details3.Name = "Details3"
	Details3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Details3.BackgroundTransparency = 1.000
	Details3.BorderColor3 = Color3.fromRGB(128, 128, 128)
	Details3.Position = UDim2.new(0, 0, 0.875, 0)
	Details3.Size = UDim2.new(1, 0, 0.15, 0)
	Details3.Font = Enum.Font.TitilliumWeb
	Details3.Text = "Press [ to open and close this GUI."
	Details3.TextColor3 = Color3.fromRGB(251, 251, 255)
	Details3.TextScaled = true
	Details3.TextSize = 14.000
	Details3.TextWrapped = true
	table.insert(labels, Details3)
	Details3.Parent = buttonsframe

	-- Script termination instructions.
	local Details4 = Instance.new("TextLabel")
	Details4.Name = "Details4"
	Details4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Details4.BackgroundTransparency = 1.000
	Details4.BorderColor3 = Color3.fromRGB(128, 128, 128)
	Details4.Position = UDim2.new(0, 0, 1.1, 0)
	Details4.Size = UDim2.new(1, 0, 0.175, 0)
	Details4.Font = Enum.Font.TitilliumWeb
	Details4.Text = "Hold the Left and Right arrow keys, then press any key to quit Vowels."
	Details4.TextColor3 = Color3.fromRGB(251, 251, 255)
	Details4.TextScaled = true
	Details4.TextSize = 14.000
	Details4.TextWrapped = true
	Details4.Parent = buttonsframe

	-- The version number above the command box.
	local Version = Instance.new("TextLabel")
	Version.Name = "Version"
	Version.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Version.BackgroundTransparency = 1.000
	Version.BorderColor3 = Color3.fromRGB(128, 128, 128)
	Version.Position = UDim2.new(0, 0, 0.05, 0)
	Version.Size = UDim2.new(1, 0, 0.1, 0)
	Version.Font = Enum.Font.TitilliumWeb
	Version.Text = "Version " .. verNum
	Version.TextColor3 = Color3.fromRGB(251, 251, 255)
	Version.TextScaled = true
	Version.TextSize = 14.000
	Version.TextWrapped = true
	table.insert(labels, Version)
	Version.Parent = commandsframe

	-- The background for the UI.
	local mainframe = Instance.new("ScrollingFrame")
	mainframe.Name = "mainframe"
	mainframe.Active = true
	mainframe.BackgroundColor3 = Color3.fromRGB(68, 48, 74)
	mainframe.BorderColor3 = Color3.fromRGB(128, 128, 128)
	mainframe.BorderSizePixel = 2
	mainframe.Position = UDim2.new(0.5, 0, 0.5, 0)
	mainframe.AnchorPoint = Vector2.new(0.5, 0.5)
	mainframe.Size = UDim2.new(0.867768586, 0, 0.6, 0)
	mainframe.ScrollBarThickness = 6
	mainframe.Parent = buttonsmain

	-- Grid layout for the buttons.
	local UIGridLayout = Instance.new("UIGridLayout")
	UIGridLayout.FillDirection = Enum.FillDirection.Horizontal
	UIGridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIGridLayout.CellPadding = UDim2.new(0, 7, 0, 7)
	UIGridLayout.CellSize = UDim2.new(0.45, 0, 0, 30)
	UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIGridLayout.Parent = mainframe

	local buttons = {}

	------ Buttons for hacks.

	-- 9mm Aimbot

	local PistolAimbot = Instance.new("TextButton")
	PistolAimbot.Name = "PistolAimbot"
	PistolAimbot.Text = "9mm Aimbot (Off)"
	table.insert(buttons, PistolAimbot)

	PistolAimbot.MouseButton1Down:connect(function()
		if PistolAimEnabled == true then
			PistolAimEnabled = false
			PistolAimbot.Text = "9mm Aimbot (Off)"
		else
			PistolAimEnabled = true
			PistolAimbot.Text = "9mm Aimbot (On)"
		end
	end)

	-- Speed hack

	local Speedhack = Instance.new("TextButton")
	Speedhack.Name = "Speedhack"
	Speedhack.Text = "Speedhack [default 64] (Off) [T]"
	table.insert(buttons, Speedhack)

	SpeedhackEnabled = false
	SetSpeed = 64

	function modifySpeed()
		player.Character:FindFirstChild("Humanoid").Changed:connect(function()
			if SpeedhackEnabled and SetSpeed ~= nil then
				player.Character.Humanoid.WalkSpeed = SetSpeed
			else
				return
			end
		end)
	end

	function beginSpeed()
		if SpeedhackEnabled == false then
			SpeedhackEnabled = true
			Speedhack.Text = "Speedhack [default 64] (On) [T]"
			modifySpeed()
			wait()
			player.Character.Humanoid.WalkSpeed = SetSpeed
			while SpeedhackEnabled do
				wait()
				if player.Character.Humanoid.Health == 0 then
					repeat wait() until player.Character.Humanoid.Health ~= 0
					modifySpeed()
					wait()
					player.Character.Humanoid.WalkSpeed = SetSpeed
				end
			end
		else
			SpeedhackEnabled = false
			Speedhack.Text = "Speedhack [default 64] (Off) [T]"
		end
	end

	Speedhack.MouseButton1Down:connect(beginSpeed)

	-- Ignore Physics

	local IgnorePhysics = Instance.new("TextButton")
	IgnorePhysics.Name = "fIgnorePhysics"
	IgnorePhysics.Text = "Ignore Physics (Off) [Z]"
	table.insert(buttons, IgnorePhysics)

	IgnorePhysicsEnabled = false

	local function initialNullifyForces()
		for i, v in pairs(player.Character.HumanoidRootPart:GetChildren()) do
			if v:IsA("BodyGyro") then
				wait()
				v:Destroy()
			elseif v:IsA("BodyPosition") then
				wait()
				v:Destroy()
			elseif v:IsA("BodyVelocity") then
				wait()
				v:Destroy()
			elseif v:IsA("BodyAngularVelocity") then
				wait()
				v:Destroy()
			elseif v:IsA("BodyForce") then
				wait()
				v:Destroy()
			elseif v:IsA("BodyThrust") then
				wait()
				v:Destroy()
			elseif v:IsA("RocketPropulsion") then
				wait()
				v:Destroy()
			end
		end
	end

	local function AfterNullifyForces()
		player.Character.DescendantAdded:connect(function(v)
			if IgnorePhysicsEnabled then
				if v:IsA("BodyGyro") then
					wait()
					v:Destroy()
				elseif v:IsA("BodyPosition") then
					wait()
					v:Destroy()
				elseif v:IsA("BodyVelocity") then
					wait()
					v:Destroy()
				elseif v:IsA("BodyAngularVelocity") then
					wait()
					v:Destroy()
				elseif v:IsA("BodyForce") then
					wait()
					v:Destroy()
				elseif v:IsA("BodyThrust") then
					wait()
					v:Destroy()
				elseif v:IsA("RocketPropulsion") then
					wait()
					v:Destroy()
				end
			end
		end)
	end

	function beginNullifyForces()
		if IgnorePhysicsEnabled == false then
			IgnorePhysicsEnabled = true
			IgnorePhysics.Text = "Ignore Physics (On) [Z]"
			initialNullifyForces()
			AfterNullifyForces()
			while IgnorePhysicsEnabled do
				wait()
				if player.Character.Humanoid.Health == 0 then
					repeat wait() until player.Character.Humanoid.Health ~= 0
					AfterNullifyForces()
				end
			end
		else
			IgnorePhysicsEnabled = false
			IgnorePhysics.Text = "Ignore Physics (Off) [Z]"
		end
	end

	IgnorePhysics.MouseButton1Down:connect(beginNullifyForces)

	-- Anti-Gravity

	local AntiGravity = Instance.new("TextButton")
	AntiGravity.Name = "AntiGravity"
	AntiGravity.Text = "Anti-Gravity (Off) [G]"
	table.insert(buttons, AntiGravity)

	AntiGravityEnabled = false

	function AntiGravityFunc()
		if AntiGravityEnabled == false then
			AntiGravityEnabled = true
			AntiGravity.Text = "Anti-Gravity (On) [G]"
			local BodyForce = Instance.new("BodyForce")
			BodyForce.Parent = player.Character.HumanoidRootPart
			BodyForce.Name = "AntiGravityForce"
			BodyForce.Force = Vector3.new(0, 5000, 0)
		else
			AntiGravityEnabled = false
			AntiGravity.Text = "Anti-Gravity (Off) [G]"
			if player.Character.HumanoidRootPart:FindFirstChild("AntiGravityForce") then
				player.Character.HumanoidRootPart.AntiGravityForce:Destroy()
			end
		end
	end

	AntiGravity.MouseButton1Down:connect(AntiGravityFunc)

	-- Click-TP

	local ClickTP = Instance.new("TextButton")
	ClickTP.Name = "ClickTP"
	ClickTP.Text = "TP to Mouse (Off) [Left Alt]"
	table.insert(buttons, ClickTP)

	ClickTPEnabled = false

	ClickTP.MouseButton1Down:connect(function()
		if ClickTPEnabled == true then
			ClickTPEnabled = false
			ClickTP.Text = "TP to Mouse (Off) [Left Alt]"
		else
			ClickTPEnabled = true
			ClickTP.Text = "TP to Mouse (On) [Left Alt]"
		end
	end)

	function clicktp(position)
		if player == nil or player.Character == nil then return end
		player.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(position.x, position.y + 3, position.z))
	end

	-- Freeze

	local Freeze = Instance.new("TextButton")
	Freeze.Name = "Freeze"
	Freeze.Text = "Freeze (Off) [F]"
	table.insert(buttons, Freeze)

	FreezeEnabled = false

	function FreezeFunc()
		if FreezeEnabled == false then
			FreezeEnabled = true
			Freeze.Text = "Freeze (On) [F]"
			player.Character.HumanoidRootPart.Anchored = true
		else
			FreezeEnabled = false
			Freeze.Text = "Freeze (Off) [F]"
			player.Character.HumanoidRootPart.Anchored = false
		end
	end

	Freeze.MouseButton1Down:connect(FreezeFunc)

	-- Teleport to Target

	local TPTarget = Instance.new("TextButton")
	TPTarget.Name = "TPTarget"
	TPTarget.Text = "Teleport To Target (Off) [U]"
	table.insert(buttons, TPTarget)

	TPTargetEnabled = false

	local function TPToTarget()
		if TPTargetEnabled and target ~= player.Name then
			repeat wait() until getHRP(player.Character) and getHRP(game.Players[target].Character)

			getHRP(player.Character).CFrame = getHRP(game.Players[target].Character).CFrame
		end
	end

	TPTarget.MouseButton1Down:connect(function()
		if TPTargetEnabled == false then
			TPTargetEnabled = true
			TPTarget.Text = "Teleport To Target (On) [U]"
		else
			TPTargetEnabled = false
			TPTarget.Text = "Teleport To Target (Off) [U]"
		end
	end)

	-- Loop Teleport to Target

	local LoopTPTarget = Instance.new("TextButton")
	LoopTPTarget.Name = "LoopTPTarget"
	LoopTPTarget.Text = "Loop Teleport To Target (Off)"
	table.insert(buttons, LoopTPTarget)

	LoopTPTargetEnabled = false

	LoopTPTarget.MouseButton1Down:connect(function()
		if LoopTPTargetEnabled == false then
			LoopTPTargetEnabled = true
			LoopTPTarget.Text = "Loop Teleport To Target (On)"
			while LoopTPTargetEnabled do
				wait()
				TPToTarget()
			end
		else
			LoopTPTargetEnabled = false
			LoopTPTarget.Text = "Loop Teleport To Target (Off)"
		end
	end)

	-- ESP

	local ESP = Instance.new("TextButton")
	ESP.Name = "ESP"
	ESP.Text = "ESP (On) [B]"
	table.insert(buttons, ESP)

	ESPEnabled = true

	local Holder = Instance.new("Folder", game.CoreGui)
	Holder.Name = "ESP"

	local UpdateFuncs = {}

	local Box = Instance.new("BoxHandleAdornment")
	Box.Name = "nilBox"
	Box.Size = Vector3.new(4, 5.5, 1)
	Box.Color3 = Color3.new(100 / 255, 100 / 255, 100 / 255)
	Box.Transparency = 0.7
	Box.ZIndex = 0
	Box.AlwaysOnTop = true
	Box.Visible = true

	local NameTag = Instance.new("BillboardGui")
	NameTag.Name = "nilNameTag"
	NameTag.Enabled = true
	NameTag.Size = UDim2.new(0, 200, 0, 50)
	NameTag.AlwaysOnTop = true
	NameTag.StudsOffset = Vector3.new(0, 3.6, 0)

	local Tag = Instance.new("TextLabel", NameTag)
	Tag.Name = "Tag"
	Tag.BackgroundTransparency = 1
	Tag.Position = UDim2.new(0, -50, 0, 0)
	Tag.Size = UDim2.new(0, 300, 0, 20)
	Tag.TextSize = 20
	Tag.TextColor3 = Color3.new(100 / 255, 100 / 255, 100 / 255)
	Tag.TextStrokeColor3 = Color3.new(0 / 255, 0 / 255, 0 / 255)
	Tag.TextStrokeTransparency = 0.4
	Tag.Text = "Not Available"
	Tag.Font = Enum.Font.TitilliumWeb
	Tag.TextScaled = false
	Tag.TextTransparency = 0

	function LoadCharacter(v)
		if v ~= player then
			repeat wait() until v.Character ~= nil
			v.Character:WaitForChild("Humanoid")
			local vHolder = Holder:FindFirstChild(v.Name)
			vHolder:ClearAllChildren()

			local b = Box:Clone()
			b.Name = v.Name .. "Box"
			b.Adornee = v.Character.HumanoidRootPart
			b.Parent = vHolder

			local t = NameTag:Clone()
			t.Name = v.Name .. "NameTag"
			t.Parent = vHolder
			t.Adornee = v.Character:WaitForChild("HumanoidRootPart", 5)
			if not t.Adornee then
				return UnloadCharacter(v)
			end
			t.Tag.Text = v.Name
			t.Enabled = true
			wait()

			local function UpdateNameTag()
				if not pcall(function()
						-- v.Character.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
						local maxh = math.ceil(v.Character.Humanoid.MaxHealth * 10)
						local h = math.ceil(v.Character.Humanoid.Health * 10)
						t.Tag.Text = v.Name .. "\n" .. ((maxh ~= 0 and tostring(math.ceil((h / maxh) * 100))) or "0") .. "%  " .. tostring(h) .. "/" .. tostring(maxh)
						if ESPEnabled then
							t.Tag.TextTransparency = 0
							b.Transparency = 0.7
						else
							t.Tag.TextTransparency = 1
							b.Transparency = 1
						end
						if h / maxh == 1 then
							t.Tag.TextColor3 = Color3.fromRGB(255, 255, 255)
							b.Color3 = Color3.fromRGB(255, 255, 255)
						elseif h / maxh == 0 then
							t.Tag.TextColor3 = Color3.fromRGB(0, 0, 0)
							b.Color3 = Color3.fromRGB(0, 0, 0)
						else
							t.Tag.TextColor3 = Color3.fromRGB(192, (192 * (h / maxh)), (192 * (h / maxh)))
							b.Color3 = Color3.fromRGB(192, (192 * (h / maxh)), (192 * (h / maxh)))
						end
					end) then
					UpdateFuncs[v] = nil
				end
			end
			UpdateNameTag()
			UpdateFuncs[v] = UpdateNameTag
		end
	end

	function UnloadCharacter(v)
		local vHolder = Holder:FindFirstChild(v.Name)
		if vHolder and (vHolder:FindFirstChild(v.Name .. "Box") ~= nil or vHolder:FindFirstChild(v.Name .. "NameTag") ~= nil) then
			vHolder:ClearAllChildren()
		end
	end

	function LoadPlayer(v)
		if v ~= player then
			local vHolder = Instance.new("Folder", Holder)
			vHolder.Name = v.Name
			v.CharacterAdded:Connect(function()
				if ESPEnabled == true then
					pcall(LoadCharacter, v)
				end
			end)
			v.CharacterRemoving:Connect(function()
				pcall(UnloadCharacter, v)
			end)
			LoadCharacter(v)
		end
	end

	function UnloadPlayer(v)
		UnloadCharacter(v)
		local vHolder = Holder:FindFirstChild(v.Name)
		if vHolder then
			vHolder:Destroy()
		end
	end

	for i, v in pairs(players:GetPlayers()) do
		spawn(function() pcall(LoadPlayer, v) end)
	end

	players.PlayerAdded:Connect(function(v)
		pcall(LoadPlayer, v)
	end)

	players.PlayerRemoving:Connect(function(v)
		pcall(UnloadPlayer, v)
	end)

	game.ItemChanged:Connect(function(i)
		if i:IsA("Player") then
			if Holder:FindFirstChild(i.Name) then
				UnloadCharacter(i)
				wait()
				LoadCharacter(i)
			end
		elseif i:IsA("Humanoid") and i.Parent then
			local p = players:GetPlayerFromCharacter(i.Parent)
			if p ~= player and p ~= nil and Holder:FindFirstChild(p.Name) then
				pcall(function()
					UpdateFuncs[p]()
				end)
			end
		end
	end)

	function toggleESP()
		if ESPEnabled == false then
			ESPEnabled = true
			ESP.Text = "ESP (On) [B]"
			for i,v in pairs(players:GetPlayers()) do
				spawn(function() pcall(LoadPlayer, v) end)
			end
		else
			ESPEnabled = false
			ESP.Text = "ESP (Off) [B]"
			for i, v in pairs(game.Players:GetPlayers()) do
				spawn(function() pcall(UnloadPlayer, v) end)
			end
		end
	end

	ESP.MouseButton1Down:connect(toggleESP)

	-- Rejoin Server Function

	-- This was only preserved as I couldn't think of any other place to put the function for now.
	-- Might get moved later, idunno.
	function rejoin()
		local ts = game:GetService("TeleportService")
		local p = players.LocalPlayer

		ts:Teleport(game.PlaceId, p)
	end

	-- GUI Tweaking

	for i, v in pairs(borders) do
		v.AnchorPoint = Vector2.new(1, 0.5)
		v.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		v.BackgroundTransparency = 0.750
		v.BorderColor3 = Color3.fromRGB(0, 0, 0)
		v.BorderSizePixel = 0
		v.SizeConstraint = Enum.SizeConstraint.RelativeYY
		v.Active = true
		v.Parent = vowels
	end

	for i, v in pairs(buttons) do
		v.BackgroundColor3 = Color3.fromRGB(143, 35, 30)
		v.BorderColor3 = Color3.fromRGB(0, 0, 0)
		v.BorderSizePixel = 2
		v.Position = UDim2.new(0, 0, 0, 0)
		v.Size = UDim2.new(0, 0, 0, 0)
		v.Font = Enum.Font.TitilliumWeb
		v.TextColor3 = Color3.fromRGB(251, 251, 255)
		v.TextScaled = true
		v.TextSize = 14.000
		v.TextWrapped = true
		v.LayoutOrder = i
		v.Parent = mainframe
	end

	--[[for i, v in pairs(buttons) do
		v.BackgroundColor3 = Color3.fromRGB(236, 175, 20)
		v.BorderColor3 = Color3.fromRGB(0, 0, 0)
		v.BorderSizePixel = 2
		v.Position = UDim2.new(0, 0, 0, 0)
		v.Size = UDim2.new(0, 0, 0, 0)
		v.Font = Enum.Font.TitilliumWeb
		v.TextColor3 = Color3.fromRGB(251, 251, 255)
		v.TextScaled = true
		v.TextSize = 14.000
		v.TextWrapped = true
		v.LayoutOrder = i
		v.Parent = mainframe
	end]]

	-- commandBox

	target = player.Name
	targetSetting = "select"
	looping = false
	smartAttack = true
	HealSetting = 1
	stunEnabled = true
	FPSDropping = false
	local buttonHeight = 30
	local buttonGap = 7
	local help1 = [[|| Below is a full, comprehensive list of each command EBGUI has to offer. ||
                                                        
                (Prefix is ;)

                "help [num]" - Shows this commands list! Choose between pages 1 or 2.
                "changelog" - Shows a link to the changelog for EBGUI and its Canary branch.
                "re" - Refreshes your character. This will temporarily vanish you, and bring you back with full stats.
                "tp <map>" - Teleports you to the map of your choice. Heaven doesn't work without the gamepass.
                "declutter" - Clears the backgrounds of the main GUIs, and shrinks the moves/stats.
                "rain" - Enables the rain from Water map. Careful, you have to rejoin to turn it off!
                "fix" - Removes the "LOADING" screen when teleporting to certain maps.
                "buttonheight <num>" - Changes the height, in pixels, of EBGUI's buttons.
                "buttongap <num>" - Changes the gap, in pixels, between EBGUI's buttons.
                "rejoin" - Rejoins the server.
                "aura/off" - An alternate method of silently turning off aura.
                "targetsetting <mode>" - Modifies how EBGUI selects targets. Won't target those in safezone, except in "select" mode.
                    -- "select" allows you to choose by typing into the command box. Set to this by default.
                    -- "closest" selects the person closest to you.
                    -- "farthest" selects the person farthest from you.
                    -- "lowhp" selects the person with the lowest HP.
                    -- "highhp" selects the closest person with the highest HP.]]

	local help2 = [["loop" - Loops the usage of enabled attack exploits.
                "grcharge <num>" - Multiplies the time Amplified Genesis Ray attack exploit stays alive for. Default, 1, lasts 6 seconds.
                "speed <num>" - Changes your default walkspeed. Default, 64, equals max-speed sprinting.
                "smartattack" - Toggles if attack exploits will fire on people who are in safezone. Default on.
                "gamecolor <mode>" - Changes the contrast and saturation of the game.
                    -- "normal" will reset everything to normal.
                    -- "grayscale" turns off the saturation and makes everything gray.
                    -- "inverthue" inverts the hue of everything. Green becomes purple, blue becomes red.
                    -- "invertall" inverts the hue, saturation, and contrast of everything. Negative!
                "blackcast" - Changes all the medals to black when casting spells.
                "stun" - Toggles whether you want to be stunned or not. Not very discreet.
                "drugs" - Randomizes the colors of all magic spells. Requires you to run "colors" first.
                "magiccolor <r> <g> <b>" - Changes the color of all magic spells to an RGB value. Requires you to run "colors" first.
                "colors" - Allows you to run "drugs" and "magiccolor".
                "heal <player>" - Places Blue Arson and Gleaming Harmony at the feet of a player of your choice.
                "e <num 1-3>" - Changes the phase of the Controlled Echoes attack exploit.
                    -- "1" will change it to POW, and is the default.
                    -- "2" will change it to BURN.
                    -- "3" will change it to STUN.
                "origin" - Creates a small, red block at 0, 0, 0 within the world.]]

	local clientid = game:GetService("RbxAnalyticsService"):GetClientId():lower()

	function getHRP(chr)
		local HRP = chr:FindFirstChild("HumanoidRootPart") or chr:FindFirstChild("Torso") or chr:FindFirstChild("UpperTorso")
		return HRP
	end

	function getHUM(chr)
		local HUM = chr:FindFirstChild("Humanoid")
		return HUM
	end

	local function respawn(plr)
		local chr = plr.Character

		if (chr:FindFirstChildOfClass("Humanoid")) then chr:FindFirstChildOfClass("Humanoid"):ChangeState(15) end
		chr:ClearAllChildren()

		local newchr = Instance.new("Model")
		newchr.Parent = workspace
		plr.Character = newchr

		wait()

		plr.Character = chr
		newchr:Destroy()
	end

	local function refresh(plr)
		local hum = plr.Character and plr.Character:FindFirstChildOfClass("Humanoid", true)
		local pos = hum and hum.RootPart and hum.RootPart.CFrame
		local pos1 = workspace.CurrentCamera.CFrame

		respawn(plr)

		spawn(function()
			plr.CharacterAdded:Wait():WaitForChild("Humanoid").RootPart.CFrame, workspace.CurrentCamera.CFrame = pos, wait() and pos1
		end)
	end

	local function splitArgs(command)
		command = string.gsub(command, ",", " ")
		command = string.split(command, " ")

		for i, v in ipairs(command) do
			v = string.gsub(v, "%s+", "")
			if v == "" then
				table.remove(command, i)
			end
		end

		return command
	end

	local function findPlayer(text)
		local players = game.Players:GetPlayers()
		local matches = {}

		for i, Player in ipairs(players) do
			local name = Player.Name
			text = string.lower(text)
			name = string.lower(name)

			local match = string.find(name, text)

			if match then
				table.insert(matches, Player.Name)
			end
		end

		return matches
	end

	local drugsEnabled = false
	local colorsEnabled = false
	local blackcastEnabled = false
	local colorExclude = {"Head","Torso","Left Arm","Left Leg","Right Arm","Right Leg","Shard","Diamond"}

	--[[98/255, 37/255, 209/255]]
	local color1
	local color2
	local color3

	local function termVowels()
		buttonsmain:TweenPosition(
			UDim2.new(1.25, 0, 0.65, 0),
			"In",
			"Sine",
			.5,
			true
		)
		commandsmain:TweenPosition(
			UDim2.new(1.25, 0, 0.45, 0),
			"In",
			"Sine",
			.5,
			true
		)
		wait(1)
		target = player.Name
		vowels:Destroy()
	end

	local function inputBox()
		local text = commandBox.Text
		wait()
		commandBox.Text = ""

		local prefix = ";"
		if string.sub(text, 1, 1) == (prefix) then
			text = string.lower(text)

			if string.sub(text, 1, 3) == (prefix .. "re") then
				refresh(player)
			elseif string.sub(text, 1, 5) == (prefix .. "give") then
				local IR = game:GetService("ReplicatedStorage").AdminUI.ItemRemote
				local item = string.sub(text, 7)
				local givearg = {
					[1] = {
						[1] = player
					},
					[2] = item
				}
				IR:InvokeServer(unpack(givearg))
			elseif string.sub(text, 1, 3) == (prefix .. "tp") then
				local teleportto
				local tpname
				local place = string.sub(text, 5)
				local places = {
					566399244,
					2569625809,
					570158081,
					537600204,
					520568240,
					554955560,
					602048550,
					575456646,
					1713986112,
					1243615612,
					638065302,
					634240826,
					633042731
				}

				if place == "standardlow" or place == "566399244" then
					teleportto = places[1]
					tpname = "Lowbie Standard"
				elseif place == "standard40" or place == "2569625809" then
					teleportto = places[2]
					tpname = "Standard"
				elseif place == "light" or place == "570158081" then
					teleportto = places[3]
					tpname = "Light"
				elseif place == "fire" or place == "537600204" then
					teleportto = places[4]
					tpname = "Fire"
				elseif place == "water" or place == "520568240" then
					teleportto = places[5]
					tpname = "Water"
				elseif place == "grass" or place == "554955560" then
					teleportto = places[6]
					tpname = "Grass"
				elseif place == "heaven" or place == "602048550" then
					teleportto = places[7]
					tpname = "Heaven"
				elseif place == "minilovania" or place == "sans" or place == "575456646" then
					teleportto = places[8]
					tpname = "Minilovania"
				elseif place == "default" or place == "tournament" or place == "1713986112" then
					teleportto = places[9]
					tpname = "Tournament"
				elseif place == "survival" or place == "1243615612" then
					teleportto = places[10]
					tpname = "Survival"
				elseif place == "megastandard" or place == "standardmega" or place == "638065302" then
					teleportto = places[11]
					tpname = "Mega Standard"
				elseif place == "megafire" or place == "firemega" or place == "634240826" then
					teleportto = places[11]
					tpname = "Mega Fire"
				elseif place == "megagrass" or place == "grassmega" or place == "633042731" then
					teleportto = places[13]
					tpname = "Mega Grass"
				else
					commandBoxOutput.Text = "The place was incorrectly specified!"
				end

				if teleportto then
					commandBoxOutput.Text = "Teleporting to " .. tpname .. "!"
					game:GetService("TeleportService"):Teleport(teleportto)
				end
			elseif string.sub(text, 1, 8) == (prefix .. "declutter") then
				player.PlayerGui.Main.Frame1.Size = UDim2.new(0.375, 0, 0.375, 0)
				player.PlayerGui.Main.Frame1.ImageTransparency = 1
				player.PlayerGui.Main.Character.ImageTransparency = 1
				player.PlayerGui.Main.Book.ImageTransparency = 1
				player.PlayerGui.Main.Shop.ImageTransparency = 1
				player.PlayerGui.Main.SkillsBar.Size = UDim2.new(0.375, 0, 0.375, 0)
				player.PlayerGui.Main.SkillsBar.ImageTransparency = 1
			elseif string.sub(text, 1, 5) == (prefix .. "rain") then
				local currentCAM = workspace.CurrentCamera
				local rainSound = Instance.new("Sound")
				rainSound.Looped = true
				rainSound.SoundId = "rbxassetid://283164593"
				rainSound.Volume = 1
				rainSound.Parent = workspace
				rainSound:Play()

				local rainPart = Instance.new("Part")
				rainPart.Size = Vector3.new(300, 300, 300)
				rainPart.Transparency = 1
				rainPart.Anchored = true
				rainPart.CanCollide = false

				local rainEffect = game:GetService("ReplicatedStorage"):WaitForChild("Effects"):WaitForChild("Rain")
				rainEffect.Rate = rainPart.Size.magnitude
				rainEffect.Parent = rainPart

				local ignore = workspace:WaitForChild(".Ignore")
				rainPart.Parent = ignore:WaitForChild(".ServerEffects")

				local fov = 2 * math.tan(math.rad(currentCAM.FieldOfView) / 2)
				local newRay = Ray.new
				local height = Vector3.new(0, 50, 0)
				local depth = CFrame.new(0, fov * 50, -60)

				game:GetService("RunService"):BindToRenderStep("Rain", Enum.RenderPriority.Camera.Value, function()
					local rc = workspace:FindPartOnRayWithIgnoreList(newRay(currentCAM.CFrame.p, height), {ignore})

					if (rc) then
						rainEffect.Enabled = false
						rainSound.Volume = 0.5
						return
					end

					local viewport = currentCAM.ViewportSize

					rainPart.Size = Vector3.new(fov * viewport.x / viewport.y * 50, 0.2, 100)
					rainPart.CFrame = currentCAM.CFrame * depth

					rainEffect.Rate = rainPart.Size.magnitude
					rainEffect.Enabled = true

					rainSound.Volume = 1
				end)
			elseif string.sub(text, 1, 4) == (prefix .. "fix") then
				if player.PlayerGui:WaitForChild("Menu"):FindFirstChild("BlackScreen") then
					player.PlayerGui:WaitForChild("Menu"):FindFirstChild("BlackScreen").Visible = false
					commandBoxOutput.Text = "Fixing the Menu GUI!"
				end
			elseif string.sub(text, 1, 13) == (prefix .. "buttonheight") then
				buttonHeight = tonumber(string.sub(text, 15))
				UIGridLayout.CellSize = UDim2.new(0.45, 0, 0, buttonHeight)
				mainframe.CanvasSize = UDim2.new(0, 0, 0, math.ceil(#buttons / 2) * (buttonHeight + buttonGap) - buttonGap)

				commandBoxOutput.Text = "Button height was set to " .. tonumber(string.sub(text, 15)) .. "!"
			elseif string.sub(text, 1, 10) == (prefix .. "buttongap") then
				buttonGap = tonumber(string.sub(text, 12))
				UIGridLayout.CellPadding = UDim2.new(0, 7, 0, buttonGap)
				mainframe.CanvasSize = UDim2.new(0, 0, 0, math.ceil(#buttons / 2) * (buttonHeight + buttonGap) - buttonGap)

				commandBoxOutput.Text = "Button gap was set to " .. tonumber(string.sub(text, 12)) .. "!"
			elseif string.sub(text, 1, 7) == (prefix .. "rejoin") then
				rejoin()
				commandBoxOutput.Text = "Rejoining..."
			elseif string.sub(text, 1, 9) == (prefix .. "aura/off") then
				repeat wait() until getHRP(player.Character)

				if getHRP(player.Character):FindFirstChild("AuraGP") then
					getHRP(player.Character):FindFirstChild("AuraGP"):Destroy()
					commandBoxOutput.Text = "Aura has been removed."
				else
					commandBoxOutput.Text = "Aura does not exist!"
				end
			elseif string.sub(text, 1, 14) == (prefix .. "targetsetting") then
				targetSetting = string.sub(text, 16)

				repeat
					if targetSetting == "select" then
						commandBoxOutput.Text = "Successfully switched the target setting to select!"
					elseif targetSetting == "closest" then
						commandBoxOutput.Text = "Successfully switched the target setting to closest!"
						while targetSetting == "closest" do
							local nearestPlayers = {}

							for i, v in pairs(game.Players:GetPlayers()) do
								if getHRP(v.Character) and getHRP(player.Character) and v ~= player then
									if smartAttack then
										if not v.Character:FindFirstChild("ForceField") then
											local distance = (getHRP(v.Character).Position - getHRP(player.Character).Position).Magnitude

											table.insert(nearestPlayers, {v.Name, distance})
										end
									else
										local distance = (getHRP(v.Character).Position - getHRP(player.Character).Position).Magnitude

										table.insert(nearestPlayers, {v.Name, distance})
									end
								end
							end

							table.sort(nearestPlayers, 
								function(a, b)
									return a[2] < b[2]
								end
							)

							target = nearestPlayers[1][1] or player.Name

							if target ~= player.Name then
								commandBoxOutput.Text = "Current Target | " .. target
							else
								commandBoxOutput.Text = "Current Target | (None)"
							end

							wait()
						end
					elseif targetSetting == "farthest" then
						commandBoxOutput.Text = "Successfully switched the target setting to farthest!"
						while targetSetting == "farthest" do
							local nearestPlayers = {}

							for i, v in pairs(game.Players:GetPlayers()) do
								if getHRP(v.Character) and getHRP(player.Character) and v ~= player then
									if smartAttack then
										if not v.Character:FindFirstChild("ForceField") then
											local distance = (getHRP(v.Character).Position - getHRP(player.Character).Position).Magnitude

											table.insert(nearestPlayers, {v.Name, distance})
										end
									else
										local distance = (getHRP(v.Character).Position - getHRP(player.Character).Position).Magnitude

										table.insert(nearestPlayers, {v.Name, distance})
									end
								end
							end

							table.sort(nearestPlayers, 
								function(a, b)
									return a[2] > b[2]
								end
							)

							target = nearestPlayers[1][1] or player.Name

							if target ~= player.Name then
								commandBoxOutput.Text = "Current Target | " .. target
							else
								commandBoxOutput.Text = "Current Target | (None)"
							end

							wait()
						end
					elseif targetSetting == "lowhp" then
						commandBoxOutput.Text = "Successfully switched the target setting to lowhp!"
						while targetSetting == "lowhp" do
							local nearestPlayers = {}

							for i, v in pairs(game.Players:GetPlayers()) do
								if getHUM(v.Character) and getHUM(player.Character) and v ~= player then
									if smartAttack then
										if not v.Character:FindFirstChild("ForceField") then
											local health = getHUM(v.Character).Health

											table.insert(nearestPlayers, {v.Name, health})
										end
									else
										local health = getHUM(v.Character).Health

										table.insert(nearestPlayers, {v.Name, health})
									end
								end
							end

							table.sort(nearestPlayers, 
								function(a, b)
									return a[2] < b[2]
								end
							)

							target = nearestPlayers[1][1] or player.Name

							if target ~= player.Name then
								commandBoxOutput.Text = "Current Target | " .. target
							else
								commandBoxOutput.Text = "Current Target | (None)"
							end

							wait()
						end
					elseif targetSetting == "highhp" then
						commandBoxOutput.Text = "Successfully switched the target setting to highhp!"
						while targetSetting == "highhp" do
							local nearestPlayers = {}

							for i, v in pairs(game.Players:GetPlayers()) do
								if getHUM(v.Character) and getHUM(player.Character) and v ~= player then
									if smartAttack then
										if not v.Character:FindFirstChild("ForceField") then
											local health = getHUM(v.Character).Health

											table.insert(nearestPlayers, {v.Name, health})
										end
									else
										local health = getHUM(v.Character).Health

										table.insert(nearestPlayers, {v.Name, health})
									end
								end
							end

							table.sort(nearestPlayers, 
								function(a, b)
									return a[2] > b[2]
								end
							)

							target = nearestPlayers[1][1] or player.Name

							if target ~= player.Name then
								commandBoxOutput.Text = "Current Target | " .. target
							else
								commandBoxOutput.Text = "Current Target | (None)"
							end

							wait()
						end
					else
						targetSetting = "select"
						commandBoxOutput.Text = "Invalid target setting! Did you specify select, closest, farthest, lowhp, or highhp? Setting has been set to select."
					end
				until targetSetting == "select"

				target = player.Name
			elseif string.sub(text, 1, 5) == (prefix .. "loop") then
				if string.sub(text, 7, 7) == ("t") or string.sub(text, 7, 8) == ("on") then
					if looping == true then
						commandBoxOutput.Text = "Looping attacks is already on!"
					else
						looping = true
						commandBoxOutput.Text = "Started looping attacks!"
					end
				elseif string.sub(text, 7, 7) == ("f") or string.sub(text, 7, 9) == ("off") then
					if looping == false then
						commandBoxOutput.Text = "Looping attacks is already off!"
					else
						looping = false
						commandBoxOutput.Text = "Stopped looping attacks!"
					end
				else
					looping = not looping
					local OnOrOff = "On"
					if looping == false then
						OnOrOff = "Off"
					end
					commandBoxOutput.Text = "Toggled looping attacks (" .. OnOrOff .. ")!"
				end

				spawn(function()
					while looping do
						exploit()
						wait()
					end
					return
				end)
			elseif string.sub(text, 1, 9) == (prefix .. "grcharge") then
				GRCharge = tonumber(string.sub(text, 11))
				wait()
				if GRCharge == nil then
					commandBoxOutput.Text = "Invalid Arguments! Did you enter an integer?"
				else
					commandBoxOutput.Text = "Successfully set the charge to " .. GRCharge .. "!"
				end
			elseif string.sub(text, 1, 6) == (prefix .. "speed") then
				SetSpeed = tonumber(string.sub(text, 8))
				wait()
				if SetSpeed == nil then
					commandBoxOutput.Text = "Invalid Arguments! Did you enter an integer?"
				else
					commandBoxOutput.Text = "Successfully set the speed to " .. SetSpeed .. "!"
				end
			elseif string.sub(text, 1, 12) == (prefix .. "smartattack") then
				if string.sub(text, 14, 14) == ("t") or string.sub(text, 14, 15) == ("on") then
					if smartAttack == true then
						commandBoxOutput.Text = "Forcefield detection is already on!"
					else
						smartAttack = true
						commandBoxOutput.Text = "Now detecting forcefields!"
					end
				elseif string.sub(text, 14, 14) == ("f") or string.sub(text, 14, 16) == ("off") then
					if smartAttack == false then
						commandBoxOutput.Text = "Forcefield detection is already off!"
					else
						smartAttack = false
						commandBoxOutput.Text = "Stopped detecting forcefields!"
					end
				else
					smartAttack = not smartAttack
					local OnOrOff = "On"
					if smartAttack == false then
						OnOrOff = "Off"
					end
					commandBoxOutput.Text = "Toggled forcefield detection (" .. OnOrOff .. ")!"
				end
			elseif string.sub(text, 1, 10) == (prefix .. "gamecolor") then
				if not game.Lighting:FindFirstChild("EBGGuiColorCorrection") then
					Instance.new("ColorCorrectionEffect", game.Lighting).Name = "EBGGuiColorCorrection"
					wait()
				end

				if string.sub(text, 12, 17) == "normal" then
					game.Lighting.EBGGuiColorCorrection.Contrast = 0
					game.Lighting.EBGGuiColorCorrection.Saturation = 0
					commandBoxOutput.Text = "Reverting..."
				elseif string.sub(text, 12, 20) == "grayscale" then
					game.Lighting.EBGGuiColorCorrection.Saturation = -1
					commandBoxOutput.Text = "Grayscaling..."
				elseif string.sub(text, 12, 20) == "inverthue" then
					game.Lighting.EBGGuiColorCorrection.Saturation = -2
					commandBoxOutput.Text = "Inverting hue..."
				elseif string.sub(text, 12, 20) == "invertall" then
					game.Lighting.EBGGuiColorCorrection.Contrast = -2
					commandBoxOutput.Text = "Inverting all..."
				else
					commandBoxOutput.Text = "Invalid color mode (or none specified)!"
				end
			elseif string.sub(text, 1, 10) == (prefix .. "blackcast") then
				if string.sub(text, 12, 12) == ("t") or string.sub(text, 12, 13) == ("on") then
					if blackcastEnabled == true then
						commandBoxOutput.Text = "Black casting is already on!"
					else
						blackcastEnabled = true
						commandBoxOutput.Text = "Black casting enabled!"
					end
				elseif string.sub(text, 12, 12) == ("f") or string.sub(text, 12, 14) == ("off") then
					if blackcastEnabled == false then
						commandBoxOutput.Text = "Black casting is already off!"
					else
						blackcastEnabled = false
						commandBoxOutput.Text = "Black casting disabled!"
					end
				else
					blackcastEnabled = not blackcastEnabled
					local OnOrOff = "On"
					if blackcastEnabled == false then
						OnOrOff = "Off"
					end
					commandBoxOutput.Text = "Toggled black casting (" .. OnOrOff .. ")!"
				end
			elseif string.sub(text, 1, 5) == (prefix .. "stun") then
				if string.sub(text, 7, 7) == ("t") or string.sub(text, 7, 8) == ("on") then
					if stunEnabled == true then
						commandBoxOutput.Text = "Stun is already on!"
					else
						stunEnabled = true
						commandBoxOutput.Text = "Stun enabled!"
					end
				elseif string.sub(text, 7, 7) == ("f") or string.sub(text, 7, 9) == ("off") then
					if stunEnabled == false then
						commandBoxOutput.Text = "Stun is already off!"
					else
						stunEnabled = false
						commandBoxOutput.Text = "Stun disabled!"
					end
				else
					stunEnabled = not stunEnabled
					local OnOrOff = "On"
					if stunEnabled == false then
						OnOrOff = "Off"
						for i, connection in pairs(stunConnection) do
							connection:Disable()
						end
					else
						for i, connection in pairs(stunConnection) do
							connection:Enable()
						end
					end
					commandBoxOutput.Text = "Toggled stun (" .. OnOrOff .. ")!"
				end
			elseif string.sub(text, 1, 6) == (prefix .. "drugs") then
				if string.sub(text, 8, 8) == ("t") or string.sub(text, 8, 9) == ("on") then
					if drugsEnabled == true then
						commandBoxOutput.Text = "Drug mode is already on!"
					else
						drugsEnabled = true
						commandBoxOutput.Text = "Drug mode enabled!"
					end
				elseif string.sub(text, 8, 8) == ("f") or string.sub(text, 8, 10) == ("off") then
					if drugsEnabled == false then
						commandBoxOutput.Text = "Drug mode is already off!"
					else
						drugsEnabled = false
						commandBoxOutput.Text = "Drug mode disabled!"
					end
				else
					drugsEnabled = not drugsEnabled
					local OnOrOff = "On"
					if drugsEnabled == false then
						OnOrOff = "Off"
					end
					commandBoxOutput.Text = "Toggled drug mode (" .. OnOrOff .. ")!"
				end
			elseif string.sub(text, 1, 11) == (prefix .. "magiccolor") then
				local stringargs = string.sub(text, 13)
				local args = splitArgs(stringargs)

				if (args[1] == "t") or (args[1] == "on") then
					if (color1 ~= nil) and (color2 ~= nil) and (color3 ~= nil) then
						if colorsEnabled == false then
							colorsEnabled = true
							commandBoxOutput.Text = "Custom magic color enabled!"
						else
							commandBoxOutput.Text = "Custom magic color is already on!"
						end
					else
						commandBoxOutput.Text = "You must have colors set with this command before turning it back on!"
					end
				elseif (args[1] == "f") or (args[1] == "off") then
					if colorsEnabled == true then
						colorsEnabled = false
						commandBoxOutput.Text = "Custom magic color disabled!"
					else
						commandBoxOutput.Text = "Custom magic color is already off!"
					end
				else
					args[1] = tonumber(args[1])
					args[2] = tonumber(args[2])
					args[3] = tonumber(args[3])

					if not args[3] then
						commandBoxOutput.Text = "Invalid Arguments! Did you specify R, G, and B values?"
					else
						if (args[1] ~= nil) and (args[2] ~= nil) and (args[3] ~= nil) then
							local executable = true

							for i = 1, 3, 1 do
								if (args[i] < 0) or (args[i] > 255) then
									executable = false
									break
								end
							end

							if executable == true then
								color1 = args[1]
								color2 = args[2]
								color3 = args[3]

								colorsEnabled = true
								commandBoxOutput.Text = "Custom magic color was set to " .. color1 .. ", " .. color2 .. ", and " .. color3 .. "!"
							else
								commandBoxOutput.Text = "Invalid Arguments! The numbers must be between 0 and 255!"
							end
						else
							commandBoxOutput.Text = "Invalid Arguments! Please use numbers to specify R, G, and B values."
						end
					end
				end
			elseif string.sub(text, 1, 7) == (prefix .. "colors") then
				game.Workspace.DescendantAdded:Connect(function(d)
					spawn(function() 
						pcall(function()
							while true do
								if d.Parent ~= nil then
									if drugsEnabled then
										d.Color = Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))
										wait((math.random(1, 5))/10)
									elseif colorsEnabled then
										if not table.find(colorExclude, d.Name) then 
											d.Color = Color3.fromRGB(color1, color2, color3)
											wait()
										else break end
									else
										break
									end
								else
									break
								end
							end
						end)
					end)

					spawn(function()
						pcall(function()
							if (blackcastEnabled == true) and (d.Parent ~= nil) then
								for i, v in pairs(d:GetChildren()) do
									if v:IsA("Decal") then
										v.Color3 = Color3.fromRGB(0, 0, 0)
									end
								end
							end
						end)
					end)

					spawn(function()
						pcall(function()
							if d:IsA("ParticleEmitter") then			
								while true do
									if d.Parent ~= nil then
										if drugsEnabled then
											d.Color = ColorSequence.new{
												ColorSequenceKeypoint.new(0, Color3.new(math.random(0, 255)/255, math.random(0, 255)/255, math.random(0, 255)/255)),
												ColorSequenceKeypoint.new(1, Color3.new(math.random(0, 255)/255, math.random(0, 255)/255, math.random(0, 255)/255))
											}
											wait((math.random(1, 5))/10)
										elseif colorsEnabled then
											d.Color = ColorSequence.new{
												ColorSequenceKeypoint.new(0, Color3.new(color1/255, color2/255, color3/255)),
												ColorSequenceKeypoint.new(1, Color3.new(color1/255, color2/255, color3/255))
											}
											wait()
										else
											break
										end
									else
										break
									end
								end
							end
						end)
					end)
				end)
			elseif string.sub(text, 1, 2) == (prefix .. "e") then
				local phase = string.sub(text, 4)

				if tonumber(phase) ~= nil then
					phase = math.floor(tonumber(phase))

					if (phase == 1) or (phase == 2) or (phase == 3) then
						EchoesPhase = phase

						local mode = ""

						if EchoesPhase == 1 then
							mode = "(STAR)"
						elseif EchoesPhase == 2 then
							mode = "(FLAME)"
						elseif EchoesPhase == 3 then
							mode = "(SHOCK)"
						end

						commandBoxOutput.Text = "Echoes phase has been changed! " .. mode
					else
						commandBoxOutput.Text = "Phase is invalid! Must be a number between 1 and 3."
					end
				else
					commandBoxOutput.Text = "Phase is invalid! Must be a number between 1 and 3."
				end
			elseif string.sub(text, 1, 10) == (prefix .. "changelog") then
				-- Tag: CHNGLG
				commandBoxOutput.Text = "Done! Hit Ctrl+F9 to view."
				warn("Roblox is dumb and doesn't allow me to load a string with multiple lines here.")
				print("Check https://pastebin.com/raw/fFDpGMAr to see the changelog.")
			elseif string.sub(text, 1, 8) == (prefix .. "origin") then
				xpcall(function()
					local origin = Instance.new("Part")
					origin.Anchored = true
					origin.Parent = game.Workspace[".Ignore"][".ServerEffects"]
					origin.Name = "Origin"
					origin.Material = Enum.Material.Neon
					origin.BrickColor = BrickColor.new("Really red")
					origin.Size = Vector3.new(0.5, 0.5, 0.5)
					origin.Position = Vector3.new(0, 0, 0)
					warn("Made a block at the origin!")
					commandBoxOutput.Text = "Success! Check console for more info"
				end, function(e)
					print("Encountered an error! xpcall says:", e)
					warn('traceback:', debug.traceback())
				end)
			elseif string.sub(text, 1, 6) == (prefix .. "help") then
				warn("Roblox is dumb and isn't formatting multiline strings right.")
				print("For now, check https://pastebin.com/raw/Y74GihGy to see the full list of commands.")
        --[[
    Commands incase they remove the pastebin: 
        "help <num>" - Shows this commands list!            
"changelog" - Shows a link to the changelog for EBGUI and its Canary branch.
"re" - Refreshes your character. This will temporarily vanish you, and bring you back with full stats.
"tp <map>" - Teleports you to the map of your choice. Heaven doesn't work without the gamepass.
"declutter" - Clears the backgrounds of the main GUIs, and shrinks the moves/stats.
"rain" - Enables the rain from Water map. Careful, you have to rejoin to turn it off!
"fix" - Removes the "LOADING" screen when teleporting to certain maps.
"buttonheight <num>" - Changes the height, in pixels, of EBGUI's buttons.
"buttongap <num>" - Changes the gap, in pixels, between EBGUI's buttons.
"rejoin" - Rejoins the server.
"aura/off" - An alternate method of silently turning off aura.
"targetsetting <mode>" - Modifies how EBGUI selects targets. Won't target those in safezone, except in "select" mode.
    -- "select" allows you to choose by typing into the command box. Set to this by default.
    -- "closest" selects the person closest to you.
    -- "farthest" selects the person farthest from you.
    -- "lowhp" selects the person with the lowest HP.
    -- "highhp" selects the closest person with the highest HP.
"loop" - Loops the usage of enabled attack exploits.
"grcharge <num>" - Multiplies the time Amplified Genesis Ray attack exploit stays alive for. Default, 1, lasts 6 seconds.
"speed <num>" - Changes your default walkspeed. Default, 64, equals max-speed sprinting.
"smartattack" - Toggles if attack exploits will fire on people who are in safezone. Default on.
"gamecolor <mode>" - Changes the contrast and saturation of the game.
    -- "normal" will reset everything to normal.
    -- "grayscale" turns off the saturation and makes everything gray.
    -- "inverthue" inverts the hue of everything. Green becomes purple, blue becomes red.
    -- "invertall" inverts the hue, saturation, and contrast of everything. Negative!
"blackcast" - Changes all the medals to black when casting spells.
"stun" - Toggles whether you want to be stunned or not. Not very discreet.
"drugs" - Randomizes the colors of all magic spells. Requires you to run "colors" first.
"magiccolor <r> <g> <b>" - Changes the color of all magic spells to an RGB value. Requires you to run "colors" first.
"colors" - Allows you to run "drugs" and "magiccolor".
"heal <player>" - Places Blue Arson and Gleaming Harmony at the feet of a player of your choice.
"e <num 1-3>" - Changes the phase of the Controlled Echoes attack exploit.
    -- "1" will change it to POW, and is the default.
    -- "2" will change it to BURN.
    -- "3" will change it to STUN.
"origin" - Creates a small, red block at 0, 0, 0 within the world.

        ]]--
				commandBoxOutput.Text = "Done! Hit Ctrl+F9 to view."
			--[[elseif string.sub(text, 1, 6) == (prefix .. "farm") then
				local FarmAnchor = Instance.new("Part")
				FarmAnchor.Anchored = true
				FarmAnchor.CanCollide = true
				FarmAnchor.Position = Vector3.new(0,150000,0)
				FarmAnchor.Parent = game.Workspace
				FarmAnchor.Name = "FarmAnchor"
				FarmAnchor.BrickColor = BrickColor.new("Toothpaste")
				FarmAnchor.Size = Vector3.new(.5,.5,.5)
				FarmAnchor.Material = Enum.Material.Neon
				FarmAnchor.Shape = Enum.PartType.Ball
				commandBoxOutput.Text = "Preparing for teleport..."
				wait(3)
				player.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(0,100003,0))]]
			elseif string.sub(text, 1, 6) == (prefix .. "info") then
        status = "Green"
				if string.sub(text, 7) == "status" then
					print("The current status of Vowels is " .. status)
					commandBoxOutput.Text = "Vowels Status: " .. status
				elseif string.sub(text, 7) == "repo" or string.sub(text, 7) == "github" then
					print("The GitHub repository link is https://github.com/EarthToAccess/Vowels/")
					commandBoxOutput.Text = "Check the console for more info!"
				end
			elseif string.sub(text, 1, 8) == (prefix .. "update") then
				if verNum == "v0.5" then
					commandBoxOutput.Text = "No update required!"
				elseif verNum == "0" then
					commandBoxOutput.Text = "Version outdated! Recent: v0.5"
				else
					commandBoxOutput.Text = "bro ur on a dev build or sm"
				end
			end

			wait(1.5)
			if target ~= player.Name then
				commandBoxOutput.Text = "Current Target | " .. target
			else
				commandBoxOutput.Text = "Current Target | (None)"
			end
		else
			local matches = findPlayer(text)

			if #matches == 1 then
				target = matches[1]
				if matches[1] == player.Name then
					commandBoxOutput.Text = "Current Target | (None)"						
				else
					commandBoxOutput.Text = "Current Target | " .. matches[1]
				end
				wait(1)
			else
				target = player.Name
				warn("Target not found! Do multiple players have that same substring in their names?")
				commandBoxOutput.Text = "Invalid Target! Type their name again."
				wait(1.5)
				if target == player.Name then
					commandBoxOutput.Text = "Current Target | (None)"
				end
			end
		end
	end

	players.PlayerRemoving:connect(function(player)
		if target == player.Name then
			target = game.Players.LocalPlayer.Name
			commandBoxOutput.Text = "Current Target | (Target RQed!)"
		end
	end)

	commandBox.FocusLost:Connect(function(enterPressed)
		if enterPressed then
			if commandBox.Text ~= "" then
				inputBox()
			end
		end
	end)

	coroutine.resume(coroutine.create(function()
		mainframe.CanvasSize = UDim2.new(0, 0, 0, (math.ceil(#buttons * 37) / 2) - 7)
	end))

	local onchat = function(plr, msg)
		local allowed = false
		for _, user in pairs(breakUsers) do
			if plr.Name == user then
				allowed = true
			end
		end

		local prefix = ";"
	end

	for i, v in pairs(players:GetPlayers()) do
		v.Chatted:Connect(function(msg)
			onchat(v, msg)
		end)
	end

	players.PlayerAdded:Connect(function(v)
		v.Chatted:Connect(function(msg)
			onchat(v, msg)
		end)
	end)

	-- Exploits

	local function ff()
		if smartAttack == true then
			if game.Players[target].Character:FindFirstChild("ForceField") then
				return false
			else
				return true
			end
		else
			return true
		end
	end

	function exploit()
		-- Exploit function. When C is pressed and one of these are "true", it will fire it.
		local targetChr = game.Players[target].Character

		-- 9mm Pistol Aimbot
		if not (targetChr == player.Character) then
			if PistolAimEnabled then
				local args = {
					[1] = "Fire",
					[2] = {
						[1] = {
							["Normal"] = mouse.Hit.p,
							["ClientHitSize"] = Vector3.new(1,2,1),
							["Position"] = targetChr.HumanoidRootPart.Position,
							["Instance"] = targetChr.HumanoidRootPart,
							["Distance"] = 0,
							["Material"] = Enum.Material.Plastic
						}
					}
				}
				player.Character:FindFirstChild("9mm").Remote:FireServer(unpack(args))
			end
		end

	end

	-- UIS

	local UIS = game:GetService("UserInputService")
	local terminateuis = false

	UIS.InputBegan:connect(function(input, gp)
		if not terminateuis then
			if not gp then
				local targetChr = game.Players[target].Character

				if input.KeyCode == Enum.KeyCode.BackSlash then
					commandBox:CaptureFocus()
					wait()
					if string.sub(commandBox.Text, string.len(commandBox.Text), string.len(commandBox.Text)) == "\\" then
						commandBox.Text = string.sub(commandBox.Text, 1, string.len(commandBox.Text) - 1)
					end
				elseif input.KeyCode == Enum.KeyCode.C then
					exploit()
				elseif input.KeyCode == Enum.KeyCode.U then
					TPToTarget()
				elseif input.KeyCode == Enum.KeyCode.K then
					AntiBlindFunc()
				elseif input.KeyCode == Enum.KeyCode.T then
					beginSpeed()
				elseif input.KeyCode == Enum.KeyCode.Z then
					beginNullifyForces()
				elseif input.KeyCode == Enum.KeyCode.G then
					AntiGravityFunc()
				elseif input.KeyCode == Enum.KeyCode.LeftAlt then
					if ClickTPEnabled then
						clicktp(mouse.Hit)
					end
				elseif input.KeyCode == Enum.KeyCode.F then
					FreezeFunc()
				elseif input.KeyCode == Enum.KeyCode.V then
					view()
				elseif input.KeyCode == Enum.KeyCode.B then
					toggleESP()
				elseif input.KeyCode == Enum.KeyCode.LeftBracket then
					if not closedforever then
						if not buttonsdebounce then
							buttonsdebounce = true
							if buttonsopened == false then
								buttonsopened = true
								buttonsmain:TweenPosition(
									UDim2.new(1, 0, 0.65, 0),
									"Out",
									"Sine",
									.5,
									true
								)
							else
								buttonsopened = false
								buttonsmain:TweenPosition(
									UDim2.new(1.25, 0, 0.65, 0),
									"In",
									"Sine",
									.5,
									true
								)
							end
							wait(1)
							buttonsdebounce = false
						end
					end
				elseif input.KeyCode == Enum.KeyCode.RightBracket then
					commanddebounce = true
					if commandsopened == false then
						commandsopened = true
						commandsmain:TweenPosition(
							UDim2.new(1, 0, 0.45, 0),
							"Out",
							"Sine",
							.5,
							true
						)
					else
						commandsopened = false
						commandsmain:TweenPosition(
							UDim2.new(1.25, 0, 0.45, 0),
							"In",
							"Sine",
							.5,
							true
						)
					end
					wait(1)
					commanddebounce = false
				elseif UIS:IsKeyDown(Enum.KeyCode.Left) and UIS:IsKeyDown(Enum.KeyCode.Right) then
					commandBoxOutput.Text = "Thanks for using Vowels!"
					wait(2)
					if buttonsopened == true then
						terminateuis = true
						termVowels()
					end
				end
			end
		end
	end)

	-- Scripts and Functions END

	-- Entrance Animation

	wait(0.5)

	buttonsmain:TweenPosition(
		UDim2.new(1, 0, 0.65, 0),
		"Out",
		"Sine",
		.5,
		true
	)

	commandsmain:TweenPosition(
		UDim2.new(1, 0, 0.45, 0),
		"Out",
		"Sine",
		.5,
		true
	)

	-- Info

	print("")
	warn("GUI successfully loaded!")
	commandBoxOutput.Text = "Welcome to Vowels!"
	wait(2)
	commandBoxOutput.Text = "Current Target | (None)"
end
