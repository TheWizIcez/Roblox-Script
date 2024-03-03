local player = game.Players.LocalPlayer
local workspace = game.Workspace

local partName = "TouchedPart"

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
        local group = folder:FindFirstChild("ChestModel")
        local part = FindPartInGroup(group)
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

local bb = game:GetService('VirtualUser')
game:GetService('Players').LocalPlayer.Idled:Connect(function()
    bb:CaptureController()
    bb:ClickButton2(Vector2.new())
end)
