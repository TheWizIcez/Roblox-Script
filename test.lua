local player = game.Players.LocalPlayer

-- Teleport the player's character to a specific CFrame
player.Character:SetPrimaryPartCFrame(CFrame.new(-195.040909, 66.9622498, 17.4288158, 0.965929627, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, 0.965929627))

-- Wait for a second
wait(0.5)

local function simulateKeyPress(keyCode)
    game:GetService("VirtualInputManager"):SendKeyEvent(true, keyCode, false, game)
end

-- Simulate pressing the "E" key twice with a delay in between
simulateKeyPress(Enum.KeyCode.E)
wait(0.5) -- Adjust the delay as needed
simulateKeyPress(Enum.KeyCode.E)

--waitfor next
wait(0.5)

player.Character:SetPrimaryPartCFrame(CFrame.new(-72.9692993, 66.9621964, 17.4288006, 0.965929627, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, 0.965929627))

-- Wait for a second
wait(0.5)

local function simulateKeyPress(keyCode)
    game:GetService("VirtualInputManager"):SendKeyEvent(true, keyCode, false, game)
end

-- Simulate pressing the "E" key twice with a delay in between
simulateKeyPress(Enum.KeyCode.E)
wait(0.5) -- Adjust the delay as needed
simulateKeyPress(Enum.KeyCode.E)
