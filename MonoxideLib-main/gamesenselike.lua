-- Gui to Lua
-- Version: 3.2
local coreGui = game:GetService("CoreGui")
local MonoxideLibGui = coreGui:FindFirstChild("MonoxideLib")
if MonoxideLibGui then
    MonoxideLibGui:Destroy()
end

-- Instances:

local MonoxideLib = Instance.new("ScreenGui")

--Properties:

MonoxideLib.Name = "MonoxideLib"
MonoxideLib.Parent = coreGui
MonoxideLib.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local lib = {}
function lib:Window(title, color, rainbow)
    local Window = Instance.new("Frame")
    local TabContainer = Instance.new("ScrollingFrame")
    local Grid = Instance.new("UIGridLayout")
    
    local WindowTitle = Instance.new("TextLabel")
    Window.Name = string.gsub(string.lower(title), " ", "_") or "Window"
    Window.Parent = MonoxideLib
    Window.AnchorPoint = Vector2.new(0.5, 0.5)
    Window.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
    Window.BorderColor3 = color or Color3.fromRGB(45, 45, 45)
    Window.BorderSizePixel = 6
    Window.Position = UDim2.new(0.505102038, 0, 0.5, 0)
    Window.Size = UDim2.new(0.300728858, 0, 0.699999988, 0)

    TabContainer.Name = "TabContainer"
    TabContainer.Parent = Window
    TabContainer.Active = true
    TabContainer.AnchorPoint = Vector2.new(0.5, 0.5)
    TabContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TabContainer.BackgroundTransparency = 1.000
    TabContainer.LayoutOrder = 2
    TabContainer.Position = UDim2.new(0.5, 0, 0.5, 0)
    TabContainer.Size = UDim2.new(0.98, 0, 0.98, 0)
    TabContainer.CanvasSize = UDim2.new(0, 0, 1, 0)
    TabContainer.ScrollBarThickness = 5

    Grid.Name = "Grid"
    Grid.Parent = TabContainer
    Grid.SortOrder = Enum.SortOrder.LayoutOrder
    Grid.CellSize = UDim2.new(0, 250, 0, 250)
    Grid.CellPadding = UDim2.new(0,10,0,10)
    local win = {}
    function win:Tab(title,color)
        local tab = {}
        local Tab = Instance.new("Frame")
        local TabTitle = Instance.new("TextLabel")
        local TabContent = Instance.new("ScrollingFrame")
        local Frame = Instance.new("Frame")
        
        local TabList = Instance.new("UIListLayout")
        local SliderBG = Instance.new("Frame")
        local SliderPart = Instance.new("Frame")
        local ValueLabel = Instance.new("TextLabel")
        local Button = Instance.new("TextButton")
        local Dropdown = Instance.new("TextButton")
        local ImageLabel = Instance.new("ImageLabel")
        local OptionsContainer = Instance.new("Frame")
        local UIListLayout = Instance.new("UIListLayout")
        local Option = Instance.new("TextButton")
        Tab.Name = "Tab"
        Tab.Parent = TabContainer
        Tab.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        Tab.BorderColor3 = Color3.fromRGB(209, 209, 209)
        Tab.BorderSizePixel = 2
        Tab.Position = UDim2.new(0.244838595, 0, 0.108130589, 0)
        Tab.Size = UDim2.new(0, 150, 0, 250)
        Tab.BorderMode = Enum.BorderMode.Inset
        TabTitle.Name = "TabTitle"
        TabTitle.Parent = Tab
        TabTitle.AnchorPoint = Vector2.new(0.5, 0)
        TabTitle.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        TabTitle.BorderSizePixel = 0
        TabTitle.Position = UDim2.new(0.5, 0, 0, 0)
        TabTitle.Size = UDim2.new(0, 63, 0, 19)
        TabTitle.Font = Enum.Font.SourceSans
        TabTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
        TabTitle.TextSize = 14.000
        TabTitle.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
        TabTitle.TextWrapped = true

        TabContent.Name = "TabContent"
        TabContent.Parent = Tab
        TabContent.Active = true
        TabContent.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TabContent.BackgroundTransparency = 1.000
        TabContent.Position = UDim2.new(0, 0, 0.18261385, 0)
        TabContent.Size = UDim2.new(1, 0, 0.817385972, 0)
        TabContent.CanvasSize = UDim2.new(0, 0, 1, 0)
        TabContent.ScrollBarThickness = 5

        Frame.Parent = TabContent
        Frame.AnchorPoint = Vector2.new(0.5, 0)
        Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Frame.BackgroundTransparency = 1.000
        Frame.Position = UDim2.new(0.5, 0, 0, 0)
        Frame.Size = UDim2.new(0.9, 0, 1, 0)
        -- Checkbox function (Done!)
        function tab:Checkbox(title, check)
            local Checkbox = Instance.new("Frame")
            local NameLable = Instance.new("TextLabel")
            Checkbox.Name = "Checkbox"
            Checkbox.Parent = Frame
            Checkbox.BackgroundColor3 = Color3.fromRGB(54, 54, 54)
            Checkbox.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Checkbox.BorderSizePixel = 2
            Checkbox.Position = UDim2.new(0.0173452478, 0, 0.717617095, 0)
            Checkbox.Size = UDim2.new(0, 8, 0, 8)
            NameLable.Name = "NameLable"
            NameLable.Parent = Checkbox
            NameLable.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            NameLable.BackgroundTransparency = 1.000
            NameLable.BorderSizePixel = 0
            NameLable.Position = UDim2.new(2.35251999, 0, -0.75, 0)
            NameLable.Size = UDim2.new(0, 145, 0, 19)
            NameLable.Font = Enum.Font.SourceSans
            NameLable.Text = title
            NameLable.TextColor3 = Color3.fromRGB(255, 255, 255)
            NameLable.TextSize = 14.000
            NameLable.TextXAlignment = Enum.TextXAlignment.Left
            local checked = check or false
            Checkbox.InputBegan:Connect( function(InputObject) 
                if InputObject.UserInputType == Enum.UserInputType.MouseButton1 or InputObject.UserInputType == Enum.UserInputType.Touch then
                    checked = not checked
                    if checked then
                        Checkbox.BackgroundColor3 = Color3.fromRGB(255, 0, 209)
                    else
                        Checkbox.BackgroundColor3 = Color3.fromRGB(54, 54, 54)
                    end
                end
            end )
        end


        TabList.Name = "TabList"
        TabList.Parent = Frame
        TabList.SortOrder = Enum.SortOrder.LayoutOrder
        TabList.Padding = UDim.new(0.100000001, 0)

        SliderBG.Name = "SliderBG"
        SliderBG.Parent = Frame
        SliderBG.BackgroundColor3 = Color3.fromRGB(54, 54, 54)
        SliderBG.BorderColor3 = Color3.fromRGB(0, 0, 0)
        SliderBG.BorderSizePixel = 2
        SliderBG.Position = UDim2.new(0, 0, 0.247433782, 0)
        SliderBG.Size = UDim2.new(1, 0, 0, 8)

        SliderPart.Name = "SliderPart"
        SliderPart.Parent = SliderBG
        SliderPart.AnchorPoint = Vector2.new(0, 0.5)
        SliderPart.BackgroundColor3 = Color3.fromRGB(255, 0, 209)
        SliderPart.BorderColor3 = Color3.fromRGB(0, 0, 0)
        SliderPart.BorderSizePixel = 2
        SliderPart.Position = UDim2.new(0.00999999978, 0, 0.551999986, 0)
        SliderPart.Size = UDim2.new(0, 8, 0, 21)

        ValueLabel.Name = "ValueLabel"
        ValueLabel.Parent = SliderBG
        ValueLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ValueLabel.BackgroundTransparency = 1.000
        ValueLabel.BorderSizePixel = 0
        ValueLabel.Position = UDim2.new(-0.0224761963, 0, 0.59375, 0)
        ValueLabel.Size = UDim2.new(0, 181, 0, 16)
        ValueLabel.Font = Enum.Font.SourceSans
        ValueLabel.Text = "0"
        ValueLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        ValueLabel.TextSize = 14.000

        Button.Name = "Button"
        Button.Parent = Frame
        Button.BackgroundColor3 = Color3.fromRGB(54, 54, 54)
        Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Button.BorderSizePixel = 2
        Button.Position = UDim2.new(0.0520357415, 0, 0.257828802, 0)
        Button.Size = UDim2.new(1, 0, 0, 24)
        Button.Font = Enum.Font.SourceSans
        Button.TextColor3 = Color3.fromRGB(255, 255, 255)
        Button.TextSize = 14.000
        Button.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)

        Dropdown.Name = "Dropdown"
        Dropdown.Parent = Frame
        Dropdown.BackgroundColor3 = Color3.fromRGB(54, 54, 54)
        Dropdown.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Dropdown.BorderSizePixel = 2
        Dropdown.Position = UDim2.new(0.0520357415, 0, 0.257828802, 0)
        Dropdown.Size = UDim2.new(1, 0, 0, 24)
        Dropdown.Font = Enum.Font.SourceSans
        Dropdown.Text = "Dropdown"
        Dropdown.TextColor3 = Color3.fromRGB(202, 202, 202)
        Dropdown.TextSize = 14.000
        Dropdown.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)

        ImageLabel.Parent = Dropdown
        ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ImageLabel.BackgroundTransparency = 1.000
        ImageLabel.BorderSizePixel = 0
        ImageLabel.Position = UDim2.new(0, 5, 0, 2)
        ImageLabel.Size = UDim2.new(0, 15, 0, 15)
        ImageLabel.Image = "http://www.roblox.com/asset/?id=6545531971"

        OptionsContainer.Name = "OptionsContainer"
        OptionsContainer.Parent = Dropdown
        OptionsContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        OptionsContainer.BackgroundTransparency = 1.000
        OptionsContainer.Position = UDim2.new(-0.0121721039, 0, 1.0509218, 0)
        OptionsContainer.Size = UDim2.new(1, 4, 0, 46)

        UIListLayout.Parent = OptionsContainer
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

        Option.Name = "Option"
        Option.Parent = OptionsContainer
        Option.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
        Option.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Option.BorderSizePixel = 2
        Option.Position = UDim2.new(0.0276454985, 0, 0.344785333, 0)
        Option.Size = UDim2.new(1, 0, 0, 24)
        Option.Font = Enum.Font.SourceSans
        Option.Text = "Option"
        Option.TextColor3 = Color3.fromRGB(255, 255, 255)
        Option.TextSize = 14.000
        Option.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
        return tab
    end
    WindowTitle.Name = "WindowTitle"
    WindowTitle.Parent = Window
    WindowTitle.AnchorPoint = Vector2.new(0.5, 0)
    WindowTitle.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    WindowTitle.BackgroundTransparency = 1.000
    WindowTitle.BorderSizePixel = 0
    WindowTitle.Position = UDim2.new(0.0855549872, 0, 0.963405132, 0)
    WindowTitle.Size = UDim2.new(0, 63, 0, 17)
    WindowTitle.Font = Enum.Font.GothamBold
    WindowTitle.Text = string.upper(title)
    WindowTitle.TextColor3 = Color3.fromRGB(206, 206, 206)
    WindowTitle.TextSize = 14.000
    WindowTitle.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
    WindowTitle.TextWrapped = true
    WindowTitle.TextXAlignment = Enum.TextXAlignment.Left

    return win
end

local window = lib:Window("Test")
window:Tab()
local tab2 =window:Tab()
tab2:Checkbox("test")

return lib