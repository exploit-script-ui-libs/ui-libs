local CrackedBySyndi = true
if not(game:IsLoaded()) then
	game.Loaded:Wait()
end

if (game.CoreGui:FindFirstChild("ebgui")) then
	game.CoreGui.ebgui:Destroy()
end

local blocklist = {
}

local masterlist = {
	32573334
}

local goldlist = {
	"gold_092022_MaturePlatform_971310"
}

local players = game:GetService("Players")
local player = players.LocalPlayer
local ID = player.UserId
local isBlocked = false
local isMaster = false
local isGold = true

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

if CrackedBySyndi == false then
print(":(")
else
status = "Green"
current = "v2.8"
last = "v2.7.2b"
repo = "https://github.com/EarthToAccess/EBGui/"
	local verNum = "v2.8"
	local dumbQuotes = {
		"Jeez, when'd it get so hot in here?",
		"Is it just me or is that *too* blue?",
		"Like taking candy from a baby.",
		"Deez nuts are too square!",
		"Also try Minecraft!",
		"Also try Terraria!",
		"Meh, I liked Risk of Rain 2 better.",
		"You need a fairly high IQ to understand EBGui.",
		"Jake, from State Farm?!",
		"What would *you* do for a Klondike bar?",
		"Now with 100% more Gold!",
		"Made in Lua!",
		"IF %ERRORLEVEL% EQU 1 GOTO:EOF",
		"bruh nerf solar already",
		"Because the devs won't do it.",
		"Petition YOUR local developer for more updates!",
		"why are you buying clothes at the soup store",
		"I just wanna be a normal GUI with normal knees."
	}

    warn([[______ _____ _____       _ 
            |  ___| ___ \  __ \     (_)
            | |__ | |_/ / |  \/_   _ _ 
            |  __|| ___ \ | __| | | | |
            | |___| |_/ / |_\ \ |_| | |
            \____/\____/ \____/\__,_|_| ]] .. verNum)
	print("------------------------")
	print(dumbQuotes[math.random(1,18)])
	print("------------------------")
	warn("Welcome to EBGui, " .. player.Name .. "!")
	warn("You're on the Stable branch of EBGui")
	warn("Questions or concerns? Let us know in the Discord,")
	warn("or email Earth himself at earthtoaccess@gmail.com!")
	wait(0.5)
	
	if isMaster then
		warn("---------------------------------------------------------")   
		warn("Loaded in using the Master List! Overriding access given.")
		warn("---------------------------------------------------------")
	end

	for i,v in pairs(goldlist) do
		if not EBGuiGold then elseif EBGuiGold == v then
			isGold = true
			print([[				____             ___      ___ 
			           6MMMMb/           `MM      `MM 
			          8P    YM            MM       MM 
			         6M      Y   _____    MM   ____MM 
			         MM         6MMMMMb   MM  6MMMMMM 
			         MM        6M'   `Mb  MM 6M'  `MM 
			         MM     ___MM     MM  MM MM    MM 
			         MM     `M'MM     MM  MM MM    MM 
			         YM      M MM     MM  MM MM    MM 
			          8b    d9 YM.   ,M9  MM YM.  ,MM 
			           YMMMM9   YMMMMM9  _MM_ YMMMMMM_]])
			warn("Thank you for being a GOLDEN member!")
			warn('Enjoy the various "overpowered" scripts we have in store!')
			break
		else end
	end

	-- GUI Instances, Events and Functions

	local ebgui = Instance.new("ScreenGui")
	ebgui.Name = "ebgui"
	ebgui.Parent = game:WaitForChild("CoreGui")

	game.CoreGui.ChildRemoved:connect(function(child)
		if child.Name == "ebgui" then
			closedforever = true
			buttonsopened = false
			commandsopened = false
			buttonsdebounce = true
			commanddebounce = true
			terminateuis = true
			UIS = nil
			breakable = true
			BlazeColumnEnabled = nil
			VineTrapEnabled = nil
			PlasmaImplosionEnabled = nil
			SlimeBuddiesEnabled = nil
			CrystalArmamentEnabled = nil
			AmauroticLambentEnabled = nil
			AblazeJudgementHackEnabled = nil
			VoidOpeningHackEnabled = nil
			SkeletonGrabEnabled = nil
			TheWorldEnabled = nil
			PolarisEnabled = nil
			LagServerEnabled = nil
			ShatteringEruptionEnabled = nil
			IllusiveAtakeEnabled = nil
			EtherealAcumenEnabled = nil
			FormidableRoarEnabled = nil
			SewerBurstEnabled = nil
			ToxicBasiliskEnabled = nil
			SplittingSlimeEnabled = nil
			VirtualZoneEnabled = nil
			AntiBlindEnabled = nil
			AntiLagEnabled = nil
			SpeedhackEnabled = nil
			HolobeamEnabled = nil
			SetSpeed = nil
			IgnorePhysicsEnabled = nil
			AntiGravityEnabled = nil
			InertiaGravityEnabled = nil
			ClickTPEnabled = nil
			FreezeEnabled = nil
			ThrustEnabled = nil
			ThrustPower = nil
			viewing = nil
			TPTargetEnabled = nil
			LoopTPTargetEnabled = nil
			ESPEnabled = nil
			TPShardsEnabled = nil
			TPDiamondsEnabled = nil
			FPSDropping = nil
			sansKilled = "wip"
			AsteroidBeltEnabled = nil
			VigorHackEnabled = nil
			OrbitalHackEnabled = nil
			StormBulletsEnabled = nil
			DoubleRayEnabled = nil
			DispersionEnabled = nil
			DarkAoeEnabled = nil
			HyperangEnabled = nil
			CreationHoldEnabled = nil
			ReaperUltEnabled = nil
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


	--if (initiationMode == "Modern") then
	local commandsmain = Instance.new("Frame")
	commandsmain.Name = "commandsmain"
	commandsmain.Position = UDim2.new(1.25, 0, 0.45, 0)
	commandsmain.Size = UDim2.new(0.3, 0, 0.175, 0)
	table.insert(borders, commandsmain)
	--end

	commanddebounce = false
	commandsopened = true

	closedforever = false

	local frames = {}

	-- Frame for around the buttons.
	local buttonsframe = Instance.new("Frame")
	buttonsframe.Name = "buttonsframe"
	buttonsframe.BackgroundColor3 = Color3.fromRGB(18, 54, 179)
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
	commandsframe.BackgroundColor3 = Color3.fromRGB(18, 54, 179)
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
	commandBox.BackgroundColor3 = Color3.fromRGB(25, 40, 40)
	commandBox.BorderColor3 = Color3.fromRGB(128, 128, 128)
	commandBox.BorderSizePixel = 2
	commandBox.Position = UDim2.new(0.5, 0, 0.3, 0)
	commandBox.Size = UDim2.new(0.85, 0, 0.20, 0)
	commandBox.Font = Enum.Font.Sarpanch
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
	commandBoxOutput.Font = Enum.Font.Sarpanch
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
	Details.Font = Enum.Font.Sarpanch
	if not isGold then
		Details.Text = player.Name .. " | EBGui | Stable"
	else
		Details.Text = player.Name .. " | EBGui Gold | Stable"
	end
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
	Details2.Font = Enum.Font.Sarpanch
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
	Details3.Font = Enum.Font.Sarpanch
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
	Details4.Font = Enum.Font.Sarpanch
	Details4.Text = "Hold the Left and Right arrow keys, then press any key to quit EBGui."
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
	Version.Font = Enum.Font.Sarpanch
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
	mainframe.BackgroundColor3 = Color3.fromRGB(49, 83, 89)
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

	---- AoEs
	-- Instant Blaze Column

	local BlazeColumn = Instance.new("TextButton")
	BlazeColumn.Name = "BlazeColumn"
	BlazeColumn.Text = "Instant Blaze Column (Off)"
	table.insert(buttons, BlazeColumn)

	BlazeColumnEnabled = false

	BlazeColumn.MouseButton1Down:connect(function()
		if BlazeColumnEnabled == false then
			BlazeColumnEnabled = true
			BlazeColumn.Text = "Instant Blaze Column (On)"
		else
			BlazeColumnEnabled = false
			BlazeColumn.Text = "Instant Blaze Column (Off)"
		end
	end)

	-- Amplified Genesis Ray

	local GenesisRay = Instance.new("TextButton")
	GenesisRay.Name = "GenesisRay"
	GenesisRay.Text = "Amplified Genesis Ray (Off)"
	table.insert(buttons, GenesisRay)

	local GenesisRayEnabled = false
	local GRCharge = 1 -- 1000000

	GenesisRay.MouseButton1Down:connect(function()
		if GenesisRayEnabled == false then
			GenesisRayEnabled = true
			GenesisRay.Text = "Amplified Genesis Ray (On)"
		else
			GenesisRayEnabled = false
			GenesisRay.Text = "Amplified Genesis Ray (Off)"
		end
	end)

	-- Creation Hold Hack

	local ChainHold = Instance.new("TextButton")
	ChainHold.Name = "ChainHold"
	ChainHold.Text = "(G) Instant Chain Hack (Off)"
	table.insert(buttons, ChainHold)

	local CreationHoldEnabled = false

	ChainHold.MouseButton1Down:connect(function()
		if isGold or isMaster then
			if not CreationHoldEnabled then
				CreationHoldEnabled = true
				ChainHold.Text = "(G) Instant Chain Hack (On)"
			else
				CreationHoldEnabled = false
				ChainHold.Text = "(G) Instant Chain Hack (Off)"
			end
		else
			ChainHold.Text = "Member Not Gold"
			wait(1)
			ChainHold.Text = "(G) Instant Chain Hack (Off)"
		end
	end)

	-- Instant Vine Trap

	local VineTrap = Instance.new("TextButton")
	VineTrap.Name = "VineTrap"
	VineTrap.Text = "Instant Vine Trap (Off)"
	table.insert(buttons, VineTrap)

	VineTrapEnabled = false

	VineTrap.MouseButton1Down:connect(function()
		if VineTrapEnabled == false then
			VineTrapEnabled = true
			VineTrap.Text = "Instant Vine Trap (On)"
		else
			VineTrapEnabled = false
			VineTrap.Text = "Instant Vine Trap (Off)"
		end
	end)

	-- Illusive Atake Hack

	local IllusiveAtake = Instance.new("TextButton")
	IllusiveAtake.Name = "IllusiveAtake"
	IllusiveAtake.Text = "Illusive Atake Hack (Off)"
	table.insert(buttons, IllusiveAtake)

	IllusiveAtakeEnabled = false

	IllusiveAtake.MouseButton1Down:connect(function()
		if IllusiveAtakeEnabled == false then
			IllusiveAtakeEnabled = true
			IllusiveAtake.Text = "Illusive Atake Hack (On)"
		else
			IllusiveAtakeEnabled = false
			IllusiveAtake.Text = "Illusive Atake Hack (Off)"
		end
	end)

	-- Instant Murky Missiles

	local DarkAoe = Instance.new("TextButton")
	DarkAoe.Name = "DarkAoe"
	DarkAoe.Text = "Instant Murky Missiles (Off)"
	table.insert(buttons, DarkAoe)

	local DarkAoeEnabled = false

	DarkAoe.MouseButton1Down:connect(function()
		if not DarkAoeEnabled then
			DarkAoeEnabled = true
			DarkAoe.Text = "Instant Murky Missiles (On)"
		else
			DarkAoeEnabled = false
			DarkAoe.Text = "Instant Murky Missiles (Off)"
		end
	end)
	
	-- Instant Air Dispersion

	local StormAoe = Instance.new("TextButton")
	StormAoe.Name = "StormAoe"
	StormAoe.Text = "(G) Instant Storm AoE (Off)"
	table.insert(buttons, StormAoe)

	local DispersionEnabled = false

	StormAoe.MouseButton1Down:connect(function()
		if isGold or isMaster then
			if not DispersionEnabled then
				DispersionEnabled = true
				StormAoe.Text = "(G) Instant Storm AoE (On)"
			else
				DispersionEnabled = false
				StormAoe.Text = "(G) Instant Storm AoE (Off)"
			end	
		else
			StormAoe.Text = "Member Not Gold"
			wait(1)
			StormAoe.Text = "(G) Instant Storm AoE (Off)"
		end
	end)

	-- Splitting Slime Hack

	local SplittingSlime = Instance.new("TextButton")
	SplittingSlime.Name = "SplittingSlime"
	SplittingSlime.Text = "Splitting Slime Hack (Off)"
	table.insert(buttons, SplittingSlime)

	SplittingSlimeEnabled = false

	SplittingSlime.MouseButton1Down:connect(function()
		if SplittingSlimeEnabled == false then
			SplittingSlimeEnabled = true
			SplittingSlime.Text = "Splitting Slime Hack (On)"
		else
			SplittingSlimeEnabled = false
			SplittingSlime.Text = "Splitting Slime Hack (Off)"
		end
	end)

	-- Amaurotic Lambent Hack

	local AmauroticLambent = Instance.new("TextButton")
	AmauroticLambent.Name = "AmauroticLambent"
	AmauroticLambent.Text = "Amaurotic Lambent Hack (Off)"
	table.insert(buttons, AmauroticLambent)

	AmauroticLambentEnabled = false

	AmauroticLambent.MouseButton1Down:connect(function()
		if AmauroticLambentEnabled == false then
			AmauroticLambentEnabled = true
			AmauroticLambent.Text = "Amaurotic Lambent Hack (On)"
		else
			AmauroticLambentEnabled = false
			AmauroticLambent.Text = "Amaurotic Lambent Hack (Off)"
		end
	end)

	-- Instant Plasma Implosion

	local PlasmaImplosion = Instance.new("TextButton")
	PlasmaImplosion.Name = "PlasmaImplosion"
	PlasmaImplosion.Text = "Instant Plasma Implosion (Off)"
	table.insert(buttons, PlasmaImplosion)

	PlasmaImplosionEnabled = false

	PlasmaImplosion.MouseButton1Down:connect(function()
		if PlasmaImplosionEnabled == false then
			PlasmaImplosionEnabled = true
			PlasmaImplosion.Text = "Instant Plasma Implosion (On)"
		else
			PlasmaImplosionEnabled = false
			PlasmaImplosion.Text = "Instant Plasma Implosion (Off)"
		end
	end)

	-- Formidable Roar Hack

	local FormidableRoar = Instance.new("TextButton")
	FormidableRoar.Name = "FormidableRoar"
	FormidableRoar.Text = "Formidable Roar Hack (Off)"
	table.insert(buttons, FormidableRoar)

	FormidableRoarEnabled = false

	FormidableRoar.MouseButton1Down:connect(function()
		if FormidableRoarEnabled == false then
			FormidableRoarEnabled = true
			FormidableRoar.Text = "Formidable Roar Hack (On)"
		else
			FormidableRoarEnabled = false
			FormidableRoar.Text = "Formidable Roar Hack (Off)"
		end
	end)

	-- Instant Skeleton Grab

	local SkeletonGrab = Instance.new("TextButton")
	SkeletonGrab.Name = "SkeletonGrab"
	SkeletonGrab.Text = "Instant Skeleton Grab (Off) [AIMED]"
	table.insert(buttons, SkeletonGrab)

	SkeletonGrabEnabled = false

	SkeletonGrab.MouseButton1Down:connect(function()
		if SkeletonGrabEnabled == false then
			SkeletonGrabEnabled = true
			SkeletonGrab.Text = "Instant Skeleton Grab (On) [AIMED]"
		else
			SkeletonGrabEnabled = false
			SkeletonGrab.Text = "Instant Skeleton Grab (Off) [AIMED]"
		end
	end)

	-- Gravitational Field Hack

	local GravitationalField = Instance.new("TextButton")
	GravitationalField.Name = "GravitationalField"
	GravitationalField.Text = "Gravitational Field Hack (Off)"
	table.insert(buttons, GravitationalField)

	GravitationalFieldEnabled = false

	GravitationalField.MouseButton1Down:connect(function()
		if GravitationalFieldEnabled == false then
			GravitationalFieldEnabled = true
			GravitationalField.Text = "Gravitational Field Hack (On)"
		else
			GravitationalFieldEnabled = false
			GravitationalField.Text = "Gravitational Field Hack (Off)"
		end
	end)

	-- Instant Rock Armor

	local RockArmor = Instance.new("TextButton")
	RockArmor.Name = "RockArmor"
	RockArmor.Text = "Instant Rock Armor"
	table.insert(buttons, RockArmor)

	RockArmor.MouseButton1Down:connect(function()
		if player.Character:FindFirstChild("Body Colors") then
			player.Character["Body Colors"]:Destroy()
		end
		RSR.DoClientMagic:FireServer("Earth", "Rock Armor")
		RSR.DoMagic:InvokeServer("Earth", "Rock Armor")
	end)

	---- Player modifications
	-- Slime Buddies Hack

	local SlimeBuddies = Instance.new("TextButton")
	SlimeBuddies.Name = "SlimeBuddies"
	SlimeBuddies.Text = "(G) Slime Buddies Hack (Off)"
	table.insert(buttons, SlimeBuddies)

	local SlimeBuddiesEnabled = false

	SlimeBuddies.MouseButton1Down:connect(function()
		if isGold or isMaster then
			if SlimeBuddiesEnabled == false then
				SlimeBuddiesEnabled = true
				SlimeBuddies.Text = "(G) Slime Buddies Hack (On)"
			else
				SlimeBuddiesEnabled = false
				SlimeBuddies.Text = "(G) Slime Buddies Hack (Off)"
			end
		else
			SlimeBuddies.Text = "Member Not Gold"
			wait(1)
			SlimeBuddies.Text = "(G) Slime Buddies Hack (Off)"
		end
	end)

	-- Inertia Gravity

	local InertiaGravity = Instance.new("TextButton")
	InertiaGravity.Name = "InertiaGravity"
	InertiaGravity.Text = "Inertia Gravity (Off)"
	table.insert(buttons, InertiaGravity)

	InertiaGravityEnabled = false

	InertiaGravity.MouseButton1Down:connect(function()
		if InertiaGravityEnabled == false then
			InertiaGravityEnabled = true
			InertiaGravity.Text = "Inertia Gravity (On)"
			local BodyForce = Instance.new("BodyForce")
			BodyForce.Parent = player.Character.HumanoidRootPart
			BodyForce.Name = "InertiaGravityForce"
			BodyForce.Force = Vector3.new(0, 1638, 0)
		else
			InertiaGravityEnabled = false
			InertiaGravity.Text = "Inertia Gravity (Off)"
			if player.Character.HumanoidRootPart:FindFirstChild("InertiaGravityForce") then
				player.Character.HumanoidRootPart.InertiaGravityForce:Destroy()
			end
		end
	end)

	-- Spectral Embodiment

	local SpectralEmbodiment = Instance.new("TextButton")
	SpectralEmbodiment.Name = "SpectralEmbodiment"
	SpectralEmbodiment.Text = "Spectral Embodiment Keybind (Off) [X]"
	table.insert(buttons, SpectralEmbodiment)

	SpectralEmbodimentEnabled = false

	SpectralEmbodiment.MouseButton1Down:connect(function()
		if SpectralEmbodimentEnabled == false then
			SpectralEmbodimentEnabled = true
			SpectralEmbodiment.Text = "Spectral Embodiment Keybind (On) [X]"
		else
			SpectralEmbodimentEnabled = false
			SpectralEmbodiment.Text = "Spectral Embodiment Keybind (Off) [X]"
		end
	end)

	-- Anti-Blind

	local AntiBlind = Instance.new("TextButton")
	AntiBlind.Name = "AntiBlind"
	AntiBlind.Text = "Anti-Blind (Off) [K]"
	table.insert(buttons, AntiBlind)

	AntiBlindEnabled = false

	local normalFogColor = game.Lighting.FogColor
	local normalFogEnd = game.Lighting.FogEnd
	local normalBrightness = game.Lighting.Brightness
	local normalClockTime = game.Lighting.ClockTime

	local function AntiBlindFunc()
		if AntiBlindEnabled == false then
			AntiBlindEnabled = true
			AntiBlind.Text = "Anti-Blind (On) [K]"
			while AntiBlindEnabled do
				wait()
				game.Lighting.FogColor = normalFogColor
				game.Lighting.FogEnd = normalFogEnd
				game.Lighting.Brightness = normalBrightness
				game.Lighting.ClockTime = normalClockTime
			end
		else
			AntiBlindEnabled = false
			AntiBlind.Text = "Anti-Blind (Off) [K]"
		end
	end

	AntiBlind.MouseButton1Down:connect(AntiBlindFunc)

	player:WaitForChild("PlayerGui").DescendantAdded:Connect(function(d)
		if AntiBlindEnabled then
			if d.Name == "ScreenGui" then
				wait()
				player.PlayerGui.ScreenGui:Destroy()
			elseif d.Name == "Distort" then
				wait()
				player.PlayerGui.Distort:Destroy()
			end
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

	---- Bullets
	-- Hyperang Hack

	local TechRang = Instance.new("TextButton")
	TechRang.Name = "TechRang"
	TechRang.Text = "Hyperang Hack (Off)"
	table.insert(buttons, TechRang)

	local HyperangEnabled = false

	TechRang.MouseButton1Down:connect(function()
		if not HyperangEnabled then
			HyperangEnabled = true
			TechRang.Text = "Hyperang Hack (On)"
		else
			HyperangEnabled = false
			TechRang.text = "Hyperang Hack (Off)"
		end
	end)

	-- Asteroid Belt Hack

	local AsteroidBeltHack = Instance.new("TextButton")
	AsteroidBeltHack.Name = "AsteroidBeltHack"
	AsteroidBeltHack.Text = "Ateroids Belt Hack (Off)"
	table.insert(buttons, AsteroidBeltHack)
	
	local AsteroidBeltEnabled = false
	
	AsteroidBeltHack.MouseButton1Down:connect(function()
		if AsteroidBeltEnabled == false then
			AsteroidBeltEnabled = true
			AsteroidBeltHack.Text = "Asteroid Belt Hack (On)"
		else
			AsteroidBeltEnabled = false
			AsteroidBeltHack.Text = "Ateroids Belt Hack (Off)"
		end
	end)

	-- Vigor Gyration Hack

	local VigGyratHack = Instance.new("TextButton")
	VigGyratHack.Name = "VigGyratHack"
	VigGyratHack.Text = "Vigor Gyration Hack (Off)"
	table.insert(buttons, VigGyratHack)
	
	local VigorHackEnabled = false
	
	VigGyratHack.MouseButton1Down:connect(function()
		if VigorHackEnabled == false then
			VigorHackEnabled = true
			VigGyratHack.Text = "Vigor Gyration Hack (On)"
		else
			VigorHackEnabled = false
			VigGyratHack.Text = "Vigor Gyration Hack (Off)"
		end
	end)

	-- Lightning Barrage Hack

	local Barrage = Instance.new("TextButton")
	Barrage.Name = "Barrage"
	Barrage.Text = "Barrage Hack (Off)"
	table.insert(buttons, Barrage)

	Barrage.MouseButton1Down:connect(function()
		if not StormBulletsEnabled then
			StormBulletsEnabled = true
			Barrage.Text = "Barrage Hack (On)"
		else
			StormBulletsEnabled = false
			Barrage.Text = "Barrage Hack (Off)"
		end
	end)

	---- Blasts
	-- Orbital Strike Hack

	local Orbital = Instance.new("TextButton")
	Orbital.Name = "Oribtal"
	Orbital.Text = "(G) Orbital Strike Hack (Off)"
	table.insert(buttons, Orbital)

	local OrbitalHackEnabled = false

	Orbital.MouseButton1Down:connect(function()
		if isGold or isMaster then
			if not OrbitalHackEnabled then
				OrbitalHackEnabled = true
				Orbital.Text = "(G) Orbital Strike Hack (On)"
			else
				OrbitalHackEnabled = false
				Orbital.Text = "(G) Orbital Strike Hack (Off)"
			end
		else
			Orbital.Text = "Member Not Gold"
			wait(1)
			Orbital.Text = "(G) Orbital Strike Hack (Off)"
		end
	end)

	-- Double Ray Hack

	local DoubleRay = Instance.new("TextButton")
	DoubleRay.Name = "DoubleRay"
	DoubleRay.Text = "(G) Double Ray Hack (Off)"
	table.insert(buttons, DoubleRay)

	DoubleRay.MouseButton1Down:connect(function()
		if isGold or isMaster then
			if not DoubleRayEnabled then
				DoubleRayEnabled = true
				DoubleRay.Text = "(G) Double Ray Hack (On)"
			else
				DoubleRayEnabled = false
				DoubleRay.Text = "(G) Double Ray Hack (Off)"
			end
		else
			DoubleRay.Text = "Member Not Gold"
			wait(1)
			DoubleRay.Text = "(G) Double Ray Hack (Off)"
		end
	end)

	-- Holobeam Camera Attach

	local Holobeam = Instance.new("TextButton")
	Holobeam.Name = "Holobeam"
	Holobeam.Text = "Holobeam Camera Attach (Off)"
	table.insert(buttons, Holobeam)

	HolobeamEnabled = false

	function attachCamera(v)
		if (v ~= nil) then
			if not(viewing) and (v.Name == "Holobeam") then
				game.Workspace.Camera.CameraSubject = game.Workspace['.Ignore']['.Attacks'][v.Name]
			else
				v:Destroy()
				return
			end
			
			v.Transparency = 0

			wait(4)
			if not(viewing) and not(game.Workspace.Camera.CameraSubject == player.Character.Humanoid) then
				game.Workspace.Camera.CameraSubject = player.Character.Humanoid
			end
			
			v:Destroy()
		end
	end
	
	game.Workspace['.Ignore']['.Attacks'].DescendantAdded:Connect(function(v)
		if HolobeamEnabled then
			if (v.Name == "Part") and (player.Character) then
				local distance = (player.Character.HumanoidRootPart.Position - v.Position).Magnitude
				
				if (v.Size == Vector3.new(5, 5, 5)) and (distance < 10) and (v:WaitForChild("BodyVelocity", 1)) and (v:WaitForChild("BodyGyro", 1)) and (v.BodyVelocity.P >= 1250) then
				
					v.Name = "Holobeam"
				
					pcall(function()
						coroutine.resume(coroutine.create(function() 
							attachCamera(v) 
						end))
					end)
					
					local gui = player.PlayerGui.Main.SkillsBar
					
					wait(0.5)
					
					while wait() do
						if not(gui['1'].CD.Text == "...") and not(gui['2'].CD.Text == "...") and not(gui['3'].CD.Text == "...") and not(gui['4'].CD.Text == "...") and not(gui['5'].CD.Text == "...") then
							pcall(function()
								if not(viewing) and not(game.Workspace.Camera.CameraSubject == player.Character.Humanoid) then
									game.Workspace.Camera.CameraSubject = player.Character.Humanoid
								end
			
								v:Destroy()
							end)
							
							break
						end
					end
				end
			end
		end
	end)

	Holobeam.MouseButton1Down:connect(function()
		if HolobeamEnabled == false then
			HolobeamEnabled = true
			Holobeam.Text = "Holobeam Camera Attach (On)"
			
			for i, v in pairs(game.Workspace['.Ignore']['.Attacks']:GetChildren()) do
				if (v.Name == "Part") and (v:WaitForChild("BodyVelocity", 1)) and (v:WaitForChild("BodyGyro", 1)) and (v.BodyVelocity.P >= 1250) then v:Destroy() end
			end
		else
			HolobeamEnabled = false
			Holobeam.Text = "Holobeam Camera Attach (Off)"
		end
	end)

	-- Controlled Echoes

	local Echoes = Instance.new("TextButton")
	Echoes.Name = "Echoes"
	Echoes.Text = "Controlled Echoes (Off)"
	table.insert(buttons, Echoes)

	ControlledEchoesEnabled = false
	EchoesPhase = 1

	Echoes.MouseButton1Down:connect(function()
		if ControlledEchoesEnabled == false then
			ControlledEchoesEnabled = true
			Echoes.Text = "Controlled Echoes (On)"
		else
			ControlledEchoesEnabled = false
			Echoes.Text = "Controlled Echoes (Off)"
		end
	end)

	---- Shields
	-- Crystal Armament Hack

	local CrystalArmament = Instance.new("TextButton")
	CrystalArmament.Name = "CrystalArmament"
	CrystalArmament.Text = "Instant Crystal Armament (Off)"
	table.insert(buttons, CrystalArmament)

	CrystalArmamentEnabled = false

	CrystalArmament.MouseButton1Down:connect(function()
		if CrystalArmamentEnabled == false then
			CrystalArmamentEnabled = true
			CrystalArmament.Text = "Instant Crystal Armament (On)"
		else
			CrystalArmamentEnabled = false
			CrystalArmament.Text = "Instant Crystal Armament (Off)"
		end
	end)

	-- Gravital Globe Hack

	local GravitalGlobe = Instance.new("TextButton")
	GravitalGlobe.Name = "GravitalGlobe"
	GravitalGlobe.Text = "Gravital Globe Hack (Off)"
	table.insert(buttons, GravitalGlobe)

	GravitalGlobeEnabled = false

	GravitalGlobe.MouseButton1Down:connect(function()
		if GravitalGlobeEnabled == false then
			GravitalGlobeEnabled = true
			GravitalGlobe.Text = "Gravital Globe Hack (On)"
		else
			GravitalGlobeEnabled = false
			GravitalGlobe.Text = "Gravital Globe Hack (Off)"
		end
	end)

	---- Ults
	-- Reaper's Rage
	local ReaperUlt = Instance.new("TextButton")
	ReaperUlt.Name = "ReaperUlt"
	ReaperUlt.Text = "(G) Reaper's Rage Hack (Off)"
	table.insert(buttons, ReaperUlt)

	local ReaperUltEnabled = false

	ReaperUlt.MouseButton1Down:connect(function()
		if isGold or isMaster then
			if not ReaperUltEnabled then
				ReaperUltEnabled = true
				ReaperUlt.Text = "(G) Reaper's Rage Hack (On)"
			else
				ReaperUltEnabled = false
				ReaperUlt.Text = "(G) Reaper's Rage Hack (Off)"
			end
		else
			ReaperUlt.Text = "Member Not Gold"
			wait(1)
			ReaperUlt.Text = "(G) Reaper's Rage Hack (Off)"
		end
	end)

	-- Ablaze Judgement Hack

	local AblazeJudgement = Instance.new("TextButton")
	AblazeJudgement.Name = "AblazeJudgement"
	AblazeJudgement.Text = "Ablaze Judgement Hack (Off)"
	table.insert(buttons, AblazeJudgement)

	AblazeJudgementHackEnabled = false

	AblazeJudgement.MouseButton1Down:connect(function()
		if AblazeJudgementHackEnabled == false then
			AblazeJudgementHackEnabled = true
			AblazeJudgement.Text = "Ablaze Judgement Hack (On)"
		else
			AblazeJudgementHackEnabled = false
			AblazeJudgement.Text = "Ablaze Judgement Hack (Off)"
		end
	end)

	-- Void Opening Hack

	local VoidOpening = Instance.new("TextButton")
	VoidOpening.Name = "VoidOpening"
	VoidOpening.Text = "Void Opening Hack (Off)"
	table.insert(buttons, VoidOpening)

	VoidOpeningHackEnabled = false

	VoidOpening.MouseButton1Down:connect(function()
		if VoidOpeningHackEnabled == false then
			VoidOpeningHackEnabled = true
			VoidOpening.Text = "Void Opening Hack (On)"
		else
			VoidOpeningHackEnabled = false
			VoidOpening.Text = "Void Opening Hack (Off)"
		end
	end)

	-- The World Hack

	local TheWorld = Instance.new("TextButton")
	TheWorld.Name = "TheWorld"
	TheWorld.Text = "The World Hack (Off)"
	table.insert(buttons, TheWorld)

	TheWorldEnabled = false

	TheWorld.MouseButton1Down:connect(function()
		if TheWorldEnabled == false then
			TheWorldEnabled = true
			TheWorld.Text = "The World Hack (On)"
		else
			TheWorldEnabled = false
			TheWorld.Text = "The World Hack (Off)"
		end
	end)

	-- Polaris Hack

	local Polaris = Instance.new("TextButton")
	Polaris.Name = "Polaris"
	Polaris.Text = "Polaris Hack (Off)"
	table.insert(buttons, Polaris)

	PolarisEnabled = false

	Polaris.MouseButton1Down:connect(function()
		if PolarisEnabled == false then
			PolarisEnabled = true
			Polaris.Text = "Polaris Hack (On)"
		else
			PolarisEnabled = false
			Polaris.Text = "Polaris Hack (Off)"
		end
	end)

	-- Instant Shattering Eruption

	local ShatteringEruption = Instance.new("TextButton")
	ShatteringEruption.Name = "ShatteringEruption"
	ShatteringEruption.Text = "Instant Shattering Eruption (Off)"
	table.insert(buttons, ShatteringEruption)

	ShatteringEruptionEnabled = false

	ShatteringEruption.MouseButton1Down:connect(function()
		if ShatteringEruptionEnabled == false then
			ShatteringEruptionEnabled = true
			ShatteringEruption.Text = "Instant Shattering Eruption (On)"
		else
			ShatteringEruptionEnabled = false
			ShatteringEruption.Text = "Instant Shattering Eruption (Off)"
		end
	end)

	-- Ethereal Acumen Hack

	local EtherealAcumen = Instance.new("TextButton")
	EtherealAcumen.Name = "EtherealAcumen"
	EtherealAcumen.Text = "Ethereal Acumen Hack (Off)"
	table.insert(buttons, EtherealAcumen)

	EtherealAcumenEnabled = false

	EtherealAcumen.MouseButton1Down:connect(function()
		if EtherealAcumenEnabled == false then
			EtherealAcumenEnabled = true
			EtherealAcumen.Text = "Ethereal Acumen Hack (On)"
		else
			EtherealAcumenEnabled = false
			EtherealAcumen.Text = "Ethereal Acumen Hack (Off)"
		end
	end)

	-- Toxic Basilisk Hack

	local ToxicBasilisk = Instance.new("TextButton")
	ToxicBasilisk.Name = "ToxicBasilisk"
	ToxicBasilisk.Text = "Toxic Basilisk Hack (Off)"
	table.insert(buttons, ToxicBasilisk)

	ToxicBasiliskEnabled = false

	ToxicBasilisk.MouseButton1Down:connect(function()
		if ToxicBasiliskEnabled == false then
			ToxicBasiliskEnabled = true
			ToxicBasilisk.Text = "Toxic Basilisk Hack (On)"
		else
			ToxicBasiliskEnabled = false
			ToxicBasilisk.Text = "Toxic Basilisk Hack (Off)"
		end
	end)

	-- Arcane Guardian Hack

	local ArcaneGuardian = Instance.new("TextButton")
	ArcaneGuardian.Name = "ArcaneGuardian"
	ArcaneGuardian.Text = "Arcane Guardian Hack (Off)"
	table.insert(buttons, ArcaneGuardian)

	ArcaneGuardianEnabled = false

	ArcaneGuardian.MouseButton1Down:connect(function()
		if ArcaneGuardianEnabled == false then
			ArcaneGuardianEnabled = true
			ArcaneGuardian.Text = "Arcane Guardian Hack (On)"
		else
			ArcaneGuardianEnabled = false
			ArcaneGuardian.Text = "Arcane Guardian Hack (Off)"
		end
	end)

	-- Virtual Zone Hack

	local VirtualZone = Instance.new("TextButton")
	VirtualZone.Name = "VirtualZone"
	VirtualZone.Text = "Virtual Zone Hack (Off)"
	table.insert(buttons, VirtualZone)

	VirtualZoneEnabled = false

	VirtualZone.MouseButton1Down:connect(function()
		if VirtualZoneEnabled == false then
			VirtualZoneEnabled = true
			VirtualZone.Text = "Virtual Zone Hack (On)"
		else
			VirtualZoneEnabled = false
			VirtualZone.Text = "Virtual Zone Hack (Off)"
		end
	end)

	---- Miscellaneous
	-- Shard Colors

	local RandomColors = Instance.new("TextButton")
	RandomColors.Name = "RandomColors"
	RandomColors.Text = "Random Shard Colors (Off)"
	table.insert(buttons, RandomColors)

	local ColorsList = {"Really red", "Really blue", "New Yeller", "Hot pink", "Royal purple", "Lime green", "Deep orange", "Toothpaste", "Institutional white"}
	local ShardColorEnabled = false

	local function shardRandomizer()
		for i, child in pairs(game.Workspace[".Ignore"][".ServerEffects"]:GetChildren()) do
			if not child.Name == "Shard" then print("Child not a Shard")
			elseif child.Name == "Shard" and not child:FindFirstChild("CCBool") then
				xpcall(function()
					child.BrickColor = BrickColor.new(ColorsList[math.random(1,9)])
				end, function(e)
					print("Encountered an error! xpcall says:", e)
					warn("[traceback] ", debug.traceback())
				end)
				local CCBool = Instance.new("BoolValue")
				CCBool.Name = "CCBool"
				CCBool.Parent = child
				CCBool.Value = true
			elseif child.Name == "Shard" and child:FindFirstChild("CCBool").Value then end
		end
	end

	RandomColors.MouseButton1Down:connect(function()
		if ShardColorEnabled == false then
			ShardColorEnabled = true
			print("Turned on Random Shard Colors")
			RandomColors.Text = "Random Shard Colors (On)"
			while ShardColorEnabled do
				shardRandomizer()
				wait(1)
			end
		else
			ShardColorEnabled = false
			RandomColors.Text = "Random Shard Colors (Off)"
		end	
	end)

	-- Anti-Lag

	local AntiLag = Instance.new("TextButton")
	AntiLag.Name = "AntiLag"
	AntiLag.Text = "Anti-Lag (Off)"
	table.insert(buttons, AntiLag)

	AntiLagEnabled = false

	function removeLag()
		for i, v in pairs(game.Workspace['.Ignore']['.LocalEffects']:GetChildren()) do
			if v:FindFirstChild("Mesh") and v:FindFirstChild("D1") and v:FindFirstChild("D2") then
				if v.D1.Texture == "rbxassetid://2671622646" then
					v:Destroy()
				end
			elseif v:FindFirstChild("FrontDecal") and v:FindFirstChild("BackDecal") and v:FindFirstChild("SpecialMesh") then
				if v.FrontDecal.Texture == "rbxassetid://979004291" then
					v:Destroy()
				end
			elseif (v.Name == "OrbitalStrike") or (v.Name == "BoltPart") or (string.sub(v.Name, 1, 10) == "Sound_Tech") then
				v:Destroy()
			elseif (v.Name == "LightDisc") then
				v:Destroy()
			end
		end

		for i, v in pairs(game.Workspace['.Ignore']['.Attacks']:GetChildren()) do
			if v.Color == Color3.fromRGB(255, 0, 0) then
				if v.Mesh.MeshType == "Sphere" then
					wait()
					v:Destroy()
				end
			end
		end

		for i, v in pairs(game.Players:GetPlayers()) do
			for _, x in pairs(v.Character:GetChildren()) do
				if x.Name == "AngelSword" then
					x:Destroy()
				end
			end
		end
	end

	game.Workspace.DescendantAdded:connect(function(v)
		if AntiLagEnabled then
			if v:FindFirstChild("Mesh") and v:FindFirstChild("D1") and v:FindFirstChild("D2") then
				if v.D1.Texture == "rbxassetid://2671622646" then
					wait()
					v:Destroy()
				end
			elseif v.Name == "AngelSword" then
				wait()
				v:Destroy()
			elseif v:FindFirstChild("FrontDecal") then
				if v.FrontDecal.Texture == "rbxassetid://979004291" then
					wait()
					v:Destroy()
				end
			elseif v.Color == Color3.fromRGB(255, 0, 0) then
				if v.Mesh.MeshType == "Sphere" then
					wait()
					v:Destroy()
				end
			elseif (v.Name == "OrbitalStrike") or (v.Name == "BoltPart") or (string.sub(v.Name, 1, 10) == "Sound_Tech") then
				wait()
				v:Destroy()
			end
		end
	end)

	AntiLag.MouseButton1Down:connect(function()
		if AntiLagEnabled == false then
			AntiLagEnabled = true
			AntiLag.Text = "Anti-Lag (On)"
			removeLag()
		else
			AntiLagEnabled = false
			AntiLag.Text = "Anti-Lag (Off)"
		end
	end)

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

		for i, v in pairs(player.Character.FlipsHolder:GetChildren()) do
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
	ClickTP.Text = "Click-TP (Off) [J to tp to mouse]"
	table.insert(buttons, ClickTP)

	ClickTPEnabled = false

	ClickTP.MouseButton1Down:connect(function()
		if ClickTPEnabled == true then
			ClickTPEnabled = false
			ClickTP.Text = "Click-TP (Off) [J to Click-TP]"
		else
			ClickTPEnabled = true
			ClickTP.Text = "Click-TP (On) [J to Click-TP]"
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

	-- Infinite Sprint

	local InfSprint = Instance.new("TextButton")
	InfSprint.Name = "InfSprint"
	InfSprint.Text = "(G) Infinite Sprint (Off)"
	table.insert(buttons, InfSprint)

	local InfSprintEnabled = false

	local function SprintRemote()
		while wait(.5) do
			repeat wait() until player.Character ~= nil
			local args = {
				[1] = "Running",
				[2] = false,
			}
			game:GetService("ReplicatedStorage").Remotes.PlayerData:FireServer(unpack(args))
		end
	end

	InfSprint.MouseButton1Down:connect(function()
		if isGold or isMaster then
			if not InfSprintEnabled then
				InfSprintEnabled = true
				InfSprint.Text = "(G) Infinite Sprint (On)"
				SprintRemote()
			else
				InfSprintEnabled = false
				InfSprint.Text = "(G) Infinite Sprint (Off)"
			end				
		end
	end)

	-- Long Flash

	local LFlash = Instance.new("TextButton")
	LFlash.Name = "Flash"
	LFlash.Text = "Long Flash (Off) [` to use]"
	table.insert(buttons, LFlash)

	FlashEnabled = false

	function longflash()
		local mousepos = mouse.Hit.p
		local args = {
			[1] = "Storm",
			[2] = "Lightning Flash"
		}
		RSR.DoClientMagic:FireServer(unpack(args))
		local args = {
			[1] = "Storm",
			[2] = "Lightning Flash",
			[3] = {
				["End"] = mousepos,
				["Origin"] = players.LocalPlayer.Character.HumanoidRootPart.CFrame.p
			}
		}
		RSR.DoMagic:InvokeServer(unpack(args))
	end

	LFlash.MouseButton1Down:connect(function()
		if FlashEnabled == false then
			FlashEnabled = true
			LFlash.Text = "Long Flash (On) [` to use]"
		else
			FlashEnabled = false
			LFlash.Text = "Long Flash (Off) [` to use]"
		end
	end)

	-- View Target

	local ViewTarget = Instance.new("TextButton")
	ViewTarget.Name = "ViewTarget"
	ViewTarget.Text = "View Target (Off) [V]"
	table.insert(buttons, ViewTarget)

	viewing = false

	function view()
		if target ~= player.Name then
			if viewing == false then
				viewing = true
				game.Workspace.Camera.CameraSubject = game.Players[target].Character.Humanoid
				ViewTarget.Text = "View Target (On) [V]"
			else
				viewing = false
				game.Workspace.Camera.CameraSubject = player.Character.Humanoid
				ViewTarget.Text = "View Target (Off) [V]"
			end
		elseif viewing == true then 
			viewing = false
			game.Workspace.Camera.CameraSubject = player.Character.Humanoid
			ViewTarget.Text = "View Target (Off) [V]"
		end
	end

	ViewTarget.MouseButton1Down:connect(view)

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

	-- Standard ESP

	local ESP = Instance.new("TextButton")
	ESP.Name = "ESP"
	ESP.Text = "ESP (Off) [B]"
	table.insert(buttons, ESP)

	ESPEnabled = false

	local Holder = Instance.new("Folder", game.CoreGui)
	Holder.Name = "ESP"

	local UpdateFuncs = {}

	local Box = Instance.new("BoxHandleAdornment")
	Box.Name = "nilBoxG"
	Box.Size = Vector3.new(4, 7, 4)
	Box.Color3 = Color3.new(100 / 255, 100 / 255, 100 / 255)
	Box.Transparency = 0.7
	Box.ZIndex = 0
	Box.AlwaysOnTop = true
	Box.Visible = true

	local NameTag = Instance.new("BillboardGui")
	NameTag.Name = "nilNameTagG"
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
	Tag.Font = Enum.Font.Sarpanch
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
			if GESPEnabled then
				GESPEnabled = false
				ESPEnabled = true
				ESPGold.Text = "Standard ESP Enabled"
				wait(1)
				ESPGold.Text = "(G) Detailed ESP (Off) [M]"
			else
				ESPEnabled = true
			end
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

	-- Gold ESP

	local ESPGold = Instance.new("TextButton")
	ESPGold.Name = "ESPGold"
	if isGold or isMaster then
		GESPEnabled = true
		ESPGold.Text = "(G) Detailed ESP (On) [M]"
	else
		GESPEnabled = false
		ESPGold.Text = "(G) Detailed ESP (Off) [M]"
	end
	table.insert(buttons, ESPGold)

	local GHolder = Instance.new("Folder", game.CoreGui)
	GHolder.Name = "ESPGold"

	local GUpdateFuncs = {}

	local GBox = Instance.new("BoxHandleAdornment")
	GBox.Name = "nilBoxG"
	GBox.Size = Vector3.new(4, 7, 4)
	GBox.Color3 = Color3.new(100 / 255, 100 / 255, 100 / 255)
	GBox.Transparency = 0.7
	GBox.ZIndex = 0
	GBox.AlwaysOnTop = true
	GBox.Visible = true

	local GNameTag = Instance.new("BillboardGui")
	GNameTag.Name = "nilNameTagG"
	GNameTag.Enabled = true
	GNameTag.Size = UDim2.new(0, 200, 0, 50)
	GNameTag.AlwaysOnTop = true
	GNameTag.StudsOffset = Vector3.new(0, 3.6, 0)

	local GTag = Instance.new("TextLabel", GNameTag)
	GTag.Name = "GTag"
	GTag.BackgroundTransparency = 1
	GTag.Position = UDim2.new(0, -50, 0, 0)
	GTag.Size = UDim2.new(0, 300, 0, 20)
	GTag.TextSize = 20
	GTag.TextColor3 = Color3.new(100 / 255, 100 / 255, 100 / 255)
	GTag.TextStrokeColor3 = Color3.new(0 / 255, 0 / 255, 0 / 255)
	GTag.TextStrokeTransparency = 0.4
	GTag.Text = "Not Available"
	GTag.Font = Enum.Font.Sarpanch
	GTag.TextScaled = false
	GTag.TextTransparency = 0

	function GLoadCharacter(v)
		
		local tblPlayerData = {}
		RSR:WaitForChild("PlayerData").OnClientEvent:Connect(function(v, tblData)
			tblPlayerData[v] = tblData
		end)
		
		if v ~= player then
			repeat wait() until v.Character ~= nil
			v.Character:WaitForChild("Humanoid")
			local vHolder = GHolder:FindFirstChild(v.Name)
			vHolder:ClearAllChildren()

			local b = GBox:Clone()
			b.Name = v.Name .. "GBox"
			b.Adornee = v.Character.HumanoidRootPart
			b.Parent = vHolder

			local t = GNameTag:Clone()
			t.Name = v.Name .. "GNameTag"
			t.Parent = vHolder
			t.Adornee = v.Character:WaitForChild("HumanoidRootPart", 5)
			if not t.Adornee then
				return GUnloadCharacter(v)
			end
			t.GTag.Text = v.Name
			t.Enabled = true
			wait()

			local function GUpdateNameTag()
				if not pcall(function()
						-- v.Character.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
						local maxh = math.ceil(v.Character.Humanoid.MaxHealth * 10)
						local h = math.ceil(v.Character.Humanoid.Health * 10)
						local strh = "H: " .. (not(maxh == 0) and tostring(math.ceil(100 * h / maxh)) or 0) .. "% [" .. tostring(h) .. "|" .. tostring(maxh) .. "]"
						--
						local maxm = tblPlayerData[v] and math.ceil(tblPlayerData[v].MaxMana * 10) or 1000
						local m = tblPlayerData[v] and math.ceil(tblPlayerData[v].Mana * 10) or 1000
						local strm = "M: " .. (not(maxm == 0) and tostring(math.ceil(100 * m / maxm)) or 0) .. "% [" .. tostring(m) .. "|" .. tostring(maxm) .. "]"
						--
						local maxs = tblPlayerData[v] and math.ceil(tblPlayerData[v].MaxStamina * 10) or 1000
						local s = tblPlayerData[v] and math.ceil(tblPlayerData[v].Stamina * 10) or 1000
						local strs =  "S: " .. (not(maxs == 0) and tostring(math.ceil(100 * s / maxs)) or 0) .. "% [" .. tostring(s) .. "|" .. tostring(maxs) .. "]"

						t.GTag.Text = v.Name .. ("\n" .. strh) .. ("\n" .. strm) .. ("\n" .. strs)
						
						if GESPEnabled then
							t.GTag.TextTransparency = 0
							b.Transparency = 0.7
						else
							t.GTag.TextTransparency = 1
							b.Transparency = 1
						end
						if h / maxh == 1 then
							t.GTag.TextColor3 = Color3.fromRGB(255, 255, 255)
							b.Color3 = Color3.fromRGB(255, 255, 255)
						elseif h / maxh == 0 then
							t.GTag.TextColor3 = Color3.fromRGB(0, 0, 0)
							b.Color3 = Color3.fromRGB(0, 0, 0)
						else
							t.GTag.TextColor3 = Color3.fromRGB(192, (192 * (h / maxh)), (192 * (h / maxh)))
							b.Color3 = Color3.fromRGB(192, (192 * (h / maxh)), (192 * (h / maxh)))
						end
					end) then
					GUpdateFuncs[v] = nil
				end
			end
			GUpdateNameTag()
			GUpdateFuncs[v] = GUpdateNameTag
		end
	end

	function GUnloadCharacter(v)
		local vHolder = GHolder:FindFirstChild(v.Name)
		if vHolder and (vHolder:FindFirstChild(v.Name .. "GBox") ~= nil or vHolder:FindFirstChild(v.Name .. "GNameTag") ~= nil) then
			vHolder:ClearAllChildren()
		end
	end

	function GLoadPlayer(v)
		if v ~= player then
			local vHolder = Instance.new("Folder", GHolder)
			vHolder.Name = v.Name
			v.CharacterAdded:Connect(function()
				if GESPEnabled == true then
					pcall(GLoadCharacter, v)
				end
			end)
			v.CharacterRemoving:Connect(function()
				pcall(GUnloadCharacter, v)
			end)
			GLoadCharacter(v)
		end
	end

	function GUnloadPlayer(v)
		GUnloadCharacter(v)
		local vHolder = GHolder:FindFirstChild(v.Name)
		if vHolder then
			vHolder:Destroy()
		end
	end

	for i, v in pairs(players:GetPlayers()) do
		spawn(function() pcall(GLoadPlayer, v) end)
	end

	players.PlayerAdded:Connect(function(v)
		pcall(GLoadPlayer, v)
	end)

	players.PlayerRemoving:Connect(function(v)
		pcall(GUnloadPlayer, v)
	end)

	game.ItemChanged:Connect(function(i)
		if i:IsA("Player") then
			if GHolder:FindFirstChild(i.Name) then
				GUnloadCharacter(i)
				wait()
				GLoadCharacter(i)
			end
		elseif i:IsA("Humanoid") and i.Parent then
			local p = players:GetPlayerFromCharacter(i.Parent)
			if p ~= player and p ~= nil and GHolder:FindFirstChild(p.Name) then
				pcall(function()
					GUpdateFuncs[p]()
				end)
			end
		end
	end)

	function toggleESPGold()
		if isGold or isMaster then
			if GESPEnabled == false then
				if ESPEnabled then
					ESPEnabled = false
					GESPEnabled = true
					ESP.Text = "Detailed ESP Enabled"
					wait(1)
					ESP.Text = "ESP (Off) [B]"
				else
					GESPEnabled = true
				end
				ESPGold.Text = "(G) Detailed ESP (On) [M]"
				for i,v in pairs(players:GetPlayers()) do
					spawn(function() pcall(GLoadPlayer, v) end)
				end
			else
				GESPEnabled = false
				ESPGold.Text = "(G) Detailed ESP (Off) [M]"
				for i, v in pairs(game.Players:GetPlayers()) do
					spawn(function() pcall(GUnloadPlayer, v) end)
				end
			end
		else
			ESPGold.Text = "Member Not Gold"
			wait(3)
			ESPGold.Text = "(G) Detailed ESP (Off) [M]"
		end
	end

	ESPGold.MouseButton1Down:connect(toggleESPGold)

	-- TP to Drops

	local TPShards = Instance.new("TextButton")
	TPShards.Name = "TPShards"
	TPShards.Text = "Teleport to Shards (Off)"
	table.insert(buttons, TPShards)

	TPShardsEnabled = false	

	local TPDiamonds = Instance.new("TextButton")
	TPDiamonds.Name = "TPDiamonds"
	TPDiamonds.Text = "Teleport to Diamonds (Off)"
	table.insert(buttons, TPDiamonds)

	TPDiamondsEnabled = false

	local plate = Instance.new("Part")
	plate.Parent = game.Workspace
	plate.Size = Vector3.new(40, 1, 40)
	plate.Position = Vector3.new(0, 100000, 0)
	plate.Anchored = true
	plate.Reflectance = 0.5
	plate.Transparency = 0.5

	local time = 0
	local canInvis = false

	function teleportToDrops()
		local hrp = player.Character:WaitForChild("HumanoidRootPart")
		for i, v in pairs(game.Workspace['.Ignore']['.ServerEffects']:GetChildren()) do
			if TPShardsEnabled and v.Name == "Shard" then
				hrp.CFrame = v.CFrame
				wait(.2)
			elseif TPDiamondsEnabled and v.Name == "Diamond" then
				hrp.CFrame = v.CFrame
				wait(.2)
			end

			if canInvis then
				if time == 5 then 
					break
				end
			end
		end

		hrp.CFrame = CFrame.new(Vector3.new(0, 100003, -10))

		return 
	end


	function startTimer()
		local hrp = player.Character:WaitForChild("HumanoidRootPart")
		while wait() do
			if TPShardsEnabled or TPDiamondsEnabled then
				if time ~= 0 then return
				else
					if canInvis then
						RSR.DoClientMagic:FireServer("Spirit", "Spectral Embodiment")
						RSR.DoMagic:InvokeServer("Spirit", "Spectral Embodiment")
						wait(1)
						repeat
							spawn(function() pcall(teleportToDrops) end)
							time = time + 1
							wait(1)
						until time == 6
						hrp.CFrame = CFrame.new(Vector3.new(0, 100003, -10))
						wait(7.5)
						time = 0
					else
						while true do
							if not TPShardsEnabled and not TPDiamondsEnabled then
								break
							end
							spawn(function() pcall(teleportToDrops) end)
							wait(1)
						end
					end
				end
			else
				break
			end
		end

		return
	end

	TPShards.MouseButton1Down:connect(function()
		if player:WaitForChild("PlayerGui"):WaitForChild("Main").Character.Available.ScrollingFrame.Frame:FindFirstChild("Spectral Embodiment") then
			canInvis = true
		end
		if TPShardsEnabled == false then
			TPShardsEnabled = true
			TPShards.Text = "Teleport to Shards (On)"
			startTimer()
			while TPShardsEnabled do
				wait()
				if player.Character.Humanoid.Health == 0 then
					repeat wait() until player.Character.Humanoid.Health ~= 0
					startTimer()
				end
			end
		else
			TPShardsEnabled = false
			TPShards.Text = "Teleport to Shards (Off)"
		end
	end)

	TPDiamonds.MouseButton1Down:connect(function()
		if player:WaitForChild("PlayerGui"):WaitForChild("Main").Character.Available.ScrollingFrame.Frame:FindFirstChild("Spectral Embodiment") then
			canInvis = true
		end
		if TPDiamondsEnabled == false then
			TPDiamondsEnabled = true
			TPDiamonds.Text = "Teleport to Diamonds (On)"
			startTimer()
			while TPDiamondsEnabled do
				wait()
				if player.Character.Humanoid.Health == 0 then
					repeat wait() until player.Character.Humanoid.Health ~= 0
					startTimer()
				end
			end
		else
			TPDiamondsEnabled = false
			TPDiamonds.Text = "Teleport to Diamonds (Off)"
		end
	end)

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
		v.Parent = ebgui
	end

	for i, v in pairs(buttons) do
		v.BackgroundColor3 = Color3.fromRGB(236, 20, 115)
		v.BorderColor3 = Color3.fromRGB(0, 0, 0)
		v.BorderSizePixel = 2
		v.Position = UDim2.new(0, 0, 0, 0)
		v.Size = UDim2.new(0, 0, 0, 0)
		v.Font = Enum.Font.Sarpanch
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
		v.Font = Enum.Font.Sarpanch
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

	RSR = game.ReplicatedStorage:WaitForChild("Remotes")

	local stunConnection = getconnections(RSR:WaitForChild("Combat").OnClientEvent)
	local laggers = {
		"1B0F98BE-E10B-4674-9FB4-6F65171A347F", -- log
		"6A33104A-1FE9-4FA8-9374-C164D28F8351", -- brian
		"837736AA-0192-47F9-98C5-8DD0DF18FE74", -- jet
		"55C2049D-C6BD-4523-8804-D539C38792A3", -- pentaract
		"9464B68A-363C-41F8-BB7D-B4BED8AC0963", -- vastorio
		-- "830BD4E9-5EBE-4A13-B47B-9BE60083B836", -- lolok
		-- "63B39E27-DA1B-482E-B28C-6A3398C95A4C", -- alex
		"846A65E2-E963-4A0A-9025-E9B8E9589613", -- bram
		"3F168440-A5C0-4F71-8E51-3FDF9025F51B", -- tomek
		"6A97052A-634E-47E1-8D90-5EE3CA4A96FA", -- raven
		"F5975D7D-2AC5-44AA-801F-827625D6D763", -- alexia
		"48287182-9E77-4F97-A654-97069ED8166C", -- jess
		"7489CBAE-7986-45A9-BE40-A218EDCD0F01" -- cephas
	}

	local clientid = game:GetService("RbxAnalyticsService"):GetClientId():lower()
	local allowedToDropFPS = true

	for i, v in pairs(laggers) do
		v = v:lower()

		if (v == clientid) then
			allowedToDropFPS = true
		end
	end

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

	local function termEBGui()
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
		ebgui:Destroy()
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
			elseif string.sub(text, 1, 8) == (prefix .. "unbreak") then
				breakable = false
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
			elseif string.sub(text, 1, 5) == (prefix .. "heal") then
				local stringargs = string.sub(text, 7)
				local args = splitArgs(stringargs)

				if args[1] then				
					if (#(findPlayer(args[1])) == 1) then
						local healingPlayer = findPlayer(args[1])[1]
						local chr = game.Players[healingPlayer].Character

						if chr then
							commandBoxOutput.Text = "Healing " .. findPlayer(args[1])[1] .. "..."
							RSR.DoClientMagic:FireServer("Crystal", "Gleaming Harmony")
							RSR.DoMagic:InvokeServer("Crystal", "Gleaming Harmony", chr.HumanoidRootPart.Position)
							RSR.DoClientMagic:FireServer("Phoenix", "Blue Arson")
							RSR.DoMagic:InvokeServer("Phoenix", "Blue Arson", chr.HumanoidRootPart.Position)
							if chr == player.Character then
								RSR.DoClientMagic:FireServer("Angel","Angelic Aura")
								RSR.DoMagic:InvokeServer("Angel","Angelic Aura")
							end
						end
					end
				end
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

        --[[
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
				if string.sub(text, 7) == "status" then
					print("The current status of EBGui is " .. status)
					commandBoxOutput.Text = "EBGui Status: " .. status
				elseif string.sub(text, 7) == "repo" or string.sub(text, 7) == "github" then
					print("The GitHub repository link is " .. repo)
					commandBoxOutput.Text = "Check the console for more info!"
				end
			elseif string.sub(text, 1, 8) == (prefix .. "update") then
				if verNum == current then
					commandBoxOutput.Text = "No update required!"
				elseif verNum == last then
					commandBoxOutput.Text = "Version outdated! Recent: " .. version
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

	-- Breaking Script Users

	breakable = true

	local breakUsers = {
		1864380581,
		182133293,
		297615231,
		1128114944,
		1956413079,
		311027204,
		1903165405,
		1933734956,
		1812053632,
		1906311902,
		1993224724,
		1944531665,
		108045023
	}

	local onchat = function(plr, msg)
		local allowed = false
		for _, user in pairs(breakUsers) do
			if plr.Name == user then
				allowed = true
			end
		end

		local prefix = ";"

		if string.sub(msg, 1, 7) == (prefix .. "break ") then
			local matches = {}

			for i, Player in ipairs(game.Players:GetPlayers()) do
				local name = Player.Name
				msg = string.lower(string.sub(msg, 8))
				name = string.lower(name)
				local term = string.sub(name, 1, string.len(name))

				local match = string.find(term, msg)

				if match then
					table.insert(matches, Player.Name)
				end
			end

			if matches[1] == player.Name and breakable and allowed then
				while true do

				end
			end
		end
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

		if ReaperUltEnabled then
			RSR.DoClientMagic:FireServer("Reaper", "Reaper's Rage")
			local args = {
				[1] = "Reaper",
				[2] = "Reaper's Rage",
				[3] = targetChr.HumanoidRootPart.CFrame
			}
			RSR.DoMagic:InvokeServer(unpack(args))
		end		

		if CreationHoldEnabled then
			RSR.DoClientMagic:FireServer("Creation", "Continuous Strikes")
			local args = {
				[1] = "Creation",
				[2] = "Continuous Strikes",
				[3] = {
					["CF"] = targetChr.HumanoidRootPart.CFrame,
					["Charge"] = 2
				}
			}
			RSR.DoMagic:InvokeServer(unpack(args))
		end

		if HyperangEnabled then
			RSR.DoClientMagic:FireServer("Technology", "Hyperang")
			RSR.DoMagic:InvokeServer("Technology", "Hyperang", targetChr.HumanoidRootPart.CFrame)
		end

		if DarkAoeEnabled then
			RSR.DoClientMagic:FireServer("Darkness", "Murky Missiles")
			RSR.DoMagic:InvokeServer("Darkness", "Murky Missiles", {lastMousePosition = CFrame.new(targetChr.HumanoidRootPart.Position)})
		end

		if DispersionEnabled then
			RSR.DoClientMagic:FireServer("Storm", "Lightning Dispersion")
			RSR.DoMagic:InvokeServer("Storm", "Lightning Dispersion", {Grounded = true})
		end

		if DoubleRayEnabled and ff() == true then
			local args = {
				[1] = "Solar",
				[2] = "Double Ray"
			}			
			RSR.DoClientMagic:FireServer(unpack(args))			
			local args = {
				[1] = "Solar",
				[2] = "Double Ray",
				[3] = targetChr.HumanoidRootPart.CFrame * CFrame.Angles(math.rad(90), 0, 0)
			}			
			RSR.DoMagic:InvokeServer(unpack(args))
		end

		if StormBulletsEnabled and ff() == true then
			local args = {
				[1] = "Storm",
				[2] = "Lightning Barrage"
			}			
			RSR.DoClientMagic:FireServer(unpack(args))			
			local args = {
				[1] = "Storm",
				[2] = "Lightning Barrage",
				[3] = {
					["Direction"] = targetChr.HumanoidRootPart.CFrame * CFrame.Angles(math.rad(90), 0, 0)
				}
			}			
			RSR.DoMagic:InvokeServer(unpack(args))
		end

		if OrbitalHackEnabled and ff() == true then
			local args = {
				[1] = "Technology",
				[2] = "Orbital Strike"
			}
			RSR.DoClientMagic:FireServer(unpack(args))
			local args = {
				[1] = "Technology",
				[2] = "Orbital Strike",
				[3] = CFrame.new(targetChr.HumanoidRootPart.Position)
			}
			RSR.DoMagic:InvokeServer(unpack(args))
		end

		if VigorHackEnabled and ff() == true then
			local args = {
				[1] = "Spirit",
				[2] = "Vigor Gyration"
			}
			RSR.DoClientMagic:FireServer(unpack(args))
			local args = {
				[1] = "Spirit",
				[2] = "Vigor Gyration",
				[3] = {
					[1] = CFrame.new(targetChr.HumanoidRootPart.Position),
					[2] = CFrame.new(targetChr.HumanoidRootPart.Position),
					[3] = CFrame.new(targetChr.HumanoidRootPart.Position),
					[4] = CFrame.new(targetChr.HumanoidRootPart.Position),
					[5] = CFrame.new(targetChr.HumanoidRootPart.Position),
					[6] = CFrame.new(targetChr.HumanoidRootPart.Position),
					[7] = CFrame.new(targetChr.HumanoidRootPart.Position),
					[8] = CFrame.new(targetChr.HumanoidRootPart.Position),
					[9] = CFrame.new(targetChr.HumanoidRootPart.Position),
					[10] = CFrame.new(targetChr.HumanoidRootPart.Position),
					[11] = CFrame.new(targetChr.HumanoidRootPart.Position)
				}
			}
			RSR.DoMagic:InvokeServer(unpack(args))
		end

		if AsteroidBeltEnabled and ff() == true then
			local args = {
				[1] = "Space",
				[2] = "Asteroid Belt"
			}
			RSR.DoClientMagic:FireServer(unpack(args))
			local args = {
				[1] = "Space",
				[2] = "Asteroid Belt",
				[3] = {
					[1] = CFrame.new(targetChr.HumanoidRootPart.Position),
					[2] = CFrame.new(targetChr.HumanoidRootPart.Position),
					[3] = CFrame.new(targetChr.HumanoidRootPart.Position),
					[4] = CFrame.new(targetChr.HumanoidRootPart.Position),
					[5] = CFrame.new(targetChr.HumanoidRootPart.Position),
					[6] = CFrame.new(targetChr.HumanoidRootPart.Position),
					[7] = CFrame.new(targetChr.HumanoidRootPart.Position),
					[8] = CFrame.new(targetChr.HumanoidRootPart.Position),
					[9] = CFrame.new(targetChr.HumanoidRootPart.Position),
					[10] = CFrame.new(targetChr.HumanoidRootPart.Position),
					[11] = CFrame.new(targetChr.HumanoidRootPart.Position)
				}
			}
			RSR.DoMagic:InvokeServer(unpack(args))
		end

		if BlazeColumnEnabled and ff() == true then
			RSR.DoClientMagic:FireServer("Fire", "Blaze Column", Vector3.new(targetChr.HumanoidRootPart.Position))
			RSR.DoMagic:InvokeServer("Fire", "Blaze Column", CFrame.new(targetChr.HumanoidRootPart.Position))
		end

		if VineTrapEnabled and ff() == true then
			RSR.DoClientMagic:FireServer("Nature", "Vine Trap", Vector3.new(targetChr.HumanoidRootPart.Position))
			RSR.DoMagic:InvokeServer("Nature", "Vine Trap", CFrame.new(targetChr.HumanoidRootPart.Position))
		end

		if PlasmaImplosionEnabled and ff() == true then
			RSR.DoClientMagic:FireServer("Plasma", "Plasma Implosion", Vector3.new(targetChr.HumanoidRootPart.Position))
			RSR.DoMagic:InvokeServer("Plasma", "Plasma Implosion", CFrame.new(targetChr.HumanoidRootPart.Position))
		end

		if SlimeBuddiesEnabled and ff() == true then
			RSR.DoClientMagic:FireServer("Slime", "Slime Buddies")
			RSR.DoMagic:InvokeServer("Slime", "Slime Buddies", targetChr.HumanoidRootPart.CFrame)
		end

		if CrystalArmamentEnabled and ff() == true then
			RSR.DoClientMagic:FireServer("Crystal", "Crystal Armament")
			RSR.DoMagic:InvokeServer("Crystal", "Crystal Armament", {LastPosition = targetChr.HumanoidRootPart.Position + Vector3.new(0, 15, 0)})
		end

		if GravitalGlobeEnabled and ff() == true then
			RSR.DoClientMagic:FireServer("Gravity", "Gravital Globe")
			RSR.DoMagic:InvokeServer("Gravity", "Gravital Globe", {lastPos = targetChr.HumanoidRootPart.Position + Vector3.new(0, 15, 0)})
		end

		if GravitationalFieldEnabled and ff() == true then
			RSR.DoClientMagic:FireServer("Gravity", "Gravitational Field")
			RSR.DoMagic:InvokeServer("Gravity", "Gravitational Field", targetChr.HumanoidRootPart.CFrame - Vector3.new(0, 15, 0))
		end

		if AmauroticLambentEnabled and ff() == true then
			RSR.DoClientMagic:FireServer("Light", "Amaurotic Lambent")
			RSR.DoMagic:InvokeServer("Light", "Amaurotic Lambent", {lastPos = targetChr.HumanoidRootPart.Position})
		end

		if AblazeJudgementHackEnabled and ff() == true then
			RSR.DoClientMagic:FireServer("Light", "Ablaze Judgement")
			RSR.DoMagic:InvokeServer("Light", "Ablaze Judgement", {Origin = targetChr.HumanoidRootPart.Position - Vector3.new(0, 25, 0), orbPos = targetChr.HumanoidRootPart.Position - Vector3.new(0, 10, 0)})
		end

		if VoidOpeningHackEnabled and ff() == true then
			RSR.DoClientMagic:FireServer("Void", "Void Opening")
			RSR.DoMagic:InvokeServer("Void", "Void Opening", {pos = targetChr.HumanoidRootPart.Position - Vector3.new(0, 150, 0)})
		end

		if SkeletonGrabEnabled then
			RSR.DoClientMagic:FireServer("Nightmare", "Skeleton Grab")
			RSR.DoMagic:InvokeServer("Nightmare", "Skeleton Grab", targetChr.HumanoidRootPart.CFrame)
		end

		if GenesisRayEnabled then
			RSR.DoClientMagic:FireServer("Time", "Genesis Ray", player.Character.HumanoidRootPart.Position)
			RSR.DoMagic:InvokeServer("Time", "Genesis Ray", {lv = Vector3.new(0, 0, 0), charge = GRCharge})
		end

		if TheWorldEnabled and ff() == true then
			RSR.DoClientMagic:FireServer("Time", "The World", targetChr.HumanoidRootPart.Position)
			RSR.DoMagic:InvokeServer("Time", "The World", {rhit = targetChr.HumanoidRootPart, norm = Vector3.new(0, 0, 0), rpos = targetChr.HumanoidRootPart.Position})
		end

		if PolarisEnabled and ff() == true then
			RSR.DoClientMagic:FireServer("Aurora", "Polaris")
			RSR.DoMagic:InvokeServer("Aurora", "Polaris", targetChr.HumanoidRootPart.CFrame)
		end

		if ControlledEchoesEnabled and EchoesPhase ~= nil then
			RSR.DoClientMagic:FireServer("Sound", "Echoes")
			RSR.DoMagic:InvokeServer("Sound", "Echoes", {EchoesPhase, mouse.Hit.p})
		end

		if ShatteringEruptionEnabled and ff() == true then
			RSR.DoClientMagic:FireServer("Explosion", "Shattering Eruption")
			RSR.DoMagic:InvokeServer("Explosion", "Shattering Eruption", targetChr.HumanoidRootPart.CFrame)
		end

		if IllusiveAtakeEnabled and ff() == true then
			RSR.DoClientMagic:FireServer("Illusion", "Illusive Atake")
			RSR.DoMagic:InvokeServer("Illusion", "Illusive Atake", targetChr.HumanoidRootPart.CFrame)
		end

		if EtherealAcumenEnabled and ff() == true then
			RSR.DoClientMagic:FireServer("Illusion", "Ethereal Acumen")
			RSR.DoMagic:InvokeServer("Illusion", "Ethereal Acumen", targetChr.HumanoidRootPart.CFrame)
		end

		if FormidableRoarEnabled and ff() == true then
			RSR.DoClientMagic:FireServer("Dragon", "Formidable Roar")
			RSR.DoMagic:InvokeServer("Dragon", "Formidable Roar", {targetChr.HumanoidRootPart.CFrame, 175})
		end

		if ToxicBasiliskEnabled and ff() == true then
			player.Character.HumanoidRootPart.Anchored = true
			RSR.DoClientMagic:FireServer("Acid", "Toxic Basilisk")
			RSR.DoMagic:InvokeServer("Acid", "Toxic Basilisk", {Direction = targetChr.HumanoidRootPart.CFrame, Floor = targetChr.HumanoidRootPart.CFrame})
			wait(17.5)
			if FreezeEnabled == false then
				player.Character.HumanoidRootPart.Anchored = false
			end
		end

		if ArcaneGuardianEnabled and ff() == true then
			RSR.DoClientMagic:FireServer("Angel", "Arcane Guardian")
			RSR.DoMagic:InvokeServer("Angel", "Arcane Guardian", {Position = targetChr.HumanoidRootPart.Position + Vector3.new(0, 50, 0)})
		end

		if SplittingSlimeEnabled and ff() == true then
			RSR.DoClientMagic:FireServer("Slime", "Splitting Slime")
			RSR.DoMagic:InvokeServer("Slime", "Splitting Slime", targetChr.HumanoidRootPart.CFrame - Vector3.new(0, 20, 0))
		end

		if VirtualZoneEnabled and ff() == true then
			RSR.DoClientMagic:FireServer("Technology", "Virtual Zone")
			RSR.DoMagic:InvokeServer("Technology", "Virtual Zone", {targetChr.HumanoidRootPart.Position, Vector3.new(0, 0, 0)})
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
				elseif input.KeyCode == Enum.KeyCode.X then
					if SpectralEmbodimentEnabled then
						RSR.DoClientMagic:FireServer("Spirit", "Spectral Embodiment")
						RSR.DoMagic:InvokeServer("Spirit", "Spectral Embodiment")
					end
				elseif input.KeyCode == Enum.KeyCode.P then
					if SansTeleportEnabled then
						if game.PlaceId == 566399244 or game.PlaceId == 2569625809 then
							local SansPos = CFrame.new(-1685.91052, 230.035126, -181.798264)
							local SansAngles = CFrame.Angles(0, math.rad(20), 0)

							player.Character.HumanoidRootPart.CFrame = SansPos * SansAngles
							player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Climbing)
							wait()
							player.Character.HumanoidRootPart.Anchored = true
							wait(1)
							if not FreezeEnabled then
								player.Character.HumanoidRootPart.Anchored = false
							end
						end
					end
				elseif input.KeyCode == Enum.KeyCode.Z then
					beginNullifyForces()
				elseif input.KeyCode == Enum.KeyCode.G then
					AntiGravityFunc()
				elseif input.KeyCode == Enum.KeyCode.J then
					if ClickTPEnabled then
						clicktp(mouse.Hit)
					end
				elseif input.KeyCode == Enum.KeyCode.F then
					FreezeFunc()
				elseif input.KeyCode == Enum.KeyCode.Backquote then
					if FlashEnabled then
						longflash()
					end
				elseif input.KeyCode == Enum.KeyCode.V then
					view()
				elseif input.KeyCode == Enum.KeyCode.B then
					toggleESP()
				elseif input.KeyCode == Enum.KeyCode.M then
					toggleESPGold()
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
					commandBoxOutput.Text = "Thanks for using EBGui!"
					wait(2)
					if buttonsopened == true then
						terminateuis = true
						termEBGui()
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

	print([[

	]])
	warn("GUI successfully loaded!")
	commandBoxOutput.Text = "Welcome to EBGui!"
	wait(2)
	commandBoxOutput.Text = "Current Target | (None)"
end
