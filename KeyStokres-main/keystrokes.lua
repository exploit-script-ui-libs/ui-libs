-- Gui to Lua
-- Version: 3.2

-- Instances:

local keystrokes = Instance.new("ScreenGui")
local keyElements = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")
local KeyStrokes = Instance.new("Frame")
local UIGridLayout = Instance.new("UIGridLayout")
local Empty = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local W = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local keyText = Instance.new("TextLabel")
local Empty_2 = Instance.new("Frame")
local UICorner_3 = Instance.new("UICorner")
local A = Instance.new("Frame")
local UICorner_4 = Instance.new("UICorner")
local keyText_2 = Instance.new("TextLabel")
local S = Instance.new("Frame")
local UICorner_5 = Instance.new("UICorner")
local keyText_3 = Instance.new("TextLabel")
local D = Instance.new("Frame")
local UICorner_6 = Instance.new("UICorner")
local keyText_4 = Instance.new("TextLabel")
local UICorner_7 = Instance.new("UICorner")
local SpaceBar = Instance.new("Frame")
local keyText_5 = Instance.new("TextLabel")
local UICorner_8 = Instance.new("UICorner")
local UICorner_9 = Instance.new("UICorner")
local blur = Instance.new("Frame")
local mouseElements = Instance.new("Frame")
local UICorner_10 = Instance.new("UICorner")
local UIListLayout_2 = Instance.new("UIListLayout")
local MouseButton1 = Instance.new("Frame")
local UICorner_11 = Instance.new("UICorner")
local key = Instance.new("TextLabel")
local UIPadding = Instance.new("UIPadding")
local MouseButton2 = Instance.new("Frame")
local UICorner_12 = Instance.new("UICorner")
local key_2 = Instance.new("TextLabel")

--Properties:

keystrokes.Name = "keystrokes"
keystrokes.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
keystrokes.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

keyElements.Name = "keyElements"
keyElements.Parent = keystrokes
keyElements.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
keyElements.BackgroundTransparency = 1.000
keyElements.Position = UDim2.new(0.915000021, 0, -0.000787913799, 0)
keyElements.Size = UDim2.new(0.0850000009, 0, 0.134695664, 0)

UIListLayout.Parent = keyElements
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

KeyStrokes.Name = "KeyStrokes"
KeyStrokes.Parent = keyElements
KeyStrokes.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
KeyStrokes.BackgroundTransparency = 1.000
KeyStrokes.BorderColor3 = Color3.fromRGB(27, 42, 53)
KeyStrokes.BorderSizePixel = 0
KeyStrokes.Position = UDim2.new(0.914945304, 0, 0, 0)
KeyStrokes.Size = UDim2.new(0.998217463, 0, 0.782763004, 0)

UIGridLayout.Parent = KeyStrokes
UIGridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIGridLayout.VerticalAlignment = Enum.VerticalAlignment.Center
UIGridLayout.CellPadding = UDim2.new(0.0199999996, 0, 0.0399999991, 0)
UIGridLayout.CellSize = UDim2.new(0.300000012, 0, 0.451999992, 0)
UIGridLayout.FillDirectionMaxCells = 3

Empty.Name = "Empty"
Empty.Parent = KeyStrokes
Empty.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Empty.BackgroundTransparency = 1.000
Empty.Size = UDim2.new(0.300000012, 0, 0.451999992, 0)

UICorner.CornerRadius = UDim.new(0, 4)
UICorner.Parent = Empty

W.Name = "W"
W.Parent = KeyStrokes
W.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
W.BackgroundTransparency = 0.500
W.Position = UDim2.new(0.57099998, 0, 0.474999994, 0)
W.Size = UDim2.new(0.300000012, 0, 0.451999992, 0)

UICorner_2.CornerRadius = UDim.new(0, 4)
UICorner_2.Parent = W

keyText.Name = "keyText"
keyText.Parent = W
keyText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
keyText.BackgroundTransparency = 1.000
keyText.Size = UDim2.new(1, 0, 1, 0)
keyText.Font = Enum.Font.Sarpanch
keyText.Text = "W"
keyText.TextColor3 = Color3.fromRGB(255, 255, 255)
keyText.TextSize = 30.000
keyText.TextWrapped = true

Empty_2.Name = "Empty"
Empty_2.Parent = KeyStrokes
Empty_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Empty_2.BackgroundTransparency = 1.000
Empty_2.Size = UDim2.new(0.300000012, 0, 0.451999992, 0)

UICorner_3.CornerRadius = UDim.new(0, 4)
UICorner_3.Parent = Empty_2

A.Name = "A"
A.Parent = KeyStrokes
A.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
A.BackgroundTransparency = 0.500
A.Position = UDim2.new(0.57099998, 0, 0.474999994, 0)
A.Size = UDim2.new(0.300000012, 0, 0.451999992, 0)

UICorner_4.CornerRadius = UDim.new(0, 4)
UICorner_4.Parent = A

keyText_2.Name = "keyText"
keyText_2.Parent = A
keyText_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
keyText_2.BackgroundTransparency = 1.000
keyText_2.Size = UDim2.new(1, 0, 1, 0)
keyText_2.Font = Enum.Font.Sarpanch
keyText_2.Text = "A"
keyText_2.TextColor3 = Color3.fromRGB(255, 255, 255)
keyText_2.TextSize = 30.000
keyText_2.TextWrapped = true

S.Name = "S"
S.Parent = KeyStrokes
S.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
S.BackgroundTransparency = 0.500
S.Position = UDim2.new(0.57099998, 0, 0.474999994, 0)
S.Size = UDim2.new(0.300000012, 0, 0.451999992, 0)

UICorner_5.CornerRadius = UDim.new(0, 4)
UICorner_5.Parent = S

keyText_3.Name = "keyText"
keyText_3.Parent = S
keyText_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
keyText_3.BackgroundTransparency = 1.000
keyText_3.Size = UDim2.new(1, 0, 1, 0)
keyText_3.Font = Enum.Font.Sarpanch
keyText_3.Text = "S"
keyText_3.TextColor3 = Color3.fromRGB(255, 255, 255)
keyText_3.TextSize = 30.000
keyText_3.TextWrapped = true

D.Name = "D"
D.Parent = KeyStrokes
D.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
D.BackgroundTransparency = 0.500
D.Position = UDim2.new(0.57099998, 0, 0.474999994, 0)
D.Size = UDim2.new(0.300000012, 0, 0.451999992, 0)

UICorner_6.CornerRadius = UDim.new(0, 4)
UICorner_6.Parent = D

keyText_4.Name = "keyText"
keyText_4.Parent = D
keyText_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
keyText_4.BackgroundTransparency = 1.000
keyText_4.Size = UDim2.new(1, 0, 1, 0)
keyText_4.Font = Enum.Font.Sarpanch
keyText_4.Text = "D"
keyText_4.TextColor3 = Color3.fromRGB(255, 255, 255)
keyText_4.TextSize = 30.000
keyText_4.TextWrapped = true

UICorner_7.CornerRadius = UDim.new(0, 4)
UICorner_7.Parent = KeyStrokes

SpaceBar.Name = "SpaceBar"
SpaceBar.Parent = keyElements
SpaceBar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
SpaceBar.BackgroundTransparency = 0.500
SpaceBar.Position = UDim2.new(0.0356158093, 0, 0.782763004, 0)
SpaceBar.Size = UDim2.new(0.938537478, 0, 0.185603589, 0)

keyText_5.Name = "keyText"
keyText_5.Parent = SpaceBar
keyText_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
keyText_5.BackgroundTransparency = 1.000
keyText_5.Size = UDim2.new(1, 0, 1, 0)
keyText_5.Font = Enum.Font.Sarpanch
keyText_5.Text = "━━━━━"
keyText_5.TextColor3 = Color3.fromRGB(255, 255, 255)
keyText_5.TextSize = 30.000
keyText_5.TextWrapped = true

UICorner_8.CornerRadius = UDim.new(0, 4)
UICorner_8.Parent = SpaceBar

UICorner_9.CornerRadius = UDim.new(0, 4)
UICorner_9.Parent = keyElements

blur.Name = "blur"
blur.Parent = keystrokes
blur.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
blur.BackgroundTransparency = 0.600
blur.BorderSizePixel = 0
blur.Size = UDim2.new(1, 0, 1, 0)
blur.Visible = false
blur.ZIndex = 0

mouseElements.Name = "mouseElements"
mouseElements.Parent = keystrokes
mouseElements.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
mouseElements.BackgroundTransparency = 1.000
mouseElements.Position = UDim2.new(0.915000081, 0, 0.128787816, 0)
mouseElements.Size = UDim2.new(0.0848484859, 0, 0.0695652142, 0)

UICorner_10.CornerRadius = UDim.new(0, 4)
UICorner_10.Parent = mouseElements

UIListLayout_2.Parent = mouseElements
UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Right
UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_2.VerticalAlignment = Enum.VerticalAlignment.Center
UIListLayout_2.Padding = UDim.new(0, 5)

MouseButton1.Name = "MouseButton1"
MouseButton1.Parent = mouseElements
MouseButton1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MouseButton1.BackgroundTransparency = 0.500
MouseButton1.BorderColor3 = Color3.fromRGB(27, 42, 53)
MouseButton1.Position = UDim2.new(0.0308925081, 0, 0.115942031, 0)
MouseButton1.Size = UDim2.new(0.963, 0, 0.375, 0)

UICorner_11.CornerRadius = UDim.new(0, 4)
UICorner_11.Parent = MouseButton1

key.Name = "key"
key.Parent = MouseButton1
key.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
key.BackgroundTransparency = 1.000
key.Size = UDim2.new(1, 0, 1, 0)
key.Font = Enum.Font.Sarpanch
key.Text = "L: 0CPS"
key.TextColor3 = Color3.fromRGB(255, 255, 255)
key.TextScaled = true
key.TextSize = 14.000
key.TextWrapped = true

UIPadding.Parent = mouseElements
UIPadding.PaddingRight = UDim.new(0, 5)

MouseButton2.Name = "MouseButton2"
MouseButton2.Parent = mouseElements
MouseButton2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MouseButton2.BackgroundTransparency = 0.500
MouseButton2.BorderColor3 = Color3.fromRGB(27, 42, 53)
MouseButton2.Position = UDim2.new(0, 0, 0.53906256, 0)
MouseButton2.Size = UDim2.new(0.963, 0, 0.375, 0)

UICorner_12.CornerRadius = UDim.new(0, 4)
UICorner_12.Parent = MouseButton2

key_2.Name = "key"
key_2.Parent = MouseButton2
key_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
key_2.BackgroundTransparency = 1.000
key_2.Size = UDim2.new(1, 0, 1, 0)
key_2.Font = Enum.Font.Sarpanch
key_2.Text = "R: 0CPS"
key_2.TextColor3 = Color3.fromRGB(255, 255, 255)
key_2.TextScaled = true
key_2.TextSize = 14.000
key_2.TextWrapped = true

-- Scripts:

local function WIEJGUO_fake_script() -- keystrokes.LocalScript 
	local script = Instance.new('LocalScript', keystrokes)

	local keys = {
		[1] = {key = Enum.KeyCode.W, set = false},
		[2] = {key = Enum.KeyCode.A, set = false},
		[3] = {key = Enum.KeyCode.S, set = false},
		[4] = {key = Enum.KeyCode.D, set = false},
		[5] = {key = Enum.KeyCode.Space, set = false},
		[6] = {key = Enum.UserInputType.MouseButton1, set = false},
		[7] = {key = Enum.UserInputType.MouseButton2, set = false}
	}
	local editHudMode = false
	local ui = game:GetService("UserInputService")
	
	ui.InputBegan:Connect(function(input, gameProccessed)
		if input.UserInputType == Enum.UserInputType.Keyboard and not gameProccessed then
			local keyCode = input.KeyCode
			for i,v in pairs(keys) do	
				if v["key"] == keyCode then
					v["set"] = true
				end
			end
			if keyCode == Enum.KeyCode.G then
				editHudMode = not editHudMode
				script.Parent.blur.Visible = editHudMode
				if editHudMode then	
					local frame = script.Parent.keyElements
					frame.Draggable = true
					frame.Active = true
					frame.Selectable = true
					local frame1 = script.Parent.mouseElements
					frame1.Draggable = true
					frame1.Active = true
					frame1.Selectable = true
					script.Parent.keyElements.BackgroundTransparency = 0.5
					script.Parent.mouseElements.BackgroundTransparency = 0.5
				else
					script.Parent.keyElements.BackgroundTransparency = 1
					script.Parent.mouseElements.BackgroundTransparency = 1
					local frame = script.Parent.keyElements
					frame.Draggable = false
					frame.Active = false
					frame.Selectable = false
					local frame1 = script.Parent.mouseElements
					frame1.Draggable = false
					frame1.Active = false
					frame1.Selectable = false
				end
			end
		end
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			keys[6].set = true
		end
		if input.UserInputType == Enum.UserInputType.MouseButton2 then
			keys[7].set = true
		end
	end)
	
	ui.InputEnded:Connect(function(input, gameProccessed)
		if input.UserInputType == Enum.UserInputType.Keyboard then
			local keyCode = input.KeyCode
			for i,v in pairs(keys) do	
				if v["key"] == keyCode then
					v["set"] = false
				end
			end
		end
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			keys[6].set = false
		end
		if input.UserInputType == Enum.UserInputType.MouseButton2 then
			keys[7].set = false
		end
	end)
	
	game["Run Service"].RenderStepped:Connect(function()
		if not editHudMode then
			for i,v in pairs(keys) do	
				local keyTable = tostring(v["key"]):gsub("Enum.KeyCode.", "")
				if v["key"] == Enum.KeyCode.Space then
					if v["set"] == true then
						script.Parent.keyElements:FindFirstChild("SpaceBar").BackgroundColor3 = Color3.fromRGB(49, 49, 49)
					else
						script.Parent.keyElements:FindFirstChild("SpaceBar").BackgroundColor3 = Color3.fromRGB(0,0,0)
					end
				elseif v["key"] ~= Enum.UserInputType.MouseButton1 and v["key"] ~= Enum.UserInputType.MouseButton2 then
					if v["set"] == true then
						script.Parent.keyElements.KeyStrokes:FindFirstChild(keyTable).BackgroundColor3 = Color3.fromRGB(49, 49, 49)
					else
						script.Parent.keyElements.KeyStrokes:FindFirstChild(keyTable).BackgroundColor3 = Color3.fromRGB(0,0,0)
					end
				else
					local mouseKey = tostring(v["key"]):gsub("Enum.UserInputType.", "")
					if v["set"] == true then
						script.Parent.mouseElements:FindFirstChild(mouseKey).BackgroundColor3 = Color3.fromRGB(49, 49, 49)
					else
						script.Parent.mouseElements:FindFirstChild(mouseKey).BackgroundColor3 = Color3.fromRGB(0,0,0)
					end
				end
			end
		end
	end)
	
end
coroutine.wrap(WIEJGUO_fake_script)()
local function YNYIWA_fake_script() -- keystrokes.m2 
	local script = Instance.new('LocalScript', keystrokes)

	local lCps = 0
	local rCps = 0
	game.Players.LocalPlayer:GetMouse().Button1Down:Connect(function()
		lCps = lCps + 1
		wait(1)
		lCps = lCps - 1
	end)
	game.Players.LocalPlayer:GetMouse().Button2Down:Connect(function()
		rCps = rCps + 1
		wait(1)
		rCps = rCps - 1
	end)
	
	while wait() do	
		script.Parent.mouseElements.MouseButton1.key.Text = "L: "..lCps.."CPS"
		script.Parent.mouseElements.MouseButton2.key.Text = "R: "..rCps.."CPS"
	end
end
coroutine.wrap(YNYIWA_fake_script)()
