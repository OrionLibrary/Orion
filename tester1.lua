local NotificationLib = {}

function NotificationLib:CreateNotification(Title, Message, Color)
    if Color == nil then
        Color = Color3.fromRGB(170, 0, 255)
    else
        Color = Color
    end

    local NotificationUI = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local DurationHolder = Instance.new("Frame")
    local UICorner_2 = Instance.new("UICorner")
    local DurationBar = Instance.new("Frame")
    local UICorner_3 = Instance.new("UICorner")
    local MessageTitle = Instance.new("TextLabel")
    local MessageTitle_2 = Instance.new("TextLabel")

    NotificationUI.Name = "NotificationUI"
    NotificationUI.Parent = game.CoreGui
    NotificationUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    MainFrame.Name = "MainFrame"
    MainFrame.Parent = NotificationUI
    MainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    MainFrame.Position = UDim2.new(0.812121212, 0, 0.87714988, 0)
    MainFrame.Size = UDim2.new(0, 300, 0, 90)

    UICorner.CornerRadius = UDim.new(0, 5)
    UICorner.Parent = MainFrame

    DurationHolder.Name = "DurationHolder"
    DurationHolder.Parent = MainFrame
    DurationHolder.AnchorPoint = Vector2.new(0.5, 0)
    DurationHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    DurationHolder.Position = UDim2.new(0, 150, 0, 73)
    DurationHolder.Size = UDim2.new(0, 280, 0, 7)

    UICorner_2.CornerRadius = UDim.new(0, 3)
    UICorner_2.Parent = DurationHolder

    DurationBar.Name = "DurationBar"
    DurationBar.Parent = DurationHolder
    DurationBar.BackgroundColor3 = Color
    DurationBar.Size = UDim2.new(0, 280, 0, 7)

    UICorner_3.CornerRadius = UDim.new(0, 2)
    UICorner_3.Parent = DurationBar

    MessageTitle.Name = "MessageTitle"
    MessageTitle.Parent = MainFrame
    MessageTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MessageTitle.BackgroundTransparency = 1.000
    MessageTitle.Position = UDim2.new(0, 48, 0, 5)
    MessageTitle.Size = UDim2.new(0, 200, 0, 25)
    MessageTitle.Font = Enum.Font.GothamBlack
    MessageTitle.Text = Title
    MessageTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    MessageTitle.TextSize = 24.000

    MessageTitle_2.Name = "MessageTitle"
    MessageTitle_2.Parent = MainFrame
    MessageTitle_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MessageTitle_2.BackgroundTransparency = 1.000
    MessageTitle_2.Position = UDim2.new(0, 10, 0, 33)
    MessageTitle_2.Size = UDim2.new(0, 280, 0, 35)
    MessageTitle_2.Font = Enum.Font.GothamBold
    MessageTitle_2.Text = Message
    MessageTitle_2.TextColor3 = Color3.fromRGB(255, 255, 255)
    MessageTitle_2.TextSize = 20.000
end

return NotificationLib
