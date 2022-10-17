-- MONOXIDE UI LIB BETA 0.1 - DO NOT SHARE WITH ANYONE WHO IS NOT A BETA TESTER.

getgenv().MonoxideWindows = {}
local CoreGui = game:GetService("CoreGui")
if not MonoxideWindows then
    MonoxideWindows = {}
end

for i,v in next, MonoxideWindows do
    if CoreGui:FindFirstChild("MonoxideLib"):FindFirstChild(v) then
        CoreGui:FindFirstChild("MonoxideLib"):FindFirstChild(v):Destroy()
    end
end


-- Instances:
local function ripple(obj)
	spawn(
		function()
			local Mouse = game.Players.LocalPlayer:GetMouse()
			local Circle = Instance.new("ImageLabel")
			Circle.Name = "Circle"
			Circle.Parent = obj
			Circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Circle.BackgroundTransparency = 1.000
			Circle.ZIndex = 10
			Circle.Image = "rbxassetid://266543268"
			Circle.ImageColor3 = Color3.fromRGB(255, 255, 255)
			Circle.ImageTransparency = 0.4
			local NewX, NewY = Mouse.X - Circle.AbsolutePosition.X, Mouse.Y - Circle.AbsolutePosition.Y
			Circle.Position = UDim2.new(0, NewX, 0, NewY)
			local Size = 0 
			if obj.AbsoluteSize.X > obj.AbsoluteSize.Y then
				Size = obj.AbsoluteSize.X * 1.5
			elseif obj.AbsoluteSize.X < obj.AbsoluteSize.Y then
				Size = obj.AbsoluteSize.Y * 1.5
			elseif obj.AbsoluteSize.X == obj.AbsoluteSize.Y then
				Size = obj.AbsoluteSize.X * 1.5
			end
			Circle:TweenSizeAndPosition(
				UDim2.new(0, Size, 0, Size),
				UDim2.new(0.5, -Size / 2, 0.5, -Size / 2),
				"Out",
				"Quad",
				0.2,
				false
			)
			for i = 1, 20 do
				Circle.ImageTransparency = Circle.ImageTransparency + 0.05
				wait(0.3 / 10)
			end
			Circle:Destroy()
		end
	)
end

local ScreenGui = CoreGui:FindFirstChild("MonoxideLib") or Instance.new("ScreenGui")

--Properties:
ScreenGui.Name = "MonoxideLib"
ScreenGui.Parent = CoreGui;
local UserInputService = game:GetService("UserInputService")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
local function MakeDraggable(topbarobject, object)
    local Dragging = nil
    local DragInput = nil
    local DragStart = nil
    local StartPosition = nil

    local function Update(input)
        local Delta = input.Position - DragStart
        local pos =
            UDim2.new(
            StartPosition.X.Scale,
            StartPosition.X.Offset + Delta.X,
            StartPosition.Y.Scale,
            StartPosition.Y.Offset + Delta.Y
        )
        object.Position = pos
    end

    topbarobject.InputBegan:Connect(
        function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                Dragging = true
                DragStart = input.Position
                StartPosition = object.Position

                input.Changed:Connect(
                    function()
                        if input.UserInputState == Enum.UserInputState.End then
                            Dragging = false
                        end
                    end
                )
            end
        end
    )

    topbarobject.InputChanged:Connect(
        function(input)
            if
                input.UserInputType == Enum.UserInputType.MouseMovement or
                    input.UserInputType == Enum.UserInputType.Touch
             then
                DragInput = input
            end
        end
    )

    UserInputService.InputChanged:Connect(
        function(input)
            if input == DragInput and Dragging then
                Update(input)
            end
        end
    )
end
local lib = {}
local TweenService = game:GetService("TweenService")

local function SimpleTween(Object, Length, Style, Direction, Properties)
	local Tween = TweenService:Create(
		Object,
		TweenInfo.new(Length, Enum.EasingStyle[Style].Value, Enum.EasingDirection[Direction].Value),
		Properties
	)
	
	Tween:Play()
	Tween.Completed:Wait()
	Tween:Destroy()
end


function lib:Window(title, ver,font, outcolor)
    local TextLabel = Instance.new("TextLabel")
    local VerLabel = Instance.new("TextLabel")
    local Outline = Instance.new("Frame")
    local ExitButton = Instance.new("TextButton")
    local UIListLayout = Instance.new("UIListLayout")
    local Content = Instance.new("ScrollingFrame")
    local UICorner = Instance.new("UICorner")
    local Window = Instance.new("Frame")
    local Topbar = Instance.new("Frame")
    Outline.Name = string.lower(title)
    table.insert(MonoxideWindows, string.lower(title))
    local current = table.getn(MonoxideWindows)
    local RNG = Random.new()
    local RNG2 = Random.new()
    Outline.Parent = ScreenGui
    Outline.AnchorPoint = Vector2.new(0.5, 0.5)
    Outline.BackgroundColor3 = outcolor or Color3.fromRGB(0, 0, 0)
    Outline.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Outline.BorderSizePixel = 2
    Outline.Position = UDim2.new(0.5 + RNG:NextNumber() * 0.05,0, 0.5 + RNG2:NextNumber() * 0.05, 0)
    Outline.ClipsDescendants = true
    Outline.Size = UDim2.new(0, 0, 0, 0)
    Outline:TweenSize(
        UDim2.new(0, 432, 0, 284),
        Enum.EasingDirection.In,
        "Quint",
        .6,
        true
    )

    UICorner.CornerRadius = UDim.new(0, 9)
    UICorner.Parent = Outline

    Window.Name = "Window"
    Window.Parent = Outline
    Window.ClipsDescendants = true
    Window.AnchorPoint = Vector2.new(0.5, 0.5)
    Window.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
    Window.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Topbar.BackgroundTransparency = .9
    Window.BorderSizePixel = 2
    Window.Position = UDim2.new(0.5, 0, 0.5, 0)
    Window.Size = UDim2.new(0, 428, 0, 280)
    Topbar.Name = "Topbar"
    Topbar.Parent = Window
    Topbar.BackgroundColor3 = Color3.fromRGB(57, 57, 57)
    Topbar.Size = UDim2.new(0, 428, 0, 24)
    local UICorner_Top = Instance.new("UICorner")
    ExitButton.Parent = Topbar
    ExitButton.Text = "x"
    ExitButton.BackgroundTransparency = 1
    ExitButton.TextStrokeTransparency = 1
    ExitButton.AnchorPoint = Vector2.new(0, 1)
    ExitButton.Position = UDim2.new(0,12,0,20)
    ExitButton.Font = Enum.Font.GothamSemibold
    ExitButton.TextSize = 16.00
    ExitButton.Size = UDim2.new(0,10,0,10)
    ExitButton.TextColor3 = Color3.fromRGB(199, 199, 199)
    ExitButton.MouseButton1Down:Connect(function()
        table.remove(MonoxideWindows, current)
        Outline:TweenSize(
        UDim2.new(0, 0, 0, 0),
            Enum.EasingDirection.Out,
            "Quint",
            .6,
            true
        )
        wait(.6)
        Outline:Destroy()
    end)
        
    UICorner_Top.Parent = Topbar
    MakeDraggable(Topbar, Outline)

    TextLabel.Parent = Topbar
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.BackgroundTransparency = 1.000
    TextLabel.BorderSizePixel = 0
    TextLabel.Position = UDim2.new(0,0,0,2)
    TextLabel.Size = UDim2.new(0, 432, 0, 24)
    TextLabel.Font = font or Enum.Font.GothamSemibold
    TextLabel.Text = string.upper(title) or "Window"
    TextLabel.TextColor3 = Color3.fromRGB(190, 190, 190)
    TextLabel.TextSize = 18.000
    TextLabel.TextWrapped = true
    VerLabel.AnchorPoint = Vector2.new(1.2,0)
    VerLabel.Parent = Topbar
    VerLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    VerLabel.BackgroundTransparency = 1.000
    VerLabel.BorderSizePixel = 0
    VerLabel.Position = UDim2.new(0.99,0,0,0)
    VerLabel.TextXAlignment = Enum.TextXAlignment.Right
    VerLabel.Size = UDim2.new(0, 100, 0, 24)
    VerLabel.Font = Enum.Font.SourceSansBold
    VerLabel.Text = string.lower(ver) or "Window"
    VerLabel.TextColor3 = Color3.fromRGB(133, 133, 133)
    VerLabel.TextSize = 16.000
    VerLabel.TextWrapped = true
    local UICorner = Instance.new("UICorner")
    UICorner.Parent = Window
    local window = {}
    Content.Name = "Content"
    Content.Parent = Window
    Content.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Content.BackgroundTransparency = 1.000
    Content.BorderSizePixel = 0
    Content.AnchorPoint = Vector2.new(0.5, 0.5)
    Content.Position = UDim2.new(0.5, 0, 0.555, 0)
    Content.Size = UDim2.new(0, 425, 0, 253)
    UIListLayout.Parent = Content
    UIListLayout.FillDirection = Enum.FillDirection.Vertical
    UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0.00999999978, 0)

    function window:Message(text, buttonname, duration)
        local notframe = Instance.new("Frame")
        local tex = Instance.new("TextLabel")
        local corn = Instance.new("UICorner")
        local confirmbtn = Instance.new("TextButton")
        -- local exitbtn = Instance.new("ImageButton")
        -- frame
        notframe.Size = UDim2.new(0,200,0,200)
        notframe.ClipsDescendants = true
        notframe.BackgroundColor3 = Color3.fromRGB(50,50,50)
        notframe.AnchorPoint = Vector2.new(0.5,0.5)
        notframe.Parent = Window
        notframe.Position = UDim2.new(.5,0,.5,0)
        notframe.BackgroundTransparency = 1
        corn.Parent = notframe
        corn:Clone().Parent = confirmbtn

        tex.Parent = notframe
        tex.BackgroundTransparency = 1
        tex.BorderSizePixel = 0
        tex.TextColor3 = Color3.fromRGB(255,255,255)
        tex.Text = text
        tex.TextWrapped = true
        tex.Size = UDim2.new(0,200,0,160)

        -- button
        confirmbtn.Size = UDim2.new(0,80,0,30)
        confirmbtn.AnchorPoint = Vector2.new(.5,.5)
        confirmbtn.BackgroundColor3 = Color3.fromRGB(20,20,20)
        confirmbtn.TextColor3 = Color3.fromRGB(255,255,255)
        confirmbtn.Position = UDim2.new(.5,0,0,160)
        confirmbtn.Parent = notframe
        confirmbtn.Text = buttonname
        confirmbtn.MouseButton1Down:Connect(function()
            notframe:TweenSize(UDim2.new(0,0,0,0))
            wait(1)
            notframe:Destroy()
        end)
            SimpleTween(notframe, .5, "Quint", "Out", {BackgroundTransparency = 0})
            SimpleTween(confirmbtn, .5, "Quint", "Out", {BackgroundTransparency = 0})

        if duration then
            wait(duration)
            notframe:TweenSize(UDim2.new(0,0,0,0))
            wait(1)

            notframe:Destroy()
        end
    end

    function window:Rainbow(speed)
        speed = speed or 1
        coroutine.wrap(function() -- so does not wait for this function to finish (as it is infinite)
            while true do
                SimpleTween(Outline, speed, "Linear", "Out", { BackgroundColor3 = Color3.new(1, 0, 0) })
                SimpleTween(Outline, speed, "Linear", "Out", { BackgroundColor3 = Color3.new(0, 1, 0) })
                SimpleTween(Outline, speed, "Linear", "Out", { BackgroundColor3 = Color3.new(0, 0, 1) })
                SimpleTween(Outline, speed, "Linear", "Out", { BackgroundColor3 = Color3.new(1, 1, 0) })
                SimpleTween(Outline, speed, "Linear", "Out", { BackgroundColor3 = Color3.new(0, 1, 1) })
                SimpleTween(Outline, speed, "Linear", "Out", { BackgroundColor3 = Color3.new(1, 0, 1) })
                SimpleTween(Outline, speed, "Linear", "Out", { BackgroundColor3 = Color3.new(1, .5, .5) })
            end
        end)()
    end
    function window:GetWindow()
        return Window
    end
    function window:Dropdown(text, list, callback) -- Based on dawid's Vape lib (soon i'll make a new one)
            local droptog = false
            local framesize = 0
            local itemcount = 0

            local Dropdown = Instance.new("Frame")
            local DropdownCorner = Instance.new("UICorner")
            local DropdownBtn = Instance.new("TextButton")
            local DropdownTitle = Instance.new("TextLabel")
            local ArrowImg = Instance.new("ImageLabel")
            local DropItemHolder = Instance.new("ScrollingFrame")
            local DropLayout = Instance.new("UIListLayout")

            Dropdown.Name = "Dropdown"
            Dropdown.Parent = Content
            Dropdown.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            Dropdown.ClipsDescendants = true
            Dropdown.Position = UDim2.new(-0.541071415, 0, -0.532915354, 0)
            Dropdown.Size = UDim2.new(0, 363, 0, 42)

            DropdownCorner.CornerRadius = UDim.new(0, 5)
            DropdownCorner.Name = "DropdownCorner"
            DropdownCorner.Parent = Dropdown

            DropdownBtn.Name = "DropdownBtn"
            DropdownBtn.Parent = Dropdown
            DropdownBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            DropdownBtn.BackgroundTransparency = 1.000
            DropdownBtn.Size = UDim2.new(0, 363, 0, 42)
            DropdownBtn.Font = Enum.Font.SourceSans
            DropdownBtn.Text = ""
            DropdownBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
            DropdownBtn.TextSize = 14.000

            DropdownTitle.Name = "DropdownTitle"
            DropdownTitle.Parent = Dropdown
            DropdownTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            DropdownTitle.BackgroundTransparency = 1.000
            DropdownTitle.Position = UDim2.new(0.0358126722, 0, 0, 0)
            DropdownTitle.Size = UDim2.new(0, 187, 0, 42)
            DropdownTitle.Font = Enum.Font.Gotham
            DropdownTitle.Text = text
            DropdownTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            DropdownTitle.TextSize = 14.000
            DropdownTitle.TextXAlignment = Enum.TextXAlignment.Left

            ArrowImg.Name = "ArrowImg"
            ArrowImg.Parent = DropdownTitle
            ArrowImg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ArrowImg.BackgroundTransparency = 1.000
            ArrowImg.Position = UDim2.new(1.65240645, 0, 0.190476194, 0)
            ArrowImg.Size = UDim2.new(0, 26, 0, 26)
            ArrowImg.Image = "http://www.roblox.com/asset/?id=6034818375"

            DropItemHolder.Name = "DropItemHolder"
            DropItemHolder.Parent = DropdownTitle
            DropItemHolder.Active = true
            DropItemHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            DropItemHolder.BackgroundTransparency = 1.000
            DropItemHolder.BorderSizePixel = 0
            DropItemHolder.Position = UDim2.new(-0.00400000019, 0, 1.04999995, 0)
            DropItemHolder.Size = UDim2.new(0, 342, 0, 0)
            DropItemHolder.CanvasSize = UDim2.new(0, 0, 0, 0)
            DropItemHolder.ScrollBarThickness = 3

            DropLayout.Name = "DropLayout"
            DropLayout.Parent = DropItemHolder
            DropLayout.SortOrder = Enum.SortOrder.LayoutOrder

            DropdownBtn.MouseButton1Click:Connect(
                function()
                    if droptog == false then
                        Dropdown:TweenSize(
                            UDim2.new(0, 363, 0, 55 + framesize),
                            Enum.EasingDirection.Out,
                            Enum.EasingStyle.Quart,
                            .2,
                            true
                        )
                        TweenService:Create(
                            ArrowImg,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {Rotation = 270}
                        ):Play()
                        wait(.2)
                        Content.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y)
                    else
                        Dropdown:TweenSize(
                            UDim2.new(0, 363, 0, 42),
                            Enum.EasingDirection.Out,
                            Enum.EasingStyle.Quart,
                            .2,
                            true
                        )
                        TweenService:Create(
                            ArrowImg,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {Rotation = 0}
                        ):Play()
                        wait(.2)
                        Content.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y)
                    end
                    droptog = not droptog
                end
            )

            for i, v in next, list do
                itemcount = itemcount + 1
                if itemcount <= 3 then
                    framesize = framesize + 26
                    DropItemHolder.Size = UDim2.new(0, 342, 0, framesize)
                end
                local Item = Instance.new("TextButton")
                local ItemCorner = Instance.new("UICorner")

                Item.Name = "Item"
                Item.Parent = DropItemHolder
                Item.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                Item.ClipsDescendants = true
                Item.Size = UDim2.new(0, 335, 0, 25)
                Item.AutoButtonColor = false
                Item.Font = Enum.Font.Gotham
                Item.Text = v
                Item.TextColor3 = Color3.fromRGB(255, 255, 255)
                Item.TextSize = 15.000

                ItemCorner.CornerRadius = UDim.new(0, 4)
                ItemCorner.Name = "ItemCorner"
                ItemCorner.Parent = Item

                Item.MouseEnter:Connect(
                    function()
                        TweenService:Create(
                            Item,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {BackgroundColor3 = Color3.fromRGB(37, 37, 37)}
                        ):Play()
                    end
                )

                Item.MouseLeave:Connect(
                    function()
                        TweenService:Create(
                            Item,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {BackgroundColor3 = Color3.fromRGB(34, 34, 34)}
                        ):Play()
                    end
                )

                Item.MouseButton1Click:Connect(
                    function()
                        droptog = not droptog
                        DropdownTitle.Text = v
                        pcall(callback, v)
                        Dropdown:TweenSize(
                            UDim2.new(0, 363, 0, 42),
                            Enum.EasingDirection.Out,
                            Enum.EasingStyle.Quart,
                            .2,
                            true
                        )
                        TweenService:Create(
                            ArrowImg,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {Rotation = 0}
                        ):Play()
                        wait(.2)
                        Content.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y)
                    end
                )

                DropItemHolder.CanvasSize = UDim2.new(0, 0, 0, DropLayout.AbsoluteContentSize.Y)
            end
            Content.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y)
    end


    -- New Textbox
    function window:Textbox(text, disapeer, callback) -- Based on dawid's Vape lib (soon i'll make a new one)
        callback = callback or function(...)
        end
        local textbox = Instance.new("Frame")
        local title = Instance.new("TextLabel")
        local textboxframe = Instance.new("Frame")
        local textboxmain = Instance.new("TextBox")

        textbox.Name = "textbox"
        textbox.Parent = Content
        textbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        textbox.BackgroundTransparency = 1.000
        textbox.Position = UDim2.new(0.503712893, 0, 0.239035085, 0)

        title.Name = "title"
        title.Parent = textbox
        title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        title.BackgroundTransparency = 1
        title.BorderSizePixel = 0
        title.Position = UDim2.new(0, 6, 0, 0)
        title.Size = UDim2.new(0, 23, 1, 0)
        title.ZIndex = 2
        title.Font = Enum.Font.Gotham
        title.Text = text
        title.TextColor3 = Color3.fromRGB(255, 255, 255)
        title.TextSize = 14.000
        title.TextXAlignment = Enum.TextXAlignment.Left
        textbox.Size = UDim2.new(0, title.TextBounds.X + 185, 0, 30)

        textboxframe.Name = "textboxframe"
        textboxframe.Parent = textbox
        textboxframe.AnchorPoint = Vector2.new(1, 0.5)
        textboxframe.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        textboxframe.BorderSizePixel = 0
        textboxframe.Position = UDim2.new(1, 0, 0.5, 0)
        textboxframe.Size = UDim2.new(0, 165, 0, 26)

        textboxmain.Name = "textboxmain"
        textboxmain.Parent = textboxframe
        textboxmain.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        textboxmain.BorderSizePixel = 0
        textboxmain.Size = UDim2.new(0, 165, 0, 26)
        textboxmain.Font = Enum.Font.Gotham
        textboxmain.Text = ""
        textboxmain.TextColor3 = Color3.fromRGB(255, 255, 255)
        textboxmain.TextSize = 14.000
        Content.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 10)

        textboxmain.FocusLost:Connect(
            function(ep)
                if ep then
                    if #textboxmain.Text > 0 then
                        pcall(callback, textboxmain.Text)
                        if disapeer then
                            textboxmain.Text = ""
                        end
                    end
                end
            end
        )
    end
    function window:Slider(text, min, max, start, callback) -- Based on dawid's Vape lib (soon i'll make a new one)
        local inputService = game:GetService("UserInputService")
        local slider = Instance.new("Frame")
        local round = Instance.new("UICorner")
        local title = Instance.new("TextLabel")
        local placetoslide = Instance.new("TextButton")
        local slideframe = Instance.new("Frame")
        local value = Instance.new("TextLabel")
        local dragging = false

        slider.Name = "slider"
        slider.Parent = Content
        slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        slider.BackgroundTransparency = 1.000
        slider.Position = UDim2.new(0.503712893, 0, 0.239035085, 0)

        title.Name = "title"
        title.Parent = slider
        title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        title.BackgroundTransparency = 1.000
        title.BorderSizePixel = 0
        title.Position = UDim2.new(0, 6, 0, 0)
        title.Size = UDim2.new(0, 23, 1, 0)
        title.ZIndex = 2
        title.Font = Enum.Font.Gotham
        title.Text = text
        title.TextColor3 = Color3.fromRGB(255, 255, 255)
        title.TextSize = 14.000
        title.TextXAlignment = Enum.TextXAlignment.Left
        slider.Size = UDim2.new(0, title.TextBounds.X + 185, 0, 30)

        placetoslide.Name = "slideplace"
        placetoslide.Parent = slider
        placetoslide.AnchorPoint = Vector2.new(1, 0.5)
        placetoslide.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        placetoslide.BorderSizePixel = 0
        placetoslide.Position = UDim2.new(1, 0, 0.5, 0)
        placetoslide.Size = UDim2.new(0, 165, 0, 26)
        placetoslide.AutoButtonColor = false
        placetoslide.Text = ""
        round.Parent = placetoslide
        slideframe.Name = "slideframe"
        slideframe.Parent = placetoslide
        slideframe.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        slideframe.BorderSizePixel = 0
        slideframe.Size = UDim2.new((start or 0) / max, 0, 1, 0)

        round:Clone().Parent = slideframe
        value.Name = "value"
        value.Parent = placetoslide
        value.BackgroundTransparency = 1
        value.BorderSizePixel = 0
        value.Size = UDim2.new(1, 0, 1, 0)
        value.Font = Enum.Font.Gotham
        value.Text = tostring(start and math.floor((start / max) * (max - min) + min) or 0)
        value.TextColor3 = Color3.fromRGB(255, 255, 255)
        value.TextSize = 14
        Content.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 10)
        slideframe.ClipsDescendants = true
        local function slide(input)
            local pos =
                UDim2.new(
                    math.clamp((input.Position.X - placetoslide.AbsolutePosition.X) / placetoslide.AbsoluteSize.X, 0, 1),
                    0,
                    1,
                    0
                )
            slideframe:TweenSize(pos, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.1, true)
            local s = math.floor(((pos.X.Scale * max) / max) * (max - min) + min)
            value.Text = tostring(s)
            callback(s)
        end

        placetoslide.InputBegan:Connect(
            function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    slide(input)
                    dragging = true
                end
            end
        )

        placetoslide.InputEnded:Connect(
            function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    ripple(slideframe)
                    dragging = false
                end
            end
        )

        inputService.InputChanged:Connect(
            function(input)
                if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                    slide(input)
                end
            end
        )
    end


    function window:Button(text, callback)
        callback = callback or function(...)
        end
        local button = Instance.new("TextButton")
        local MouseEnter =
            TweenService:Create(
                button,
                TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.In),
                {
                    BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                }
            )

        local MouseLeave =
            TweenService:Create(
                button,
                TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                {
                    BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                }
            )

        button.Name = "button"
        button.Parent = Content
        button.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        button.BorderSizePixel = 0
        button.AutoButtonColor = false
        button.Font = Enum.Font.Gotham
        button.Text = string.upper(text)
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.TextSize = 14.000
        button.Size = UDim2.new(0, button.TextBounds.X + 15, 0, 27)
        button.ClipsDescendants = true
        Content.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 10)

        button.MouseEnter:Connect(
            function()
                MouseEnter:Play()
            end
        )
        button.MouseLeave:Connect(
            function()
                MouseLeave:Play()
            end
        )

        button.MouseButton1Click:Connect(
            function()
                ripple(button)
                pcall(callback)
            end
        )
    end
    return window;
end

return lib -- Return the lib so it can be used with loadstring()
