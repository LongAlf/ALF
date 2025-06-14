-- Services
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Variabel
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local Sc1Enabled = false -- Status awal script

-- local+global Second Script
-- loadstring(game:HttpGet("https://raw.githubusercontent.com/LongAlf/ALF/refs/heads/main/IW.lua"))()
-- loadstring(game:HttpGet("https://raw.githubusercontent.com/LongAlf/ALF/refs/heads/main/ITC.lua"))()
SC2 = false
loadstring(game:HttpGet("https://raw.githubusercontent.com/LongAlf/ALF/refs/heads/main/IW.lua"))()
local Sc2Enabled = false

-- local secondButtonEnabled = false Status tombol kedua
local minimized = false -- Status minimize

-- Fungsi untuk membuat UI
local function createUI()
    -- Membuat ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "MyScriptMenu"
    screenGui.Parent = playerGui
    screenGui.ResetOnSpawn = false

    -- Membuat Frame (Menu Pop-up)
    local frame = Instance.new("Frame")
    frame.Name = "MenuFrame"
    frame.Size = UDim2.new(0, 200, 0, 150) -- Ukuran diperbesar untuk tombol tambahan
    frame.Position = UDim2.new(0.5, -100, 0.5, -75) -- Posisi disesuaikan
    frame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    frame.BorderSizePixel = 0
    frame.Parent = screenGui

    -- Menambahkan fitur dragging
    local dragging = false
    local dragStart = nil
    local startPos = nil

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
        end
    end)

    frame.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement) then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)

    frame.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    -- Membuat TextLabel (Judul)
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "TitleLabel"
    titleLabel.Size = UDim2.new(1, 0, 0.2, 0)
    titleLabel.Position = UDim2.new(0, 0, 0, 0)
    titleLabel.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
    titleLabel.TextColor3 = Color3.new(1, 1, 1)
    titleLabel.Text = "Script Menu"
    titleLabel.TextScaled = true
    titleLabel.Parent = frame

    -- Membuat TextButton (Tombol On/Off)
    local toggleButton = Instance.new("TextButton")
    toggleButton.Name = "ToggleButton"
    toggleButton.Size = UDim2.new(0.8, 0, 0.2, 0)
    toggleButton.Position = UDim2.new(0.1, 0, 0.2, 0)
    toggleButton.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
    toggleButton.TextColor3 = Color3.new(1, 1, 1)
    toggleButton.Text = "Turn Off"
    toggleButton.TextScaled = true
    toggleButton.Parent = frame

    -- Membuat Tombol On/Off Kedua
    local secondToggleButton = Instance.new("TextButton")
    secondToggleButton.Name = "SecondToggleButton"
    secondToggleButton.Size = UDim2.new(0.8, 0, 0.2, 0)
    secondToggleButton.Position = UDim2.new(0.1, 0, 0.45, 0)
    secondToggleButton.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
    secondToggleButton.TextColor3 = Color3.new(1, 1, 1)
    secondToggleButton.Text = "CritHit Off"
    secondToggleButton.TextScaled = true
    secondToggleButton.Parent = frame

    -- Membuat Tombol Minimize
    local minimizeButton = Instance.new("TextButton")
    minimizeButton.Name = "MinimizeButton"
    minimizeButton.Size = UDim2.new(0.8, 0, 0.2, 0)
    minimizeButton.Position = UDim2.new(0.1, 0, 0.7, 0)
    minimizeButton.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
    minimizeButton.TextColor3 = Color3.new(1, 1, 1)
    minimizeButton.Text = "Minimize"
    minimizeButton.TextScaled = true
    minimizeButton.Parent = frame

    -- Fungsi untuk mengubah status script
    local function toggleScript()
        Sc1Enabled = not Sc1Enabled
        if Sc1Enabled then
            toggleButton.Text = "Turn On"
            print("Script diaktifkan!")
            -- Tambahkan fungsi yang ingin Anda aktifkan di sini
            -- Contoh:
            -- game.Workspace.Part.Transparency = 0
        else
            toggleButton.Text = "Turn Off"
            print("Script dinonaktifkan!")
            -- Tambahkan fungsi yang ingin Anda nonaktifkan di sini
            -- Contoh:
            -- game.Workspace.Part.Transparency = 1
        end
    end

    -- Fungsi untuk mengubah status tombol kedua
    local function toggleSecondButton()
        Sc2Enabled = not Sc2Enabled
        if Sc2Enabled then
            secondToggleButton.Text = "CritHit On"
            print("Tombol kedua diaktifkan!")
            -- Tambahkan fungsi yang ingin Anda aktifkan di sini
            -- Contoh:
            -- game.Workspace.Part.Transparency = 0
        else
            secondToggleButton.Text = "CritHit Off"
            print("Tombol kedua dinonaktifkan!")
            -- Tambahkan fungsi yang ingin Anda nonaktifkan di sini
            -- Contoh:
            -- game.Workspace.Part.Transparency = 1
        end
    end

    -- Fungsi untuk meminimalkan/memaksimalkan menu
    local function toggleMinimize()
        minimized = not minimized
        if minimized then
            frame.Size = UDim2.new(0, 200, 0, 30) -- Ukuran minimal
            minimizeButton.Text = "Maximize"
            for _, child in pairs(frame:GetChildren()) do
                if child ~= titleLabel and child ~= minimizeButton then
                    child.Visible = false
                end
            end
        else
            frame.Size = UDim2.new(0, 200, 0, 150) -- Ukuran normal
            minimizeButton.Text = "Minimize"
            for _, child in pairs(frame:GetChildren()) do
                child.Visible = true
            end
        end
    end

    -- Menghubungkan tombol dengan fungsi toggleScript
    toggleButton.MouseButton1Click:Connect(toggleScript)

    -- Menghubungkan tombol kedua dengan fungsi toggleSecondButton
    secondToggleButton.MouseButton1Click:Connect(toggleSecondButton)

    -- Menghubungkan tombol minimize dengan fungsi toggleMinimize
    minimizeButton.MouseButton1Click:Connect(toggleMinimize)
end

-- Memanggil fungsi untuk membuat UI
createUI()

-- Fungsi yang akan dijalankan saat script diaktifkan
local function onSc1Enabled()
    print(".")
    --game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("ArmWrestleService"):WaitForChild("RF"):WaitForChild("RequestEndFight"):InvokeServer()
    --game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("WallService"):WaitForChild("RE"):WaitForChild("claimWin"):InvokeServer()
    local args = {
        "VillainDucky",
        [4] = false
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("EggService"):WaitForChild("RF"):WaitForChild("purchaseEgg"):InvokeServer(unpack(args))
end

local function onSc2Enabled()
    local remoteEvent = game:GetService("ReplicatedStorage").Packages.Knit.Services.ArmWrestleService.RF.RequestStartFight:InvokeServer()
    if remoteEvent then
        SC2 = true
    -- Memanggil RemoteEvent
else
    print("RemoteEvent tidak ditemukan!")
    end
end

-- Memeriksa status script setiap detik
while true do
    wait(.1)
    if Sc1Enabled then
        print("Sc1")
        onSc1Enabled()
    end
    
    if Sc2Enabled then
        onSc2Enabled()
        if SC2 then
            CRITHIT()
        --TAPCLICK()
    end
end
