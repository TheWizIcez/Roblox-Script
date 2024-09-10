local camera = game.Workspace.CurrentCamera
local player = game.Players.LocalPlayer

camera.CameraType = Enum.CameraType.Scriptable
camera.CFrame = player.Character.Head.CFrame * CFrame.new(0, 99999, -99999)

local function hideObjects()
    for _, part in ipairs(workspace:GetDescendants()) do
        if part:IsA("BasePart") then
            part.Transparency = 1
            part.CanCollide = false
        end
    end
end

hideObjects()
