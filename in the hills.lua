local player = game.Players.LocalPlayer
local workspace = game.Workspace
local guiService = game:GetService("GuiService")
local virtualUser = game:GetService("VirtualUser")

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
    local ba = Instance.new("ScreenGui")
    ba.Parent = game.CoreGui
    ba.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    local ca = Instance.new("TextLabel")
    ca.Parent = ba
    ca.Active = true
    ca.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471)
    ca.Draggable = true
    ca.Position = UDim2.new(0.698610067, 0, 0.098096624, 0)
    ca.Size = UDim2.new(0, 370, 0, 52)
    ca.Font = Enum.Font.SourceSansSemibold
    ca.Text = "Anti AFK"
    ca.TextColor3 = Color3.new(0, 1, 1)
    ca.TextSize = 22
    
    local da = Instance.new("Frame")
    da.Parent = ca
    da.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
    da.Position = UDim2.new(0, 0, 1.0192306, 0)
    da.Size = UDim2.new(0, 370, 0, 107)
    
    local _b = Instance.new("TextLabel")
    _b.Parent = da
    _b.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471)
    _b.Position = UDim2.new(0, 0, 0.800455689, 0)
    _b.Size = UDim2.new(0, 370, 0, 21)
    _b.Font = Enum.Font.Arial
    _b.Text = "0"
    _b.TextColor3 = Color3.new(0, 1, 1)
    _b.TextSize = 20
    
    local ab = Instance.new("TextLabel")
    ab.Parent = da
    ab.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471)
    ab.Position = UDim2.new(0, 0, 0.158377, 0)
    ab.Size = UDim2.new(0, 370, 0, 44)
    ab.Font = Enum.Font.ArialBold
    ab.Text = "Status: 1"
    ab.TextColor3 = Color3.new(0, 1, 1)
    ab.TextSize = 20
    
    player.Idled:Connect(function()
        virtualUser:CaptureController()
        virtualUser:ClickButton2(Vector2.new())
        ab.Text = "0"
        wait(2)
        ab.Text = "Status : 1"
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
