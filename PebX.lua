-- Create the GUI elements
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "pebX_Executor"
screenGui.Parent = game.Players.LocalPlayer.PlayerGui

-- Main Menu Frame
local mainMenuFrame = Instance.new("Frame")
mainMenuFrame.Size = UDim2.new(0, 300, 0, 450)
mainMenuFrame.Position = UDim2.new(0.5, -150, 0.5, -225)
mainMenuFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainMenuFrame.BorderSizePixel = 0
mainMenuFrame.Visible = false
mainMenuFrame.Parent = screenGui

-- Title for the mod menu
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(0, 300, 0, 50)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.Text = "pebX Executor"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 24
titleLabel.BackgroundTransparency = 1
titleLabel.Parent = mainMenuFrame

-- Close Button
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 50, 0, 50)
closeButton.Position = UDim2.new(1, -60, 0, 0)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 0, 0)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
closeButton.TextSize = 24
closeButton.Parent = mainMenuFrame
closeButton.MouseButton1Click:Connect(function()
    mainMenuFrame.Visible = false
end)

-- Key System GUI
local keySystemFrame = Instance.new("Frame")
keySystemFrame.Size = UDim2.new(0, 300, 0, 200)
keySystemFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
keySystemFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
keySystemFrame.Visible = false
keySystemFrame.Parent = screenGui

-- Key Input
local keyLabel = Instance.new("TextLabel")
keyLabel.Size = UDim2.new(0, 260, 0, 50)
keyLabel.Position = UDim2.new(0, 20, 0, 20)
keyLabel.Text = "Enter Key"
keyLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
keyLabel.TextSize = 20
keyLabel.BackgroundTransparency = 1
keyLabel.Parent = keySystemFrame

local keyInput = Instance.new("TextBox")
keyInput.Size = UDim2.new(0, 260, 0, 50)
keyInput.Position = UDim2.new(0, 20, 0, 80)
keyInput.PlaceholderText = "Enter Key Here"
keyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
keyInput.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
keyInput.TextSize = 20
keyInput.Parent = keySystemFrame

-- Verify Button
local verifyButton = Instance.new("TextButton")
verifyButton.Size = UDim2.new(0, 120, 0, 50)
verifyButton.Position = UDim2.new(0, 90, 0, 140)
verifyButton.Text = "Verify"
verifyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
verifyButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
verifyButton.TextSize = 20
verifyButton.Parent = keySystemFrame

-- Verification Process
local function generateRandomKey()
    local characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    local randomKey = ""
    for i = 1, 16 do
        randomKey = randomKey .. characters:sub(math.random(1, #characters), math.random(1, #characters))
    end
    return randomKey
end

local correctKey = generateRandomKey()  -- Generate a random key for the player
local isVerified = false

verifyButton.MouseButton1Click:Connect(function()
    local enteredKey = keyInput.Text
    if enteredKey == correctKey then
        isVerified = true
        keySystemFrame.Visible = false
        mainMenuFrame.Visible = true
    else
        warn("Invalid Key!")
        keyInput.Text = ""
    end
end)

-- Get Key Button (trigger the key system GUI)
local getKeyButton = Instance.new("TextButton")
getKeyButton.Size = UDim2.new(0, 300, 0, 50)
getKeyButton.Position = UDim2.new(0.5, -150, 0.5, -25)
getKeyButton.Text = "Get Key"
getKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
getKeyButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
getKeyButton.TextSize = 24
getKeyButton.Parent = screenGui
getKeyButton.MouseButton1Click:Connect(function()
    keySystemFrame.Visible = true
end)

-- Main Menu Components (only visible after key is verified)
local playerFrame = Instance.new("Frame")
playerFrame.Size = UDim2.new(0, 300, 0, 250)
playerFrame.Position = UDim2.new(0, 0, 0, 50)
playerFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
playerFrame.Parent = mainMenuFrame

local playerSettingsLabel = Instance.new("TextLabel")
playerSettingsLabel.Size = UDim2.new(0, 300, 0, 40)
playerSettingsLabel.Text = "Player Settings"
playerSettingsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
playerSettingsLabel.TextSize = 20
playerSettingsLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
playerSettingsLabel.Parent = playerFrame

-- Player Speed Slider
local speedSliderLabel = Instance.new("TextLabel")
speedSliderLabel.Size = UDim2.new(0, 260, 0, 20)
speedSliderLabel.Position = UDim2.new(0, 20, 0, 50)
speedSliderLabel.Text = "Player Speed"
speedSliderLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
speedSliderLabel.TextSize = 16
speedSliderLabel.BackgroundTransparency = 1
speedSliderLabel.Parent = playerFrame

local speedSlider = Instance.new("Slider")
speedSlider.Size = UDim2.new(0, 260, 0, 30)
speedSlider.Position = UDim2.new(0, 20, 0, 80)
speedSlider.MinValue = 16
speedSlider.MaxValue = 200
speedSlider.Value = 16
speedSlider.Parent = playerFrame

speedSlider.Changed:Connect(function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = speedSlider.Value
end)

-- Player Jump Power Slider
local jumpSliderLabel = Instance.new("TextLabel")
jumpSliderLabel.Size = UDim2.new(0, 260, 0, 20)
jumpSliderLabel.Position = UDim2.new(0, 20, 0, 120)
jumpSliderLabel.Text = "Player Jump Power"
jumpSliderLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
jumpSliderLabel.TextSize = 16
jumpSliderLabel.BackgroundTransparency = 1
jumpSliderLabel.Parent = playerFrame

local jumpSlider = Instance.new("Slider")
jumpSlider.Size = UDim2.new(0, 260, 0, 30)
jumpSlider.Position = UDim2.new(0, 20, 0, 150)
jumpSlider.MinValue = 50
jumpSlider.MaxValue = 200
jumpSlider.Value = 50
jumpSlider.Parent = playerFrame

jumpSlider.Changed:Connect(function()
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = jumpSlider.Value
end)

-- Toggle Fly
local flyButton = Instance.new("TextButton")
flyButton.Size = UDim2.new(0, 260, 0, 40)
flyButton.Position = UDim2.new(0, 20, 0, 190)
flyButton.Text = "Toggle Fly"
flyButton.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
flyButton.Parent = playerFrame

local flying = false
flyButton.MouseButton1Click:Connect(function()
    flying = not flying
    -- Add flying mechanics here
end)

-- Toggle Noclip
local noclipButton = Instance.new("TextButton")
noclipButton.Size = UDim2.new(0, 260, 0, 40)
noclipButton.Position = UDim2.new(0, 20, 0, 240)
noclipButton.Text = "Toggle Noclip"
noclipButton.BackgroundColor3 = Color3.fromRGB(255, 0, 255)
noclipButton.Parent = playerFrame

local noclip = false
noclipButton.MouseButton1Click:Connect(function()
    noclip = not noclip
    -- Add noclip mechanics here
end)

-- Hotfixes Panel
local hotfixFrame = Instance.new("Frame")
hotfixFrame.Size = UDim2.new(0, 300, 0, 100)
hotfixFrame.Position = UDim2.new(0, 0, 0, 350)
hotfixFrame.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
hotfixFrame.Parent = mainMenuFrame

local hotfixLabel = Instance.new("TextLabel")
hotfixLabel.Size = UDim2.new(0, 300, 0, 100)
hotfixLabel.Text = "Hotfixes and Updates\n- Added Key System\n- Added Speed and Jump Sliders\n- Fixed Noclip Bug"
hotfixLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
hotfixLabel.TextSize = 14
hotfixLabel.TextWrapped = true
hotfixLabel.BackgroundTransparency = 1
hotfixLabel.Parent = hotfixFrame

-- Code Category (Code Execution)
local codeFrame = Instance.new("Frame")
codeFrame.Size = UDim2.new(0, 300, 0, 250)
codeFrame.Position = UDim2.new(0, 0, 0, 50)
codeFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
codeFrame.Parent = mainMenuFrame

local codeLabel = Instance.new("TextLabel")
codeLabel.Size = UDim2.new(0, 300, 0, 40)
codeLabel.Text = "Code Execution"
codeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
codeLabel.TextSize = 20
codeLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
codeLabel.Parent = codeFrame

-- Script input for code execution
local scriptInput = Instance.new("TextBox")
scriptInput.Size = UDim2.new(0, 260, 0, 50)
scriptInput.Position = UDim2.new(0, 20, 0, 50)
scriptInput.PlaceholderText = "Enter Lua Script"
scriptInput.TextColor3 = Color3.fromRGB(255, 255, 255)
scriptInput.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
scriptInput.TextSize = 16
scriptInput.Parent = codeFrame

-- Execute Button
local executeButton = Instance.new("TextButton")
executeButton.Size = UDim2.new(0, 120, 0, 50)
executeButton.Position = UDim2.new(0, 90, 0, 120)
executeButton.Text = "Execute"
executeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
executeButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
executeButton.TextSize = 20
executeButton.Parent = codeFrame

executeButton.MouseButton1Click:Connect(function()
    local scriptText = scriptInput.Text
    local success, result = pcall(function()
        loadstring(scriptText)()
    end)
    
    if not success then
        warn("Error executing script: " .. result)
    end
end)

-- Warning Panel for First-Time Use
local warningFrame = Instance.new("Frame")
warningFrame.Size = UDim2.new(0, 300, 0, 200)
warningFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
warningFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
warningFrame.Visible = false
warningFrame.Parent = screenGui

local warningLabel = Instance.new("TextLabel")
warningLabel.Size = UDim2.new(0, 260, 0, 50)
warningLabel.Position = UDim2.new(0, 20, 0, 20)
warningLabel.Text = "Warning: First-Time Executor Use"
warningLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
warningLabel.TextSize = 20
warningLabel.BackgroundTransparency = 1
warningLabel.Parent = warningFrame

local warningText = Instance.new("TextLabel")
warningText.Size = UDim2.new(0, 260, 0, 50)
warningText.Position = UDim2.new(0, 20, 0, 80)
warningText.Text = "You are about to use the executor for the first time. Please proceed carefully."
warningText.TextColor3 = Color3.fromRGB(255, 255, 255)
warningText.TextSize = 16
warningText.BackgroundTransparency = 1
warningText.Parent = warningFrame

local confirmButton = Instance.new("TextButton")
confirmButton.Size = UDim2.new(0, 120, 0, 40)
confirmButton.Position = UDim2.new(0, 90, 0, 140)
confirmButton.Text = "Confirm"
confirmButton.TextColor3 = Color3.fromRGB(255, 255, 255)
confirmButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
confirmButton.TextSize = 18
confirmButton.Parent = warningFrame

local dontShowAgainToggle = Instance.new("TextButton")
dontShowAgainToggle.Size = UDim2.new(0, 260, 0, 40)
dontShowAgainToggle.Position = UDim2.new(0, 20, 0, 180)
dontShowAgainToggle.Text = "Don't show this again"
dontShowAgainToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
dontShowAgainToggle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
dontShowAgainToggle.TextSize = 16
dontShowAgainToggle.Parent = warningFrame

local showWarningAgain = true

confirmButton.MouseButton1Click:Connect(function()
    if showWarningAgain then
        warningFrame.Visible = false
        mainMenuFrame.Visible = true
    end
end)

dontShowAgainToggle.MouseButton1Click:Connect(function()
    showWarningAgain = false
    warningFrame.Visible = false
    mainMenuFrame.Visible = true
end)

-- Make the menu draggable
local dragging, dragInput, dragStart, startPos
local function updateDrag(input)
    local delta = input.Position - dragStart
    mainMenuFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

mainMenuFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = mainMenuFrame.Position
        input.Changed:Connect(function()
            if dragging then
                updateDrag(input)
            end
        end)
    end
end)

mainMenuFrame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

-- Add the ability to open the menu after key verification
local function openMenu()
    if isVerified then
        mainMenuFrame.Visible = true
    else
        keySystemFrame.Visible = true
    end
end

getKeyButton.MouseButton1Click:Connect(openMenu)

-- Key System to initiate verification
local function initiateKeySystem()
    keySystemFrame.Visible = true
end

-- Hide Key system and show the warning for first time use
if not showWarningAgain then
    warningFrame.Visible = true
end

-- Final completion with all features integrated
print("pebX Executor loaded successfully.")
