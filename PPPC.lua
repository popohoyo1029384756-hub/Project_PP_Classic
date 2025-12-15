loadstring(game:HttpGet("https://raw.githubusercontent.com/popohoyo1029384756-hub/Project_PP_Classic_LoadingGui/refs/heads/main/PPPCLG.lua"))()

local player = game.Players.LocalPlayer
local scr = Instance.new("ScreenGui")
scr.Name = "ProjectPP"
scr.ResetOnSpawn = false
scr.Parent = player:WaitForChild("PlayerGui")

-- Main Frame
local main = Instance.new("Frame", scr)
main.Size = UDim2.new(0, 600, 0, 350)
main.Position = UDim2.new(0.5, -300, 0.5, -175)
main.BackgroundColor3 = Color3.fromRGB(255,255,255)
main.BorderSizePixel = 3
main.BorderColor3 = Color3.fromRGB(0,0,0)

-- Title
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(0, 400, 0, 40)
title.Position = UDim2.new(0, 10, 0, 5)
title.Text = "Project PP Classic"
title.TextSize = 28
title.BackgroundTransparency = 1
title.Font = Enum.Font.SourceSansBold
title.TextColor3 = Color3.fromRGB(0, 0, 0)

-- Input Box
local inputFrame = Instance.new("Frame", main)
inputFrame.Size = UDim2.new(0, 420, 0, 220)
inputFrame.Position = UDim2.new(0, 10, 0, 50)
inputFrame.BackgroundColor3 = Color3.fromRGB(255,255,255)
inputFrame.BorderSizePixel = 2
inputFrame.BorderColor3 = Color3.fromRGB(0,0,0)

local input = Instance.new("TextBox", inputFrame)
input.Size = UDim2.new(1, -10, 1, -10)
input.Position = UDim2.new(0, 5, 0, 5)
input.BackgroundColor3 = Color3.fromRGB(255,255,255)
input.Text = ""
input.TextSize = 18
input.MultiLine = true
input.ClearTextOnFocus = false
input.TextWrapped = true
input.TextXAlignment = Enum.TextXAlignment.Left
input.TextYAlignment = Enum.TextYAlignment.Top
input.Font = Enum.Font.Code
input.PlaceholderText = "Paste or type your script here..."

-- Buttons
local btnFrame = Instance.new("Frame", main)
btnFrame.Size = UDim2.new(0, 420, 0, 70)
btnFrame.Position = UDim2.new(0, 10, 0, 280)
btnFrame.BackgroundTransparency = 1

local function createButton(x,text)
    local frame = Instance.new("Frame", btnFrame)
    frame.Size = UDim2.new(0, 190, 0, 60)
    frame.Position = UDim2.new(0, x, 0, 5)
    frame.BackgroundColor3 = Color3.fromRGB(255,255,255)
    frame.BorderSizePixel = 2
    frame.BorderColor3 = Color3.fromRGB(0,0,0)

    local btn = Instance.new("TextButton", frame)
    btn.Size = UDim2.new(1, -10, 1, -10)
    btn.Position = UDim2.new(0, 5, 0, 5)
    btn.Text = text
    btn.TextSize = 20
    btn.BackgroundColor3 = Color3.fromRGB(255,255,255)
    btn.TextColor3 = Color3.fromRGB(0,0,0)

    return btn
end

local execBtn = createButton(5,"Execute")
local clrBtn  = createButton(210,"Clear")

-- Script Tab Title
local scriptTitle = Instance.new("TextLabel", main)
scriptTitle.Size = UDim2.new(0, 150, 0, 35)
scriptTitle.Position = UDim2.new(0, 440, 0, 10)
scriptTitle.Text = "Script Tab"
scriptTitle.TextSize = 20
scriptTitle.BackgroundColor3 = Color3.fromRGB(255,255,255)
scriptTitle.BorderSizePixel = 2
scriptTitle.BorderColor3 = Color3.fromRGB(0,0,0)
scriptTitle.TextColor3 = Color3.fromRGB(0,0,0)

-- Script Frame
local scriptFrame = Instance.new("ScrollingFrame", main)
scriptFrame.Size = UDim2.new(0, 150, 0, 290)
scriptFrame.Position = UDim2.new(0, 440, 0, 50)
scriptFrame.CanvasSize = UDim2.new(0, 0, 0, 1000)
scriptFrame.ScrollBarThickness = 6
scriptFrame.BackgroundColor3 = Color3.fromRGB(255,255,255)
scriptFrame.BorderSizePixel = 2
scriptFrame.BorderColor3 = Color3.fromRGB(0,0,0)

-- Script List
local scripts = {
    {Title="project broken spawn",URL="https://pastebin.com/raw/NyJfL0ey"},
    {Title="ssp",URL="https://pastefy.app/XHqVeb0d/raw"},
    {Title="BiPolaria",URL="https://pastebin.com/raw/8qFWEtWY"},
    {Title="Polaria",URL="https://pastefy.app/agqEB2qs/raw"},
    {Title="Rc7",URL="https://pastebin.com/raw/E11VV0G8"},
    {Title="KlausGui ss",URL="https://pastebin.com/raw/Y0CYLJ6z"},
    {Title="luau x ss v3",URL="https://raw.githubusercontent.com/gojohdkaisenkt2/Gojohdkaisenkt-/refs/heads/main/L"},
    {Title="luau x ss v5",URL="https://rawscripts.net/raw/Universal-Script-Luau-X-SS-V5-rework-50365"},
    {Title="c00lgui",URL="https://raw.githubusercontent.com/MiRw3b/c00lgui-v3rx/main/c00lguiv3rx.lua"},
    {Title="stigma ultimate",URL="https://raw.githubusercontent.com/C-Dr1ve/Executor-Remakes-In-Lua/refs/heads/main/Remakes/Stigma_Revision_0.lua"},
    {Title="Ro Xploit tiny",URL="https://raw.githubusercontent.com/Kroostal/Ro-Xploittinyhub/refs/heads/main/RoXploit%20TinyHub"},
    {Title="Ro Xploit",URL="https://pastebin.com/raw/0hryQeGw"},
    {Title="SF",URL="https://raw.githubusercontent.com/g00byd0lanxdd/SF-1.5-MOBILE/refs/heads/main/SF%201.5%20MOBILE"},
    {Title="Rc7 blue",URL="https://pastebin.com/raw/zkeLwfT6"},
    {Title="Rc7 back",URL="https://pastebin.com/raw/b787QKMQ"},
    {Title="Project Primalia SS",URL="https://rawscripts.net/raw/Universal-Script-Project-Primalia-SS-63706"},
}

local y = 10
for _, s in ipairs(scripts) do
    local b = Instance.new("TextButton", scriptFrame)
    b.Size = UDim2.new(1, -10, 0, 40)
    b.Position = UDim2.new(0, 5, 0, y)
    b.Text = s.Title
    b.TextSize = 15
    b.Font = Enum.Font.SourceSansBold
    b.BackgroundColor3 = Color3.fromRGB(255,255,255)
    b.BorderSizePixel = 2
    b.BorderColor3 = Color3.fromRGB(0,0,0)
    b.TextColor3 = Color3.fromRGB(0,0,0)

    b.MouseButton1Click:Connect(function()
        loadstring(game:HttpGet(s.URL))()
    end)

    y += 45
end

-- Execute / Clear
execBtn.MouseButton1Click:Connect(function()
    loadstring(input.Text)()
end)

clrBtn.MouseButton1Click:Connect(function()
    input.Text = ""
end)

input.Text = [[print("Welcome to Project PP")]]

-- Full Window Drag
local UIS = game:GetService("UserInputService")
local dragging, dragInput, dragStart, startPos

local function update(input)
    local d = input.Position - dragStart
    main.Position = UDim2.new(startPos.X.Scale,startPos.X.Offset+d.X,startPos.Y.Scale,startPos.Y.Offset+d.Y)
end

main.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = i.Position
        startPos = main.Position
        i.Changed:Connect(function()
            if i.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)

main.InputChanged:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch then
        dragInput = i
    end
end)

UIS.InputChanged:Connect(function(i)
    if dragging and i == dragInput then update(i) end
end)

print("Project PP GUI loaded")
