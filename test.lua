----------------------------------------------------------------------------------
local function teleportAndPressE(cframe)
    local player = game.Players.LocalPlayer

    -- Teleport the player's character to a specific CFrame
    player.Character:SetPrimaryPartCFrame(cframe)

    -- Wait for a second
    wait(0.5)

    local function simulateKeyPress(keyCode)
        game:GetService("VirtualInputManager"):SendKeyEvent(true, keyCode, false, game)
    end

    -- Simulate pressing the "E" key twice with a delay in between
    simulateKeyPress(Enum.KeyCode.E)
    wait(0.5) -- Adjust the delay as needed
    simulateKeyPress(Enum.KeyCode.E)

    -- Wait for the next teleportation
    wait(0.5)
end

-- Define a sequence of teleportation coordinates
local teleportCoordinates = {
    CFrame.new(-195.040909, 66.9622498, 17.4288158, 0.965929627, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, 0.965929627),
    CFrame.new(-72.9692993, 66.9621964, 17.4288006, 0.965929627, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, 0.965929627),
    CFrame.new(-42.9359283, 67.128891, -45.1535263, 0.965929627, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, 0.965929627),
    CFrame.new(-234.130249, 66.9622498, 2.85526085, 0.965929627, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, 0.965929627),
    CFrame.new(-238.844421, 66.9622498, -62.2723923, 0.965929627, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, 0.965929627),
    CFrame.new(-212.67807, 67.6827316, -116.808083, 0.896294534, 2.33220057e-08, 0.443459302, -2.55948667e-08, 1, -8.60205407e-10, -0.443459302, -1.05792841e-08, 0.896294534),
    -- Add more coordinates as needed
}

-- Loop through the coordinates and perform teleportation and key presses
for _, coordinate in ipairs(teleportCoordinates) do
    teleportAndPressE(coordinate)
end
