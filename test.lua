local function teleportAndPressE()
    -- Teleport the player's character to a specific CFrame
    game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(-72.9692993, 66.9621964, 17.4288006, 0.965929627, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, 0.965929627))

    -- Simulate pressing the "E" key twice with a delay in between
    local userInputService = game:GetService("UserInputService")

    for i = 1, 2 do
        userInputService.InputBegan:Fire({ KeyCode = Enum.KeyCode.E })
        wait(0.5) -- Adjust the delay as needed
    end
end

-- Repeat the entire process 3 times
for j = 1, 3 do
    teleportAndPressE()
    wait(1) -- Adjust the delay between repetitions as needed
end
