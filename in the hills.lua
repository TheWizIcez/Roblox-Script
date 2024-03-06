local player = game.Players.LocalPlayer
local workspace = game.Workspace
local guiService = game:GetService("GuiService")
local virtualUser = game:GetService("VirtualUser")

local function FindPartInGroup(group)
    if group then
        local part = group:FindFirstChild(partName)
        if part then
            return part
        end
    end
    return nil
end

local function TeleportPlayerToPartInFolder(folder)
    if folder then
        local chestModel = folder:FindFirstChild("ChestModel") or folder:FindFirstChild("RareChestModel")
        local part = FindPartInGroup(chestModel)
        if part then
            local humanoidRootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart then
                humanoidRootPart.CFrame = part.CFrame
                
                local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                end
                
                return true
            end
        end
    end
    return false
end

local function createAntiAFKGui()
    local gui = Instance.new("ScreenGui")
    gui.Parent = game.CoreGui

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 200, 0, 50)
    frame.Position = UDim2.new(0.5, -100, 0.5, -25)
    frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    frame.Parent = gui

    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.Position = UDim2.new(0, 0, 0, 0)
    textLabel.Text = "Anti AFK"
    textLabel.TextColor3 = Color3.new(1, 1, 1)
    textLabel.Parent = frame
end

local function handleAntiAFK()
    player.Idled:Connect(function()
        virtualUser:CaptureController()
        virtualUser:ClickButton2(Vector2.new())
    end)
end

local currentIndex = 1
while true do
    local activeChests = workspace:GetChildren()
    local folderToTeleport = nil
    
    for i = 1, #activeChests do
        local folder = activeChests[(currentIndex + i - 1) % #activeChests + 1]
        if folder.Name == "ActiveChests" then
            folderToTeleport = folder
            break
        end
    end
    
    if folderToTeleport then
        TeleportPlayerToPartInFolder(folderToTeleport)
    end
    
    currentIndex = currentIndex % #activeChests + 1
    wait(0.1)
end

createAntiAFKGui()
handleAntiAFK()
