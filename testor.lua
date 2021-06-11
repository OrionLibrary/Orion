local NotificationTable = {};

local NotificationFolder = Instance.new("Folder");

NotificationTable.CreateNotification = function(Title, Message)
	
	if getgenv then
		if (game:GetService("CoreGui"):FindFirstChild("NotificationFolder")) then
			NotificationFolder = game:GetService("CoreGui"):FindFirstChild("NotificationFolder");
		else
			NotificationFolder.Name = "NotificationFolder"
			NotificationFolder.Parent = game:GetService("CoreGui");
		end
	else
		if (game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("NotificationFolder")) then
			NotificationFolder = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("NotificationFolder");
		else
			NotificationFolder.Name = "NotificationFolder"
			NotificationFolder.Parent = game:GetService("Players").LocalPlayer.PlayerGui;
		end
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

    Notification.Name = "Notification"
	Notification.Parent = NotificationFolder
	Notification.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	Notification.Enabled = true;

    MainFrame.Name = "MainFrame"
    MainFrame.Parent = Notification
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
    DurationBar.BackgroundColor3 = Color3.fromRGB(170, 0, 255)
    DurationBar.Size = UDim2.new(0, 280, 0, 7)

    UICorner_3.CornerRadius = UDim.new(0, 3)
    UICorner_3.Parent = DurationBar

    MessageTitle.Name = "MessageTitle"
    MessageTitle.Parent = MainFrame
    MessageTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MessageTitle.BackgroundTransparency = 1.000
    MessageTitle.Position = UDim2.new(0, 48, 0, 5)
    MessageTitle.Size = UDim2.new(0, 200, 0, 25)
    MessageTitle.Font = Enum.Font.GothamBlack
    MessageTitle.Text = "Title"
    MessageTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    MessageTitle.TextSize = 24.000

    MessageTitle_2.Name = "MessageTitle"
    MessageTitle_2.Parent = MainFrame
    MessageTitle_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MessageTitle_2.BackgroundTransparency = 1.000
    MessageTitle_2.Position = UDim2.new(0, 10, 0, 33)
    MessageTitle_2.Size = UDim2.new(0, 280, 0, 35)
    MessageTitle_2.Font = Enum.Font.GothamBold
    MessageTitle_2.Text = "Message"
    MessageTitle_2.TextColor3 = Color3.fromRGB(255, 255, 255)
    MessageTitle_2.TextSize = 20.000
	return MainFrame;
end


NotificationFolder.ChildRemoved:Connect(function()
	local TweenService = game:GetService("TweenService");

	local TweenInfData = TweenInfo.new(.25);
	for _, NotificationObject in next, NotificationFolder:GetChildren() do
		local Notification = NotificationObject["MainFrame"];
		
		TweenService:Create(Notification, TweenInfData, {
			Position = UDim2.new(1, -280, 1, Notification.Position.Y.Offset + 68 + 1);
		}):Play();
	end

end)

NotificationTable.InsertNotification = function(Notification)

	local TweenService = game:GetService("TweenService");
	
	local ShowPosition = UDim2.new(1, -280, 1, -70 * #NotificationFolder:GetChildren() - 1);
	local HidePosition = UDim2.new(1, 70, 1, -70);
	
	Notification.Position = HidePosition;
	Notification.Visible = true;
	
	local TweenInfData = TweenInfo.new(0.4);
	TweenService:Create(Notification, TweenInfData, {
		Position = ShowPosition
	}):Play();
	wait(TweenInfData.Time);
	wait(4)
	TweenService:Create(Notification, TweenInfData, {
		Position = HidePosition
	}):Play();
	wait(TweenInfData.Time);
	
	Notification.Parent:Destroy();
end

NotificationTable.Notify = function(...)
    	local Args = {...};
    
    	assert(#Args < 4, "Error: Too many arguments for Notify | Expected 3");
    
    	for Index,Argument in next, Args do
    		Args[Index] = tostring(Argument);
    	end
    	
    	local NotifFrame = NotificationTable.CreateNotification(Args[1], Args[2], Args[3]);
    	
    	NotificationTable.InsertNotification(NotifFrame);
end

return NotificationTable;
