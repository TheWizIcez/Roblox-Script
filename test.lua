local function teleportAndPressE(cframe)
    local player = game.Players.LocalPlayer

    player.Character:SetPrimaryPartCFrame(cframe)

    wait(0.25)

    local function simulateKeyPress(keyCode)
        game:GetService("VirtualInputManager"):SendKeyEvent(true, keyCode, false, game)
    end

    simulateKeyPress(Enum.KeyCode.E)
    wait(0.25)
    simulateKeyPress(Enum.KeyCode.E)

    wait(0.25)
end

local teleportCoordinates = {
    CFrame.new(-195.040909, 66.9622498, 17.4288158, 0.965929627, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, 0.965929627),
    CFrame.new(-72.9692993, 66.9621964, 17.4288006, 0.965929627, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, 0.965929627),
    CFrame.new(-42.9359283, 67.128891, -45.1535263, 0.965929627, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, 0.965929627),
    CFrame.new(-234.130249, 66.9622498, 2.85526085, 0.965929627, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, 0.965929627),
    CFrame.new(-238.844421, 66.9622498, -62.2723923, 0.965929627, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, 0.965929627),
    CFrame.new(-212.728271, 66.9622498, -35.6604843, 0.965929627, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, 0.965929627),
    CFrame.new(-212.67807, 67.6827316, -116.808083, 0.896294534, 2.33220057e-08, 0.443459302, -2.55948667e-08, 1, -8.60205407e-10, -0.443459302, -1.05792841e-08, 0.896294534),
    CFrame.new(-150.381592, 66.9622498, 11.0834742, 0.965929627, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, 0.965929627),
    CFrame.new(-112.058609, 66.9622498, 2.85526133, 0.965929627, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, 0.965929627),
    CFrame.new(-191.123596, 66.9622498, -71.7654648, 0.965929627, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, 0.965929627),
    CFrame.new(-64.3376617, 66.9622498, -6.63777924, 0.965929627, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, 0.965929627),
    CFrame.new(-69.0518951, 66.9622498, -71.7654648, 0.965929627, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, 0.965929627),
    CFrame.new(-116.772858, 66.9622498, -62.2723923, 0.965929627, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, 0.965929627),
    CFrame.new(-212.67807, 67.6827316, -116.808083, 0.896294534, 2.33220057e-08, 0.443459302, -2.55948667e-08, 1, -8.60205407e-10, -0.443459302, -1.05792841e-08, 0.896294534),
    CFrame.new(-156.606842, 66.6121826, -83.8977966, 0.964747846, 0, 0.263175994, 0, 1, 0, -0.263175994, 0, 0.964747846),
    CFrame.new(-165.007462, 66.9622498, -45.1535263, 0.965929627, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, 0.965929627),
    CFrame.new(-90.6566925, 66.9622498, -35.6604843, 0.965929627, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, 0.965929627),
    CFrame.new(-288.297974, 67.7278519, -53.0241165, 1, 0, 0, 0, 1, 0, 0, 0, 1),
    CFrame.new(-3.79797363, 67.7278519, 9.77588654, 1, 0, 0, 0, 1, 0, 0, 0, 1),
    CFrame.new(5.89070511, 67.7278519, -39.607338, 1, 0, 0, 0, 1, 0, 0, 0, 1),
    CFrame.new(-212.67807, 67.6827316, -116.808083, 0.896294534, 2.33220057e-08, 0.443459302, -2.55948667e-08, 1, -8.60205407e-10, -0.443459302, -1.05792841e-08, 0.896294534),
    CFrame.new(37.6828575, 66.9622498, -100.364952, 0.965929627, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, 0.965929627),
    CFrame.new(42.3970947, 66.9622498, -35.2372665, 0.965929627, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, 0.965929627),
    CFrame.new(63.7988281, 67.128891, -73.7530136, 0.965929627, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, 0.965929627),
    CFrame.new(33.7654991, 66.9622498, -11.1706743, 0.965929627, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, 0.965929627),
    CFrame.new(-212.67807, 67.6827316, -116.808083, 0.896294534, 2.33220057e-08, 0.443459302, -2.55948667e-08, 1, -8.60205407e-10, -0.443459302, -1.05792841e-08, 0.896294534),

}

for _ = 1, 9999999 do
    for _, coordinate in ipairs(teleportCoordinates) do
        teleportAndPressE(coordinate)
    end
end
