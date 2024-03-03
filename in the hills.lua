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
            local character = player.Character
            if character and character:IsDescendantOf(workspace) and character:FindFirstChild("Humanoid") then
                player.Character:SetPrimaryPartCFrame(part.CFrame)
                return true
            end
        end
    end
    return false
end

local bb = game:GetService('VirtualUser')
local antiAFKDelay = 300
local lastActionTime = tick()

while true do
    local currentTime = tick()
    local elapsedTime = currentTime - lastActionTime

    if elapsedTime >= antiAFKDelay then
        bb:CaptureController()
        bb:ClickButton2(Vector2.new())
        lastActionTime = currentTime
    end

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
