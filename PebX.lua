-- Screen GUI Setup
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Main Menu Frame
local mainMenuFrame = Instance.new("Frame")
mainMenuFrame.Size = UDim2.new(0, 400, 0, 300)
mainMenuFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
mainMenuFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
mainMenuFrame.Visible = false
mainMenuFrame.Parent = screenGui

local mainMenuLabel = Instance.new("TextLabel")
mainMenuLabel.Size = UDim2.new(0, 400, 0, 50)
mainMenuLabel.Text = "pebX Executor"
mainMenuLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
mainMenuLabel.TextSize = 24
mainMenuLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
mainMenuLabel.Parent = mainMenuFrame

-- Categories Button
local categories = {
    {name = "Code Execution", categoryFrame = "codeFrame"},
    {name = "Player Settings", categoryFrame = "playerFrame"},
    {name = "Scripts", categoryFrame = "scriptsFrame"}
}

local buttons = {}

for i, category in ipairs(categories) do
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 200, 0, 50)
    button.Position = UDim2.new(0, 100, 0, 60 + (i - 1) * 60)
    button.Text = category.name
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
    button.TextSize = 20
    button.Parent = mainMenuFrame
    buttons[category.categoryFrame] = button
end

-- Code Execution Category
local codeFrame = Instance.new("Frame")
codeFrame.Size = UDim2.new(0, 300, 0, 250)
codeFrame.Position = UDim2.new(0, 50, 0, 50)
codeFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
codeFrame.Visible = false
codeFrame.Parent = mainMenuFrame

local codeLabel = Instance.new("TextLabel")
codeLabel.Size = UDim2.new(0, 300, 0, 40)
codeLabel.Text = "Code Execution"
codeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
codeLabel.TextSize = 20
codeLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
codeLabel.Parent = codeFrame

local scriptInput = Instance.new("TextBox")
scriptInput.Size = UDim2.new(0, 260, 0, 50)
scriptInput.Position = UDim2.new(0, 20, 0, 50)
scriptInput.PlaceholderText = "Enter Lua Script"
scriptInput.TextColor3 = Color3.fromRGB(255, 255, 255)
scriptInput.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
scriptInput.TextSize = 16
scriptInput.Parent = codeFrame

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

-- Player Settings Category
local playerFrame = Instance.new("Frame")
playerFrame.Size = UDim2.new(0, 300, 0, 250)
playerFrame.Position = UDim2.new(0, 50, 0, 50)
playerFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
playerFrame.Visible = false
playerFrame.Parent = mainMenuFrame

local playerLabel = Instance.new("TextLabel")
playerLabel.Size = UDim2.new(0, 300, 0, 40)
playerLabel.Text = "Player Settings"
playerLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
playerLabel.TextSize = 20
playerLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
playerLabel.Parent = playerFrame

-- Speed and Jump Power Sliders
local speedSlider = Instance.new("TextBox")
speedSlider.Size = UDim2.new(0, 260, 0, 50)
speedSlider.Position = UDim2.new(0, 20, 0, 50)
speedSlider.PlaceholderText = "Speed"
speedSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
speedSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
speedSlider.TextSize = 16
speedSlider.Parent = playerFrame

local jumpSlider = Instance.new("TextBox")
jumpSlider.Size = UDim2.new(0, 260, 0, 50)
jumpSlider.Position = UDim2.new(0, 20, 0, 120)
jumpSlider.PlaceholderText = "Jump Power"
jumpSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
jumpSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
jumpSlider.TextSize = 16
jumpSlider.Parent = playerFrame

-- Fly and Noclip Toggle
local flyToggle = Instance.new("TextButton")
flyToggle.Size = UDim2.new(0, 260, 0, 50)
flyToggle.Position = UDim2.new(0, 20, 0, 180)
flyToggle.Text = "Toggle Fly"
flyToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
flyToggle.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
flyToggle.TextSize = 20
flyToggle.Parent = playerFrame

local noclipToggle = Instance.new("TextButton")
noclipToggle.Size = UDim2.new(0, 260, 0, 50)
noclipToggle.Position = UDim2.new(0, 20, 0, 240)
noclipToggle.Text = "Toggle Noclip"
noclipToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
noclipToggle.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
noclipToggle.TextSize = 20
noclipToggle.Parent = playerFrame

-- Scripts Category (Placeholder for external integration)
local scriptsFrame = Instance.new("Frame")
scriptsFrame.Size = UDim2.new(0, 300, 0, 250)
scriptsFrame.Position = UDim2.new(0, 50, 0, 50)
scriptsFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
scriptsFrame.Visible = false
scriptsFrame.Parent = mainMenuFrame

local scriptsLabel = Instance.new("TextLabel")
scriptsLabel.Size = UDim2.new(0, 300, 0, 40)
scriptsLabel.Text = "Scripts (Placeholder)"
scriptsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
scriptsLabel.TextSize = 20
scriptsLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
scriptsLabel.Parent = scriptsFrame

-- Key System Frame
local keySystemFrame = Instance.new("Frame")
keySystemFrame.Size = UDim2.new(0, 300, 0, 200)
keySystemFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
keySystemFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
keySystemFrame.Visible = false
keySystemFrame.Parent = screenGui

local keyLabel = Instance.new("TextLabel")
keyLabel.Size = UDim2.new(0, 260, 0, 50)
keyLabel.Position = UDim2.new(0, 20, 0, 20)
keyLabel.Text = "Enter Verification Key"
keyLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
keyLabel.TextSize = 20
keyLabel.BackgroundTransparency = 1
keyLabel.Parent = keySystemFrame

local keyInput = Instance.new("TextBox")
keyInput.Size = UDim2.new(0, 260, 0, 50)
keyInput.Position = UDim2.new(0, 20, 0, 80)
keyInput.PlaceholderText = "Enter Key"
keyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
keyInput.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
keyInput.TextSize = 16
keyInput.Parent = keySystemFrame

local getKeyButton = Instance.new("TextButton")
getKeyButton.Size = UDim2.new(0, 120, 0, 50)
getKeyButton.Position = UDim2.new(0.5, -60, 0, 140)
getKeyButton.Text = "Get Key"
getKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
getKeyButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
getKeyButton.TextSize = 20
getKeyButton.Parent = keySystemFrame

local isVerified = false

-- Key Verification
local function verifyKey()
    local enteredKey = keyInput.Text
    local validKey = "PebX-Is-Goated"  -- Replace this with your actual key logic

    if enteredKey == validKey then
        isVerified = true
        keySystemFrame.Visible = false
        mainMenuFrame.Visible = true
    else
        keyInput.Text = ""
        warn("Invalid key!")
    end
end

getKeyButton.MouseButton1Click:Connect(verifyKey)

-- Toggle Category Panels
for _, button in ipairs(buttons) do
    button.MouseButton1Click:Connect(function()
        for _, category in ipairs(categories) do
            local categoryFrame = mainMenuFrame:FindFirstChild(category.categoryFrame)
            if categoryFrame then
                categoryFrame.Visible = false
            end
        end
        local frame = mainMenuFrame:FindFirstChild(button.Text .. "Frame")
        if frame then
            frame.Visible = true
        end
    end)
end

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

-- Show the key system if not verified
keySystemFrame.Visible = true
mainMenuFrame.Visible = false
