local NotificationLib = {}

function NotificationLib:CreateNotification(Title, Message, Color)
    if Title == nil then
        Title = "Error: No Title"
    else
        Title = Title
    end

    if Message == nil then
        Message = "Error: No Message"
    else
        Message = Message
    end

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
    MainFrame.Size = UDim2.new(0.182, 0, 0.111, 0)

    UICorner.CornerRadius = UDim.new(0, 5)
    UICorner.Parent = MainFrame

    DurationHolder.Name = "DurationHolder"
    DurationHolder.Parent = MainFrame
    DurationHolder.AnchorPoint = Vector2.new(0.5, 0)
    DurationHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    DurationHolder.Position = UDim2.new(0.5, 0, 0.811, 0)
    DurationHolder.Size = UDim2.new(0.933, 0, 0.078, 0)

    UICorner_2.CornerRadius = UDim.new(0, 3)
    UICorner_2.Parent = DurationHolder

    DurationBar.Name = "DurationBar"
    DurationBar.Parent = DurationHolder
    DurationBar.BackgroundColor3 = Color
    DurationBar.Size = UDim2.new(1, 0, 1, 0)

    UICorner_3.CornerRadius = UDim.new(0, 2)
    UICorner_3.Parent = DurationBar

    MessageTitle.Name = "MessageTitle"
    MessageTitle.Parent = MainFrame
    MessageTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MessageTitle.BackgroundTransparency = 1.000
    MessageTitle.Position = UDim2.new(0.16, 0, 0.056, 0)
    MessageTitle.Size = UDim2.new(0.993, 0, 0.278, 0)
    MessageTitle.Font = Enum.Font.GothamBlack
    MessageTitle.Text = Title
    MessageTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    MessageTitle.TextSize = 24.000

    MessageTitle_2.Name = "MessageTitle"
    MessageTitle_2.Parent = MainFrame
    MessageTitle_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MessageTitle_2.BackgroundTransparency = 1.000
    MessageTitle_2.Position = UDim2.new(0.033, 0, 0.367, 0)
    MessageTitle_2.Size = UDim2.new(0.993, 0, 0.389, 0)
    MessageTitle_2.Font = Enum.Font.GothamBold
    MessageTitle_2.Text = Message
    MessageTitle_2.TextColor3 = Color3.fromRGB(255, 255, 255)
    MessageTitle_2.TextSize = 20.000
end

return NotificationLib
