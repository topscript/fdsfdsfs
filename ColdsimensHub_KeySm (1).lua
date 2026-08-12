--[[
    ColdsimensHub - Key System UI
    Made by enloq

    HOW TO EDIT YOUR LINK:
    Scroll down to the line that says:
        local KEY_LINK = [[PUT_YOUR_LINK_HERE]]
    Replace the text between the double square brackets with your own link.
    Example:
        local KEY_LINK = [[https://yourlink.com/getkey]]
--]]

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- ============================================
-- EDIT YOUR LINK HERE (keep the double brackets)
-- ============================================
local KEY_LINK = [[PUT_YOUR_LINK_HERE]]
-- ============================================

-- Remove old instance if it exists (prevents duplicates on re-run)
local old = PlayerGui:FindFirstChild("ColdsimensHub_KeySystem")
if old then
    old:Destroy()
end

-- ===== ScreenGui =====
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ColdsimensHub_KeySystem"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = PlayerGui

-- ===== Main Frame =====
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 420, 0, 220)
MainFrame.Position = UDim2.new(0.5, -210, 0.5, -110)
MainFrame.BackgroundColor3 = Color3.fromRGB(24, 24, 28)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(80, 120, 255)
MainStroke.Thickness = 1.5
MainStroke.Transparency = 0.3
MainStroke.Parent = MainFrame

-- Subtle gradient accent
local MainGradient = Instance.new("UIGradient")
MainGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 30, 36)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 24)),
})
MainGradient.Rotation = 90
MainGradient.Parent = MainFrame

-- ===== Title Bar =====
local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Size = UDim2.new(1, 0, 0, 46)
TitleBar.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 12)
TitleCorner.Parent = TitleBar

-- Cover bottom corners of title bar so it looks flush with MainFrame
local TitleCoverFix = Instance.new("Frame")
TitleCoverFix.Size = UDim2.new(1, 0, 0, 12)
TitleCoverFix.Position = UDim2.new(0, 0, 1, -12)
TitleCoverFix.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
TitleCoverFix.BorderSizePixel = 0
TitleCoverFix.ZIndex = 0
TitleCoverFix.Parent = TitleBar

local TitleText = Instance.new("TextLabel")
TitleText.Name = "TitleText"
TitleText.Size = UDim2.new(1, -20, 1, 0)
TitleText.Position = UDim2.new(0, 16, 0, 0)
TitleText.BackgroundTransparency = 1
TitleText.Text = "ColdsimensHub"
TitleText.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleText.TextXAlignment = Enum.TextXAlignment.Left
TitleText.Font = Enum.Font.GothamBold
TitleText.TextSize = 18
TitleText.Parent = TitleBar

local SubtitleText = Instance.new("TextLabel")
SubtitleText.Name = "SubtitleText"
SubtitleText.Size = UDim2.new(0, 200, 1, 0)
SubtitleText.Position = UDim2.new(1, -216, 0, 0)
SubtitleText.BackgroundTransparency = 1
SubtitleText.Text = "made by enloq"
SubtitleText.TextColor3 = Color3.fromRGB(140, 140, 150)
SubtitleText.TextXAlignment = Enum.TextXAlignment.Right
SubtitleText.Font = Enum.Font.Gotham
SubtitleText.TextSize = 13
SubtitleText.Parent = TitleBar

-- ===== Body =====
local Body = Instance.new("Frame")
Body.Name = "Body"
Body.Size = UDim2.new(1, -32, 1, -46-16)
Body.Position = UDim2.new(0, 16, 0, 46+8)
Body.BackgroundTransparency = 1
Body.Parent = MainFrame

local InfoText = Instance.new("TextLabel")
InfoText.Name = "InfoText"
InfoText.Size = UDim2.new(1, 0, 0, 20)
InfoText.BackgroundTransparency = 1
InfoText.Text = "Enter your key below to unlock the script."
InfoText.TextColor3 = Color3.fromRGB(180, 180, 190)
InfoText.TextXAlignment = Enum.TextXAlignment.Left
InfoText.Font = Enum.Font.Gotham
InfoText.TextSize = 14
InfoText.Parent = Body

-- ===== Key Input Box =====
local KeyBox = Instance.new("TextBox")
KeyBox.Name = "KeyBox"
KeyBox.Size = UDim2.new(1, 0, 0, 40)
KeyBox.Position = UDim2.new(0, 0, 0, 32)
KeyBox.BackgroundColor3 = Color3.fromRGB(32, 32, 38)
KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyBox.PlaceholderText = "Paste your key here..."
KeyBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 130)
KeyBox.Text = ""
KeyBox.ClearTextOnFocus = false
KeyBox.Font = Enum.Font.Gotham
KeyBox.TextSize = 14
KeyBox.Parent = Body

local KeyBoxCorner = Instance.new("UICorner")
KeyBoxCorner.CornerRadius = UDim.new(0, 8)
KeyBoxCorner.Parent = KeyBox

local KeyBoxPadding = Instance.new("UIPadding")
KeyBoxPadding.PaddingLeft = UDim.new(0, 12)
KeyBoxPadding.PaddingRight = UDim.new(0, 12)
KeyBoxPadding.Parent = KeyBox

local KeyBoxStroke = Instance.new("UIStroke")
KeyBoxStroke.Color = Color3.fromRGB(60, 60, 70)
KeyBoxStroke.Thickness = 1
KeyBoxStroke.Parent = KeyBox

-- ===== Status Label =====
local StatusLabel = Instance.new("TextLabel")
StatusLabel.Name = "StatusLabel"
StatusLabel.Size = UDim2.new(1, 0, 0, 18)
StatusLabel.Position = UDim2.new(0, 0, 0, 78)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = ""
StatusLabel.TextColor3 = Color3.fromRGB(255, 90, 90)
StatusLabel.TextXAlignment = Enum.TextXAlignment.Left
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.TextSize = 13
StatusLabel.Parent = Body

-- ===== Buttons Row =====
local ButtonsRow = Instance.new("Frame")
ButtonsRow.Name = "ButtonsRow"
ButtonsRow.Size = UDim2.new(1, 0, 0, 44)
ButtonsRow.Position = UDim2.new(0, 0, 0, 104)
ButtonsRow.BackgroundTransparency = 1
ButtonsRow.Parent = Body

-- Left button: Check Key
local CheckKeyButton = Instance.new("TextButton")
CheckKeyButton.Name = "CheckKeyButton"
CheckKeyButton.Size = UDim2.new(0.5, -6, 1, 0)
CheckKeyButton.Position = UDim2.new(0, 0, 0, 0)
CheckKeyButton.BackgroundColor3 = Color3.fromRGB(80, 120, 255)
CheckKeyButton.Text = "Check Key"
CheckKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CheckKeyButton.Font = Enum.Font.GothamBold
CheckKeyButton.TextSize = 15
CheckKeyButton.AutoButtonColor = false
CheckKeyButton.Parent = ButtonsRow

local CheckKeyCorner = Instance.new("UICorner")
CheckKeyCorner.CornerRadius = UDim.new(0, 8)
CheckKeyCorner.Parent = CheckKeyButton

-- Right button: Copy Link
local CopyLinkButton = Instance.new("TextButton")
CopyLinkButton.Name = "CopyLinkButton"
CopyLinkButton.Size = UDim2.new(0.5, -6, 1, 0)
CopyLinkButton.Position = UDim2.new(0.5, 6, 0, 0)
CopyLinkButton.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
CopyLinkButton.Text = "Copy Link"
CopyLinkButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyLinkButton.Font = Enum.Font.GothamBold
CopyLinkButton.TextSize = 15
CopyLinkButton.AutoButtonColor = false
CopyLinkButton.Parent = ButtonsRow

local CopyLinkCorner = Instance.new("UICorner")
CopyLinkCorner.CornerRadius = UDim.new(0, 8)
CopyLinkCorner.Parent = CopyLinkButton

local CopyLinkStroke = Instance.new("UIStroke")
CopyLinkStroke.Color = Color3.fromRGB(80, 120, 255)
CopyLinkStroke.Thickness = 1.2
CopyLinkStroke.Transparency = 0.3
CopyLinkStroke.Parent = CopyLinkButton

-- ===== Hover / Press effects =====
local function addHoverEffect(button, normalColor, hoverColor)
    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.15), {BackgroundColor3 = hoverColor}):Play()
    end)
    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.15), {BackgroundColor3 = normalColor}):Play()
    end)
end

addHoverEffect(CheckKeyButton, Color3.fromRGB(80, 120, 255), Color3.fromRGB(100, 140, 255))
addHoverEffect(CopyLinkButton, Color3.fromRGB(40, 40, 48), Color3.fromRGB(52, 52, 62))

-- ===== Button Logic =====

-- Copy Link -> copies KEY_LINK to clipboard (if supported by the executor)
CopyLinkButton.MouseButton1Click:Connect(function()
    local success = false
    if setclipboard then
        local ok = pcall(function()
            setclipboard(KEY_LINK)
        end)
        success = ok
    end

    if success then
        StatusLabel.TextColor3 = Color3.fromRGB(100, 220, 130)
        StatusLabel.Text = "Link copied to clipboard!"
    else
        StatusLabel.TextColor3 = Color3.fromRGB(255, 180, 90)
        StatusLabel.Text = "Clipboard not supported. Link: " .. KEY_LINK
    end
end)

-- Check Key -> validate against whatever key logic you want to plug in
local function isKeyValid(inputKey)
    -- TODO: Replace this with your own key validation
    -- (e.g. compare to a key you generate, or check against a web request).
    -- Left as a placeholder function so you can wire it up yourself.
    return inputKey ~= nil and #inputKey > 0
end

CheckKeyButton.MouseButton1Click:Connect(function()
    local input = KeyBox.Text

    if input == "" then
        StatusLabel.TextColor3 = Color3.fromRGB(255, 90, 90)
        StatusLabel.Text = "Please enter a key first."
        return
    end

    if isKeyValid(input) then
        StatusLabel.TextColor3 = Color3.fromRGB(100, 220, 130)
        StatusLabel.Text = "Key accepted! Loading..."
        -- TODO: put your "unlock" logic here (e.g. destroy this GUI,
        -- then load/run the rest of your script).
    else
        StatusLabel.TextColor3 = Color3.fromRGB(255, 90, 90)
        StatusLabel.Text = "Invalid key. Try again."
    end
end)
