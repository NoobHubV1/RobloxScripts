local CmdGui = Instance.new("ScreenGui")
local Background = Instance.new("Frame")
local CmdName = Instance.new("TextLabel")
local FindCmd = Instance.new("TextBox")
local CmdHandler = Instance.new("ScrollingFrame")
local CmdText = Instance.new("TextButton")
local UIListLayout = Instance.new("UIListLayout")
local Background2 = Instance.new("Frame")
local Label = Instance.new("TextLabel")
local Execute = Instance.new("TextBox")
local Minimum = Instance.new("TextButton")
local Close = Instance.new("TextButton")
local Background3 = Instance.new("Frame")
local Topbar = Instance.new("TextLabel")
local CmdTitle = Instance.new("TextLabel")
local Background4 = Instance.new("Frame")
local Notify6 = Instance.new("TextLabel")
local Notify5 = Instance.new("TextLabel")
local Notify4 = Instance.new("TextLabel")
local Notify3 = Instance.new("TextLabel")
local Notify2 = Instance.new("TextLabel")
local Notify1 = Instance.new("TextLabel")
local CloseBar = Instance.new("TextButton")
local TransparencyBar = Instance.new("TextButton")
local Prefix = ";"
 
CmdGui.Name = "CmdGui"
CmdGui.Parent = game:GetService("CoreGui")
CmdGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
 
Background.Name = "Background"
Background.Parent = CmdGui
Background.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Background.BorderSizePixel = 0
Background.Position = UDim2.new(0.368556708, 0, 0.11490047, 0)
Background.Size = UDim2.new(0, 350, 0, 350)
Background.Active = true
Background.Draggable = true
 
CmdName.Name = "CmdName"
CmdName.Parent = Background
CmdName.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
CmdName.BorderSizePixel = 0
CmdName.Size = UDim2.new(0, 350, 0, 25)
CmdName.Font = Enum.Font.GothamBlack
CmdName.Text = "Commands"
CmdName.TextColor3 = Color3.fromRGB(255, 255, 255)
CmdName.TextScaled = true
CmdName.TextSize = 14.000
CmdName.TextWrapped = true
 
FindCmd.Name = "FindCmd"
FindCmd.Parent = Background
FindCmd.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
FindCmd.BorderColor3 = Color3.fromRGB(0, 255, 0)
FindCmd.BorderSizePixel = 0
FindCmd.Position = UDim2.new(0.0714285746, 0, 0.0702347234, 0)
FindCmd.Size = UDim2.new(0, 300, 0, 20)
FindCmd.Font = Enum.Font.SourceSans
FindCmd.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
FindCmd.PlaceholderText = "Search For Command"
FindCmd.Text = ""
FindCmd.TextColor3 = Color3.fromRGB(255, 255, 255)
FindCmd.TextSize = 14.000
FindCmd.TextWrapped = true
 
CmdHandler.Name = "CmdHandler"
CmdHandler.Parent = Background
CmdHandler.Active = true
CmdHandler.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CmdHandler.BackgroundTransparency = 1.000
CmdHandler.BorderSizePixel = 0
CmdHandler.AutomaticCanvasSize = "Y"
CmdHandler.Position = UDim2.new(0.0714285746, 0, 0.142857149, 0)
CmdHandler.Size = UDim2.new(0, 300, 0, 290)
CmdHandler.ScrollBarThickness = 2
 
CmdText.Name = "CmdText"
CmdText.Parent = nil
CmdText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CmdText.BackgroundTransparency = 1.000
CmdText.BorderSizePixel = 0
CmdText.Size = UDim2.new(0, 300, 0, 25)
CmdText.Font = Enum.Font.SourceSans
CmdText.Text = "Text"
CmdText.TextColor3 = Color3.fromRGB(255, 255, 255)
CmdText.TextScaled = true
CmdText.TextSize = 14.000
CmdText.TextWrapped = true
 
UIListLayout.Parent = CmdHandler
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
 
Minimum.Name = "Minimum"
Minimum.Parent = Background
Minimum.BackgroundColor3 = Color3.fromRGB(0, 155, 155)
Minimum.BorderSizePixel = 0
Minimum.Position = UDim2.new(0.842857122, 0, 0.00571428565, 0)
Minimum.Size = UDim2.new(0, 20, 0, 20)
Minimum.Font = Enum.Font.SourceSans
Minimum.Text = ""
Minimum.TextColor3 = Color3.fromRGB(255, 255, 255)
Minimum.TextSize = 14.000
Minimum.MouseButton1Click:Connect(function()
	if Background.BackgroundTransparency == 0 then
		Background.BackgroundTransparency = 1
		Background.Size = UDim2.new(0, 350, 0, 25)
		FindCmd.Visible = false
		CmdHandler.Visible = false
	elseif Background.BackgroundTransparency == 1 then
		Background.BackgroundTransparency = 0
		Background.Size = UDim2.new(0, 350, 0, 350)
		FindCmd.Visible = true
		CmdHandler.Visible = true
	end
end)
 
Close.Name = "Close"
Close.Parent = Background
Close.BackgroundColor3 = Color3.fromRGB(155, 0, 0)
Close.BorderSizePixel = 0
Close.Position = UDim2.new(0.928571403, 0, 0.00571428565, 0)
Close.Size = UDim2.new(0, 20, 0, 20)
Close.Font = Enum.Font.SourceSans
Close.Text = ""
Close.TextColor3 = Color3.fromRGB(255, 255, 255)
Close.TextSize = 14.000
Close.MouseButton1Click:Connect(function()
	Background.Visible = false
end)
 
-- New
 
Background2.Name = "Background"
Background2.Parent = CmdGui
Background2.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Background2.BorderSizePixel = 0
Background2.Position = UDim2.new(0.012, 0, 0.807, 0)
Background2.Size = UDim2.new(0, 250, 0, 80)
Background2.Active = true
Background2.Draggable = true
 
Label.Name = "Label"
Label.Parent = Background2
Label.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Label.BorderSizePixel = 0
Label.Position = UDim2.new(0, 0, 0, 0)
Label.Size = UDim2.new(0, 250, 0, 25)
Label.Font = Enum.Font.GothamBlack
Label.Text = "Execute Bar"
Label.TextColor3 = Color3.fromRGB(255, 255, 255)
Label.TextScaled = true
Label.TextSize = 14.000
Label.TextWrapped = true
 
Execute.Name = "Execute"
Execute.Parent = Background2
Execute.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Execute.BorderColor3 = Color3.fromRGB(0, 255, 0)
Execute.Position = UDim2.new(0.097, 0, 0.436, 0)
Execute.Size = UDim2.new(0, 200, 0, 30)
Execute.Font = Enum.Font.SourceSans
Execute.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
Execute.PlaceholderText = "Press "..Prefix.." To Enter"
Execute.Text = ""
Execute.TextColor3 = Color3.fromRGB(255, 255, 255)
Execute.TextSize = 16.000
Execute.TextWrapped = true
 
Background3.Name = "Background3"
Background3.Parent = CmdGui
Background3.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Background3.BorderSizePixel = 0
Background3.Position = UDim2.new(0.306701034, 0, 0.288421065, 0)
Background3.Size = UDim2.new(0, 200, 0, 100)
Background3.Active = true
Background3.Visible = false
 
Topbar.Name = "Topbar"
Topbar.Parent = Background3
Topbar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Topbar.BorderSizePixel = 0
Topbar.Size = UDim2.new(0, 200, 0, 25)
Topbar.Font = Enum.Font.GothamBlack
Topbar.Text = ""
Topbar.TextColor3 = Color3.fromRGB(255, 255, 255)
Topbar.TextScaled = true
Topbar.TextSize = 14.000
Topbar.TextWrapped = true
 
CmdTitle.Name = "CmdTitle"
CmdTitle.Parent = Background3
CmdTitle.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
CmdTitle.BackgroundTransparency = 1.000
CmdTitle.BorderSizePixel = 0
CmdTitle.Position = UDim2.new(0.0500000007, 0, 0.379999995, 0)
CmdTitle.Size = UDim2.new(0, 180, 0, 40)
CmdTitle.Font = Enum.Font.GothamBlack
CmdTitle.Text = ""
CmdTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
CmdTitle.TextSize = 14.000
CmdTitle.TextWrapped = true
 
Background4.Name = "Background4"
Background4.Parent = CmdGui
Background4.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Background4.BorderSizePixel = 0
Background4.Position = UDim2.new(0.0154639352, 0, 0.519107938, 0)
Background4.Size = UDim2.new(0, 250, 0, 119)
Background4.Active = true
Background4.Draggable = true
 
Notify6.Name = "Notify6"
Notify6.Parent = Background4
Notify6.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Notify6.BackgroundTransparency = 1.000
Notify6.BorderSizePixel = 0
Notify6.Position = UDim2.new(0, 0, -0.00512820482, 0)
Notify6.Size = UDim2.new(0, 250, 0, 20)
Notify6.Font = Enum.Font.GothamBlack
Notify6.Text = ""
Notify6.TextColor3 = Color3.fromRGB(255, 255, 255)
Notify6.TextScaled = true
Notify6.TextSize = 14.000
Notify6.TextWrapped = true
 
Notify5.Name = "Notify5"
Notify5.Parent = Background4
Notify5.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Notify5.BackgroundTransparency = 1.000
Notify5.BorderSizePixel = 0
Notify5.Position = UDim2.new(0, 0, 0.162939027, 0)
Notify5.Size = UDim2.new(0, 250, 0, 20)
Notify5.Font = Enum.Font.GothamBlack
Notify5.Text = ""
Notify5.TextColor3 = Color3.fromRGB(255, 255, 255)
Notify5.TextScaled = true
Notify5.TextSize = 14.000
Notify5.TextWrapped = true
 
Notify4.Name = "Notify4"
Notify4.Parent = Background4
Notify4.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Notify4.BackgroundTransparency = 1.000
Notify4.BorderSizePixel = 0
Notify4.Position = UDim2.new(0, 0, 0.331006259, 0)
Notify4.Size = UDim2.new(0, 250, 0, 20)
Notify4.Font = Enum.Font.GothamBlack
Notify4.Text = ""
Notify4.TextColor3 = Color3.fromRGB(255, 255, 255)
Notify4.TextScaled = true
Notify4.TextSize = 14.000
Notify4.TextWrapped = true
 
Notify3.Name = "Notify3"
Notify3.Parent = Background4
Notify3.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Notify3.BackgroundTransparency = 1.000
Notify3.BorderSizePixel = 0
Notify3.Position = UDim2.new(0, 0, 0.499073505, 0)
Notify3.Size = UDim2.new(0, 250, 0, 20)
Notify3.Font = Enum.Font.GothamBlack
Notify3.Text = ""
Notify3.TextColor3 = Color3.fromRGB(255, 255, 255)
Notify3.TextScaled = true
Notify3.TextSize = 14.000
Notify3.TextWrapped = true
 
Notify2.Name = "Notify2"
Notify2.Parent = Background4
Notify2.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Notify2.BackgroundTransparency = 1.000
Notify2.BorderSizePixel = 0
Notify2.Position = UDim2.new(0, 0, 0.667140722, 0)
Notify2.Size = UDim2.new(0, 250, 0, 20)
Notify2.Font = Enum.Font.GothamBlack
Notify2.Text = ""
Notify2.TextColor3 = Color3.fromRGB(255, 255, 255)
Notify2.TextScaled = true
Notify2.TextSize = 14.000
Notify2.TextWrapped = true
 
Notify1.Name = "Notify1"
Notify1.Parent = Background4
Notify1.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Notify1.BackgroundTransparency = 1.000
Notify1.BorderSizePixel = 0
Notify1.Position = UDim2.new(0, 0, 0.835207999, 0)
Notify1.Size = UDim2.new(0, 250, 0, 20)
Notify1.Font = Enum.Font.GothamBlack
Notify1.Text = ""
Notify1.TextColor3 = Color3.fromRGB(255, 255, 255)
Notify1.TextScaled = true
Notify1.TextSize = 14.000
Notify1.TextWrapped = true
 
CloseBar.Name = "CloseBar"
CloseBar.Parent = Background4
CloseBar.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
CloseBar.BorderSizePixel = 0
CloseBar.Position = UDim2.new(0.899999976, 0, -0.210084036, 0)
CloseBar.Size = UDim2.new(0, 25, 0, 25)
CloseBar.Font = Enum.Font.GothamBlack
CloseBar.Text = "X"
CloseBar.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBar.TextScaled = true
CloseBar.TextSize = 14.000
CloseBar.TextWrapped = true
CloseBar.MouseButton1Click:Connect(function()
	Background4.Visible = false
end)
 
TransparencyBar.Name = "TransparencyBar"
TransparencyBar.Parent = Background4
TransparencyBar.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
TransparencyBar.BorderSizePixel = 0
TransparencyBar.Position = UDim2.new(0.799999952, 0, -0.210084036, 0)
TransparencyBar.Size = UDim2.new(0, 25, 0, 25)
TransparencyBar.Font = Enum.Font.GothamBlack
TransparencyBar.Text = "="
TransparencyBar.TextColor3 = Color3.fromRGB(255, 255, 255)
TransparencyBar.TextScaled = true
TransparencyBar.TextSize = 14.000
TransparencyBar.TextWrapped = true
TransparencyBar.MouseButton1Click:Connect(function()
	if TransparencyBar.Text == "=" then
		Background4.BackgroundTransparency = 0.750
		CloseBar.BackgroundTransparency = 0.750
		TransparencyBar.BackgroundTransparency = 0.750
		TransparencyBar.Text = "+"
	else
		Background4.BackgroundTransparency = 0.000
		CloseBar.BackgroundTransparency = 0.000
		TransparencyBar.BackgroundTransparency = 0.000
		TransparencyBar.Text = "="
	end
end)
