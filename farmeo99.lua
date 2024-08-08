local MenuPanel = game.CoreGui:FindFirstChild("Fernando")
if MenuPanel then
    return  
end


local player = game.Players.LocalPlayer
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")
local missionTextLabel = Instance.new("TextLabel")
local farmLabel = Instance.new("TextLabel")
local formsLabel = Instance.new("TextLabel")
local meleeLabel = Instance.new("TextLabel")
local tpLabel = Instance.new("TextLabel")
local Reb = Instance.new("TextLabel")
local destroyLabel = Instance.new("TextLabel")
local farmButton = Instance.new("TextButton")
local formsButton = Instance.new("TextButton")
local playersButton = Instance.new("TextButton")
local MinimizeButton = Instance.new("TextButton")
local MainButton = Instance.new("TextButton")
local billsButton = Instance.new("TextButton")
local earthButton = Instance.new("TextButton")
local leftLine = Instance.new("Frame")
local rightLine = Instance.new("Frame")
local topLine = Instance.new("Frame")
local bottomLine = Instance.new("Frame")
local centerLine = Instance.new("Frame")
local upperLine = Instance.new("Frame")
local middleLine = Instance.new("Frame")
local frontSwitchLine = Instance.new("Frame")
local MenuPanel = Instance.new("Frame")
local ButtonCorner = Instance.new("UICorner")
local Panel = Instance.new("ImageLabel")
local panelExpanded = false
local sound = Instance.new("Sound", game.Workspace)
local imageLabel = Instance.new("ImageLabel")
local billsImageLabel = Instance.new("ImageLabel")
local earthImageLabel = Instance.new("ImageLabel")
local mle_extLabel = Instance.new("TextLabel")

local userId = player.UserId
local thumbnailType = Enum.ThumbnailType.HeadShot
local thumbnailSize = Enum.ThumbnailSize.Size48x48
local thumbnailUrl = Players:GetUserThumbnailAsync(userId, thumbnailType, thumbnailSize)

local UICorner = Instance.new("UICorner")

-- Funciones locales
local clickCount = 0

local function onFormsButtonClick()
    clickCount = clickCount + 1
    if clickCount % 2 == 1 then
        local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("StarterGui")

CoreGui:SetCore("SendNotification", {
    Title = "Script hecho por",
    Text = "Por PvtinxD",
    Duration = 2.5,
})

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui

local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.new(0, 0, 0)
MainFrame.BackgroundTransparency = 0.5
MainFrame.Position = UDim2.new(0.65, 0, 1.5, -43)
MainFrame.Size = UDim2.new(0.4, 0, 1.1, 0)
MainFrame.ClipsDescendants = true

local TextBox = Instance.new("TextBox")
TextBox.Parent = MainFrame
TextBox.BackgroundColor3 = Color3.new(1, 1, 1)
TextBox.Position = UDim2.new(0.05, 0, 0.05, 0)
TextBox.Size = UDim2.new(0.9, 0, 0.1, 0)
TextBox.Font = Enum.Font.SourceSans
TextBox.TextSize = 18
TextBox.PlaceholderText = "Escribe el nombre del jugador..."
TextBox.ClearTextOnFocus = true

local ScrollFrame = Instance.new("ScrollingFrame")
ScrollFrame.Parent = MainFrame
ScrollFrame.BackgroundColor3 = Color3.new(1, 1, 1)
ScrollFrame.Position = UDim2.new(0.05, 0, 0.2, 0)
ScrollFrame.Size = UDim2.new(0.9, 0, 0.65, 0)
ScrollFrame.ScrollBarThickness = 10
ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollFrame.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right
ScrollFrame.ScrollBarImageTransparency = 0
ScrollFrame.ScrollingDirection = Enum.ScrollingDirection.Y  -- Solo permite el desplazamiento vertical

local PlayerCountLabel = Instance.new("TextLabel")
PlayerCountLabel.Parent = MainFrame
PlayerCountLabel.BackgroundTransparency = 1
PlayerCountLabel.Position = UDim2.new(0.05, 0, 0.875, 0)
PlayerCountLabel.Size = UDim2.new(0.9, 0, 0.05, 0)
PlayerCountLabel.Font = Enum.Font.SourceSans
PlayerCountLabel.TextSize = 18
PlayerCountLabel.TextColor3 = Color3.new(1, 1, 1)

local ToggleButton = Instance.new("TextButton")
ToggleButton.Parent = ScreenGui
ToggleButton.BackgroundColor3 = Color3.new(0, 0, 0)
ToggleButton.BackgroundTransparency = 0.5
ToggleButton.Position = UDim2.new(0.65, 0, 0.1, -66)
ToggleButton.Size = UDim2.new(0.4, 0, 0.03, 0)
ToggleButton.Font = Enum.Font.SourceSans
ToggleButton.Text = "Mostrar/Ocultar Panel"
ToggleButton.TextColor3 = Color3.new(1, 1, 1)
ToggleButton.TextSize = 18

local panelHidden = true

local buttonStates = {}
local currentPlayer = nil

local function SlidePanelUp()
    if panelHidden then
        local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local tweenProperties = {
            Position = UDim2.new(0.65, 0, 0.1, -66)
        }
        local tween = TweenService:Create(MainFrame, tweenInfo, tweenProperties)
        tween:Play()
        panelHidden = false
    end
end

local function SlidePanelDown()
    if not panelHidden then
        local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local tweenProperties = {
            Position = UDim2.new(0.65, 0, 1.5, -43)
        }
        local tween = TweenService:Create(MainFrame, tweenInfo, tweenProperties)
        tween:Play()
        panelHidden = true
    end
end

ToggleButton.MouseButton1Click:Connect(function()
    if panelHidden then
        SlidePanelUp()
    else
        SlidePanelDown()
    end
end)

local function TeleportPlayer(playerName)
    local player = game:GetService('Players')[playerName]
    if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local targetPosition = player.Character.HumanoidRootPart.Position
        local targetDirection = player.Character.HumanoidRootPart.CFrame.LookVector

        local offset = -targetDirection * 2
        local teleportPosition = targetPosition + offset

        game:GetService('Players').LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(teleportPosition, targetPosition))
    end
end

local function invokeEnergyVolley()
    game.ReplicatedStorage.Package.Events.voleys:InvokeServer("Energy Volley", {FaceMouse = false, MouseHit = CFrame.new()}, "Blacknwhite27")
end

local function invokeMelFunctions()
    local melAttacks = {
        "High Power Rush",
        "Mach Kick",
        "Wolf Fang Fist",
        "Super Dragon Fist",
        "Spirit Barrage",
        "God Slicer",
        "Flash Kick",
        "Spirit Breaking Cannon",
        "Meteor Strike",
        "Vanish Strike",
        "Bone Charge",
        "Uppercut",
        "Sledgehammer",
        "Vital Strike"
    }

    for _, attack in ipairs(melAttacks) do
        game.ReplicatedStorage.Package.Events.mel:InvokeServer(attack, "Blacknwhite27")
    end
end

local function CreatePlayerButton(player, index)
    local PlayerButton = Instance.new("TextButton")
    
    local icons = {
        [1] = "😎",  -- Primer puesto
        [2] = "2",  -- Segundo puesto
        [3] = "2",  -- Tercer puesto
    }
    
    local rankText = icons[index] or tostring(index)  -- Usar Ã­conos o nÃºmero de puesto

    PlayerButton.Text = rankText .. " " .. player.Name
    PlayerButton.Parent = ScrollFrame
    PlayerButton.BackgroundColor3 = Color3.new(0, 0, 0)
    PlayerButton.TextColor3 = Color3.new(1, 1, 1)
    PlayerButton.Size = UDim2.new(0.9, 0, 0, 30)
    PlayerButton.Font = Enum.Font.SourceSans
    PlayerButton.TextSize = 18
    PlayerButton.BorderSizePixel = 0
    PlayerButton.AutoButtonColor = false
    PlayerButton.Position = UDim2.new(0, 0, 0, 30 * (index - 1))

    if not buttonStates[player.Name] then
        buttonStates[player.Name] = "paused"
    end

    PlayerButton.MouseButton1Click:Connect(function()
        if currentPlayer and currentPlayer ~= player.Name then
            buttonStates[currentPlayer] = "paused"
        end

        currentPlayer = player.Name

        if buttonStates[player.Name] == "paused" then
            buttonStates[player.Name] = "teleporting"
            local isLoop4Active = true

            task.spawn(function()
                while buttonStates[player.Name] == "teleporting" do
                    TeleportPlayer(player.Name)
                    if isLoop4Active then
                        pcall(function()
                            task.spawn(invokeEnergyVolley)
                            task.spawn(invokeMelFunctions)
                            task.spawn(function()
                                game:GetService("ReplicatedStorage").Package.Events.p:FireServer("Blacknwhite27", 1)
                            end)
                        end)
                    end

                    task.wait()
                end
            end)
        else
            buttonStates[player.Name] = "paused"
        end
    end)
end

local function GetPlayerStrength(player)
    local userId = player.UserId
    local playerData = game.ReplicatedStorage.Datas[userId]
    return playerData and playerData.Strength and playerData.Strength.Value or 0
end

local function UpdatePlayerList(searchQuery)
    ScrollFrame:ClearAllChildren()
    local playerList = game:GetService("Players"):GetPlayers()
    local filteredPlayers = {}

    for _, player in ipairs(playerList) do
        if string.find(player.Name:lower(), searchQuery:lower()) then
            table.insert(filteredPlayers, player)
        elseif player.DisplayName and string.find(player.DisplayName:lower(), searchQuery:lower()) then
            table.insert(filteredPlayers, player)
        end
    end

    table.sort(filteredPlayers, function(a, b)
        return GetPlayerStrength(a) > GetPlayerStrength(b)
    end)

    for index, player in ipairs(filteredPlayers) do
        CreatePlayerButton(player, index)
        local Divider = Instance.new("Frame")
        Divider.Parent = ScrollFrame
        Divider.BackgroundColor3 = Color3.new(1, 1, 1)
        Divider.Size = UDim2.new(0.9, 0, 0, 1)
        Divider.Position = UDim2.new(0, 0, 0, 30 * index)
    end

    local totalPlayers = #game:GetService("Players"):GetPlayers()
    local playersInGame = #filteredPlayers

    PlayerCountLabel.Text = "Jugadores en la partida: " .. playersInGame .. "/" .. totalPlayers

    ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, #filteredPlayers * 30)
    ScrollFrame.Visible = true
end

local function HandlePlayerChange()
    local currentStates = {}
    for playerName, state in pairs(buttonStates) do
        currentStates[playerName] = state
    end

    UpdatePlayerList(TextBox.Text)

    for playerName, state in pairs(currentStates) do
        if buttonStates[playerName] then
            buttonStates[playerName] = state
        end
    end
end

game.Players.PlayerAdded:Connect(HandlePlayerChange)
game.Players.PlayerRemoving:Connect(HandlePlayerChange)

TextBox:GetPropertyChangedSignal("Text"):Connect(HandlePlayerChange)

UpdatePlayerList("")

TextBox.FocusLost:Connect(function()
    if TextBox.Text == "" then
        UpdatePlayerList("")
    end
end)
    else
        local screenGuiName = "ScreenGui"
local scriptToDestroy = game.CoreGui:FindFirstChild(screenGuiName)

if scriptToDestroy then
    scriptToDestroy:Destroy()
    print("Script destruido exitosamente.")
else
    print("El ScreenGui a destruir no fue encontrado.")
end
    end
end

local function onFarmButtonClick()
    clickCount = clickCount + 1
    if clickCount % 2 == 1 then
        local function format_number(number)
    local suffixes = {"", "K", "M", "B", "T", "QD"}
    local suffix_index = 1

    while math.abs(number) >= 1000 and suffix_index < #suffixes do
        number = number / 1000.0
        suffix_index = suffix_index + 1
    end

    -- Redondear el nÃºmero a dos decimales si no es entero
    local formatted_number = string.format("%.2f", number)

    -- Convertir a formato entero si no tiene decimales
    if math.floor(number) == number then
        formatted_number = string.format("%d", number)
    end

    return formatted_number .. suffixes[suffix_index]
end

local function initMenu()
local player = game.Players.LocalPlayer

   local gui = Instance.new("ScreenGui")
    gui.Name = "PlayerListGui"
    gui.ResetOnSpawn = false  -- No reiniciar al reaparecer el jugador
    gui.Parent = player.PlayerGui

    local background = Instance.new("Frame")
    background.Name = "Background"
    background.Size = UDim2.new(0.4, 0, 0.6, 0)
    background.Position = UDim2.new(0, 0, 0.2, 0)
    background.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    background.BorderSizePixel = 0
    background.Parent = gui

    
    local bgCorner = Instance.new("UICorner")
    bgCorner.CornerRadius = UDim.new(0, 8)
    bgCorner.Parent = background

    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.Size = UDim2.new(1, 0, 0.1, 0)
    title.Position = UDim2.new(0, 0, 0, 0)
    title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    title.BorderSizePixel = 0
    title.Text = "Lista de Jugadores"
    title.Font = Enum.Font.SourceSansBold
    title.TextColor3 = Color3.fromRGB(0, 0, 0)
    title.TextSize = 15
    title.Parent = background


    local titleCorner = Instance.new("UICorner")
    titleCorner.CornerRadius = UDim.new(0, 8)
    titleCorner.Parent = title

    local playerListContainer = Instance.new("ScrollingFrame")
    playerListContainer.Name = "PlayerListContainer"
    playerListContainer.Size = UDim2.new(1, -20, 0.9, -40)
    playerListContainer.Position = UDim2.new(0, 10, 0.1, 20)
    playerListContainer.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    playerListContainer.BorderSizePixel = 0
    playerListContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
    playerListContainer.ScrollBarThickness = 10
    playerListContainer.ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255)
    playerListContainer.Parent = background

    -- Agregar UICorner al contenedor de la lista de jugadores
    local containerCorner = Instance.new("UICorner")
    containerCorner.CornerRadius = UDim.new(0, 8)
    containerCorner.Parent = playerListContainer

    local function createLabel(parent, text, position, size)
        local frame = Instance.new("Frame")
        frame.Size = size
        frame.Position = position
        frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        frame.BorderSizePixel = 0
        frame.Parent = parent

        -- Agregar UICorner a cada frame
        local frameCorner = Instance.new("UICorner")
        frameCorner.CornerRadius = UDim.new(0, 8)
        frameCorner.Parent = frame

        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, -10, 1, -10)
        label.Position = UDim2.new(0, 5, 0, 5)
        label.BackgroundTransparency = 1
        label.Text = text
        label.Font = Enum.Font.SourceSans
        label.TextColor3 = Color3.fromRGB(255, 255, 255)
        label.TextSize = 18
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.TextWrapped = true
        label.Parent = frame

        -- Ajuste de tamaÃ±o automÃ¡tico
        local textSizeConstraint = Instance.new("UITextSizeConstraint")
        textSizeConstraint.MaxTextSize = 18
        textSizeConstraint.Parent = label

        return frame
    end

    local function updatePlayerList()
        local players = game.Players:GetPlayers()
        table.sort(players, function(a, b)
            local forceA = game.ReplicatedStorage.Datas[a.UserId].Strength.Value
            local forceB = game.ReplicatedStorage.Datas[b.UserId].Strength.Value
            return forceA > forceB
        end)

        for _, child in ipairs(playerListContainer:GetChildren()) do
            if child:IsA("Frame") then
                child:Destroy()
            end
        end

        local yPos = 5

        for i, player in ipairs(players) do
            local playerName = player.DisplayName .. "\n(" .. player.Name .. ")"
            local rebirthValue = game.ReplicatedStorage.Datas[player.UserId].Rebirth.Value
            local forceValue = game.ReplicatedStorage.Datas[player.UserId].Strength.Value
            local formattedForce = format_number(forceValue)

            local playerFrame = Instance.new("Frame")
            playerFrame.Name = "PlayerFrame"
            playerFrame.Size = UDim2.new(1, -10, 0, 60)
            playerFrame.Position = UDim2.new(0, 5, 0, yPos)
            playerFrame.BackgroundTransparency = 1
            playerFrame.Parent = playerListContainer

            createLabel(playerFrame, playerName, UDim2.new(0, 0, 0, 0), UDim2.new(0.4, -10, 1, 0))
            createLabel(playerFrame, tostring(rebirthValue), UDim2.new(0.455, 5, 0, 0), UDim2.new(0.2, -10, 1, 0))
            createLabel(playerFrame, formattedForce, UDim2.new(0.7, 9, 0, 0), UDim2.new(0.237, -10, 1, 0))

            yPos = yPos + playerFrame.Size.Y.Offset + 5
        end

        playerListContainer.CanvasSize = UDim2.new(0, 0, 0, yPos - 5)
    end

    updatePlayerList()

    game.Players.PlayerAdded:Connect(updatePlayerList)
    game.Players.PlayerRemoving:Connect(updatePlayerList)

    game.ReplicatedStorage.Datas.ChildAdded:Connect(updatePlayerList)
    game.ReplicatedStorage.Datas.ChildRemoved:Connect(updatePlayerList)

    for _, player in ipairs(game.Players:GetPlayers()) do
        local data = game.ReplicatedStorage.Datas:FindFirstChild(player.UserId)
        if data then
            data.Strength:GetPropertyChangedSignal("Value"):Connect(updatePlayerList)
            data.Rebirth:GetPropertyChangedSignal("Value"):Connect(updatePlayerList)
            data.Zeni:GetPropertyChangedSignal("Value"):Connect(updatePlayerList) -- Escuchar cambios en Zeni
        end
    end

    while true do
        wait(5)
        updatePlayerList()
    end
end

initMenu()
    else
(game.Players.LocalPlayer.PlayerGui:FindFirstChild("PlayerListGui") or {}).Parent = nil
    end
end

-- ConfiguraciÃ³n de GUI
ScreenGui.Name = "Fernando"
ScreenGui.Parent = player.PlayerGui
ScreenGui.Parent = game.CoreGui
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

TextLabel.Parent = ScreenGui
TextLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.5, -350, 0.4, -130)
TextLabel.Size = UDim2.new(0, 410, 0, 30)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "CreadoÃ—Pvtin                                                      "
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextStrokeColor3 = Color3.fromRGB(255, 0, 0)
TextLabel.TextStrokeTransparency = 0
TextLabel.Active = true
TextLabel.Draggable = true

MenuPanel.Parent = TextLabel
MenuPanel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MenuPanel.BorderSizePixel = 0
MenuPanel.Position = UDim2.new(0, 0, 1, 0)
MenuPanel.Size = UDim2.new(0, 410, 0, 400)
MenuPanel.Visible = false

MinimizeButton.Parent = TextLabel
MinimizeButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MinimizeButton.BorderSizePixel = 0
MinimizeButton.Position = UDim2.new(0.9, 10, 0.5, -14)
MinimizeButton.Size = UDim2.new(0, 30, 0, 26)
MinimizeButton.Font = Enum.Font.SourceSans
MinimizeButton.Text = "X"
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.TextSize = 18


farmButton.Parent = MenuPanel
farmButton.Size = UDim2.new(1/3, -10, 0, 30)
farmButton.Position = UDim2.new(0, 5, 0, 5)
farmButton.Text = "List_Play"
farmButton.Font = Enum.Font.SourceSans
farmButton.TextSize = 18
farmButton.TextColor3 = Color3.fromRGB(0, 0, 0)
farmButton.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
farmButton.TextStrokeTransparency = 0
farmButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
farmButton.BorderSizePixel = 1
farmButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
farmButton.TextScaled = true



formsButton.Name = "FormsButton"
formsButton.Parent = MenuPanel
formsButton.Size = UDim2.new(1/3, -10, 0, 30)
formsButton.Position = UDim2.new(1/3, 5, 0, 5)
formsButton.Text = "Auto_Kill"
formsButton.Font = Enum.Font.SourceSans
formsButton.TextSize = 18
formsButton.TextColor3 = Color3.fromRGB(0, 0, 0)
formsButton.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
formsButton.TextStrokeTransparency = 0
formsButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
formsButton.BorderSizePixel = 1
formsButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
formsButton.TextScaled = true





playersButton.Parent = MenuPanel
playersButton.Size = UDim2.new(1/3, -10, 0, 30)
playersButton.Position = UDim2.new(2/3, 5, 0, 5)
playersButton.Text = "Players"
playersButton.Font = Enum.Font.SourceSans
playersButton.TextSize = 18
playersButton.TextColor3 = Color3.fromRGB(0, 0, 0)
playersButton.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
playersButton.TextStrokeTransparency = 0
playersButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
playersButton.BorderSizePixel = 1
playersButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
playersButton.TextScaled = true

leftLine.Parent = MenuPanel
leftLine.Size = UDim2.new(0, 3.3, 1, 0)
leftLine.Position = UDim2.new(0, 0, 0, 0)
leftLine.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
leftLine.BorderSizePixel = 0.6

rightLine.Parent = MenuPanel
rightLine.Size = UDim2.new(0, 3.3, 1, 0)
rightLine.Position = UDim2.new(1, -2, 0, 0)
rightLine.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
rightLine.BorderSizePixel = 0.6

topLine.Parent = MenuPanel
topLine.Size = UDim2.new(1, 0, 0, 3)
topLine.Position = UDim2.new(0, 0, 0, 0)
topLine.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
topLine.BorderSizePixel = 0.6

bottomLine.Parent = MenuPanel
bottomLine.Size = UDim2.new(1, 0, 0, 3)
bottomLine.Position = UDim2.new(0, 0, 1, -2)
bottomLine.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
bottomLine.BorderSizePixel = 0.6

centerLine.Parent = MenuPanel
centerLine.Size = UDim2.new(1, 0, 0, 3)
centerLine.Position = UDim2.new(0.5, -205, 0, 60)
centerLine.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
centerLine.BorderSizePixel = 0

upperLine.Parent = MenuPanel
upperLine.Size = UDim2.new(1, 0, 0, 3)
upperLine.Position = UDim2.new(0.5, -205, 0, 105)
upperLine.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
upperLine.BorderSizePixel = 0

middleLine.Parent = MenuPanel
middleLine.Size = UDim2.new(0, 3, 1, -110)
middleLine.Position = UDim2.new(0.5, -1.5, 0, 108)
middleLine.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
middleLine.BorderSizePixel = 0

frontSwitchLine.Parent = MenuPanel
frontSwitchLine.Size = UDim2.new(0, 3, 0, 43)
frontSwitchLine.Position = UDim2.new(0.4, 40, 0, 63)
frontSwitchLine.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
frontSwitchLine.BorderSizePixel = 0


farmLabel.Parent = MenuPanel
farmLabel.BackgroundTransparency = 1
farmLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
farmLabel.BorderSizePixel = 0
farmLabel.Position = UDim2.new(0.1, -30, 0, 53)
farmLabel.Size = UDim2.new(0, 89, 0, 60)
farmLabel.Font = Enum.Font.SourceSans
farmLabel.Text = "Mission"
farmLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
farmLabel.TextScaled = true
farmLabel.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
farmLabel.TextStrokeTransparency = 0


formsLabel.Parent = MenuPanel
formsLabel.BackgroundTransparency = 1
formsLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
formsLabel.BorderSizePixel = 0
formsLabel.Position = UDim2.new(0.6, -30, 0, 53)
formsLabel.Size = UDim2.new(0, 89, 0, 60)
formsLabel.Font = Enum.Font.SourceSans
formsLabel.Text = "Forms"
formsLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
formsLabel.TextScaled = true
formsLabel.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
formsLabel.TextStrokeTransparency = 0


meleeLabel.Parent = MenuPanel
meleeLabel.BackgroundTransparency = 1
meleeLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
meleeLabel.BorderSizePixel = 0
meleeLabel.Position = UDim2.new(0.01, 5, 0.2,22)
meleeLabel.Size = UDim2.new(0, 89, 0, 60)
meleeLabel.Font = Enum.Font.SourceSans
meleeLabel.Text = "Mele"
meleeLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
meleeLabel.TextScaled = true
meleeLabel.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
meleeLabel.TextStrokeTransparency = 0


tpLabel.Parent = MenuPanel
tpLabel.BackgroundTransparency = 1
tpLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
tpLabel.BorderSizePixel = 0
tpLabel.Position = UDim2.new(0.392, 30, 0.2,22)
tpLabel.Size = UDim2.new(0, 89, 0, 60)
tpLabel.Font = Enum.Font.SourceSans
tpLabel.Text = "Tp"
tpLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
tpLabel.TextScaled = true
tpLabel.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
tpLabel.TextStrokeTransparency = 0

Reb.Parent = MenuPanel
Reb.BackgroundTransparency = 1
Reb.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Reb.BorderSizePixel = 0
Reb.Position = UDim2.new(0.01, 5, 0.3,24)
Reb.Size = UDim2.new(0, 89, 0, 60)
Reb.Font = Enum.Font.SourceSans
Reb.Text = "Reb-Stats"
Reb.TextColor3 = Color3.fromRGB(0, 0, 0)
Reb.TextScaled = true
Reb.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
Reb.TextStrokeTransparency = 0


destroyLabel.Parent = MenuPanel
destroyLabel.BackgroundTransparency = 1
destroyLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
destroyLabel.BorderSizePixel = 0
destroyLabel.Position = UDim2.new(0.01, 5, 0.3,66)
destroyLabel.Size = UDim2.new(0, 99, 0, 60)
destroyLabel.Font = Enum.Font.SourceSans
destroyLabel.Text = "Destroy"
destroyLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
destroyLabel.TextScaled = true
destroyLabel.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
destroyLabel.TextStrokeTransparency = 0


mle_extLabel.Parent = MenuPanel
mle_extLabel.BackgroundTransparency = 1
mle_extLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
mle_extLabel.BorderSizePixel = 0
mle_extLabel.Position = UDim2.new(0.4, 69, 0.4, 35)
mle_extLabel.Size = UDim2.new(0, 39, 0, 40)
mle_extLabel.Font = Enum.Font.SourceSans
mle_extLabel.Text = "MLE_EXT"
mle_extLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
mle_extLabel.TextScaled = true
mle_extLabel.TextStrokeColor3 = Color3.fromRGB(205, 255, 255)
mle_extLabel.TextStrokeTransparency = 0

Panel.Parent = ScreenGui
Panel.BackgroundTransparency = 1
Panel.Position = UDim2.new(0.1, 39, 0, 60)
Panel.Size = UDim2.new(0, 70, 0, 0)
Panel.SizeConstraint = Enum.SizeConstraint.RelativeYY 
Panel.ImageColor3 = Color3.fromRGB(255, 255, 255)
Panel.ScaleType = Enum.ScaleType.Fit 
Panel.SliceCenter = Rect.new(10, 10, 10, 10)


imageLabel.Parent = MenuPanel
imageLabel.Size = UDim2.new(0, 48, 0, 48) 
imageLabel.Position = UDim2.new(1, -58, 0.8, 30) 
imageLabel.BackgroundTransparency = 1 
imageLabel.Image = thumbnailUrl


missionTextLabel.Name = "TextLabel"
missionTextLabel.Size = UDim2.new(0, 200, 0, 30)
missionTextLabel.Position = UDim2.new(0.5, 40, 0, 0)
missionTextLabel.AnchorPoint = Vector2.new(0.5, 0) 
missionTextLabel.BackgroundTransparency = 1
missionTextLabel.Font = Enum.Font.SourceSans 
missionTextLabel.TextSize = 17 -- TamaÃ±o de letra pequeÃ±o
missionTextLabel.TextColor3 = Color3.fromRGB(128, 128, 128) 
missionTextLabel.TextStrokeTransparency = 0 
missionTextLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 255) 
missionTextLabel.Parent = TextLabel



UICorner.CornerRadius = UDim.new(0, 5.5)
billsButton.Size = UDim2.new(0, 31, 0, 31)
billsButton.Position = UDim2.new(0.6, 39, 0.4, 7)
billsButton.BackgroundColor3 = Color3.new(0, 0, 0)
billsButton.BackgroundTransparency = 0.5
billsButton.Text = ""  
billsButton.Name = "Bills"  
billsButton.Parent = MenuPanel
UICorner:Clone().Parent = billsButton


billsImageLabel.Size = UDim2.new(1, 0, 1, 0)
billsImageLabel.Position = UDim2.new(0, 0, 0, 0)
billsImageLabel.BackgroundTransparency = 1
billsImageLabel.Image = "rbxassetid://17345705488"
billsImageLabel.Name = "BillsImage"  -- Nombre de la etiqueta de imagen
billsImageLabel.Parent = billsButton


earthButton.Size = UDim2.new(0, 31, 0, 31)
earthButton.Position = UDim2.new(0.5, 20, 0.4, 7)
earthButton.BackgroundColor3 = Color3.new(0, 0, 0)
earthButton.BackgroundTransparency = 0.5
earthButton.Text = ""  -- Sin texto
earthButton.Name = "Earth"  
earthButton.Parent = MenuPanel
UICorner:Clone().Parent = earthButton

earthImageLabel.Size = UDim2.new(1, 0, 1, 0)
earthImageLabel.Position = UDim2.new(0, 0, 0, 0)
earthImageLabel.BackgroundTransparency = 1
earthImageLabel.Image = "rbxassetid://17345700746"
earthImageLabel.Name = "EarthImage"  
earthImageLabel.Parent = earthButton  





local TweenService = game:GetService("TweenService")
local colorArray = {
Color3.fromRGB(255, 255, 0),   -- Amarillo
Color3.fromRGB(255, 0, 0),     -- Rojo
Color3.fromRGB(255, 165, 0),   -- Naranja
Color3.fromRGB(0, 0, 255),     -- Azul
Color3.fromRGB(255, 0, 255),   -- Magenta
Color3.fromRGB(144, 238, 144), -- Verde claro
Color3.fromRGB(255, 105, 180), -- Rosado brillante
Color3.fromRGB(75, 0, 130),    -- Ãndigo
Color3.fromRGB(72, 209, 204),  -- Turquesa claro
Color3.fromRGB(255, 69, 0)     -- Naranja rojizo
}

local colorChangeTweenInfo = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
local blurEffect = Instance.new("BlurEffect")
blurEffect.Size = 5 
blurEffect.Parent = game.Lighting  


task.spawn(function()
    local currentIndex = 1 
    while true do
        local nextColor = Color3.new(
            colorArray[currentIndex].R,
            colorArray[currentIndex].G,
            colorArray[currentIndex].B
        )

        local leftLineTween = TweenService:Create(leftLine, colorChangeTweenInfo, {BackgroundColor3 = nextColor, Transparency = 0.6})
        local rightLineTween = TweenService:Create(rightLine, colorChangeTweenInfo, {BackgroundColor3 = nextColor, Transparency = 0.6})
        local topLineTween = TweenService:Create(topLine, colorChangeTweenInfo, {BackgroundColor3 = nextColor, Transparency = 0.6})
        local bottomLineTween = TweenService:Create(bottomLine, colorChangeTweenInfo, {BackgroundColor3 = nextColor, Transparency = 0.6})
        local centerLineTween = TweenService:Create(centerLine, colorChangeTweenInfo, {BackgroundColor3 = nextColor, Transparency = 0.6})
        local upperLineTween = TweenService:Create(upperLine, colorChangeTweenInfo, {BackgroundColor3 = nextColor, Transparency = 0.6})
        local middleLineTween = TweenService:Create(middleLine, colorChangeTweenInfo, {BackgroundColor3 = nextColor, Transparency = 0.6})
        local frontSwitchLineTween = TweenService:Create(frontSwitchLine, colorChangeTweenInfo, {BackgroundColor3 = nextColor, Transparency = 0.6})
        leftLineTween:Play()
        rightLineTween:Play()
        topLineTween:Play()
        bottomLineTween:Play()
        centerLineTween:Play()
        upperLineTween:Play()
        middleLineTween:Play()
        frontSwitchLineTween:Play()
        wait(1)
        currentIndex = currentIndex % #colorArray + 1
    end
end)
ButtonCorner.Parent = MinimizeButton
ButtonCorner.CornerRadius = UDim.new(0.5, 0)
sound.SoundId = "rbxassetid://1293432192"

local menuExpanded = false
local expandTweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
local contractTweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.In)
local expandSize = UDim2.new(0, 410, 0, 400)
local contractSize = UDim2.new(0, 410, 0, 0)

local expandTween = TweenService:Create(MenuPanel, expandTweenInfo, {Size = expandSize})
local contractTween = TweenService:Create(MenuPanel, contractTweenInfo, {Size = contractSize})

MinimizeButton.MouseButton1Click:Connect(function()
    if menuExpanded then
        contractTween:Play()
        MinimizeButton.Text = "X"
       sound:Play()
        wait(0.5)
        MenuPanel.Visible = false

    else
        MenuPanel.Visible = true
        expandTween:Play()
        MinimizeButton.Text = "X"
         sound:Play()
    end
    menuExpanded = not menuExpanded
end)


local function updateMissionName()
    local currentMission = ReplicatedStorage.Datas[Players.LocalPlayer.UserId].Quest.Value
    missionTextLabel.Text = "MisiÃ³n actual: " .. currentMission
end

updateMissionName()
ReplicatedStorage.Datas[Players.LocalPlayer.UserId].Quest:GetPropertyChangedSignal("Value"):Connect(updateMissionName)



local function initSwitches(MenuPanel)
local function createSwitchModel(parent, position, switchName)
    local switchButton = Instance.new("TextButton")
    switchButton.Parent = parent
    switchButton.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
    switchButton.BorderSizePixel = 0
    switchButton.Position = position
    switchButton.Size = UDim2.new(0, 84, 0, 30)
    switchButton.Text = ""

    local switchButtonCorner = Instance.new("UICorner")
    switchButtonCorner.Parent = switchButton
    switchButtonCorner.CornerRadius = UDim.new(0.4, 0)

    local switchBall = Instance.new("Frame")
    switchBall.Parent = switchButton
    switchBall.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    switchBall.Size = UDim2.new(0, 30, 0, 30)
    switchBall.Position = UDim2.new(0, 5, 0.5, -15)
    switchBall.BorderSizePixel = 0

    local switchBallCorner = Instance.new("UICorner")
    switchBallCorner.Parent = switchBall
    switchBallCorner.CornerRadius = UDim.new(0.5, 0)

    return switchButton, switchBall
end

local switchButton1, switchBall1 = createSwitchModel(MenuPanel, UDim2.new(0.1, 75, 0, 69), "Switch1")
local switchButton2, switchBall2 = createSwitchModel(MenuPanel, UDim2.new(0.6, 75, 0, 69), "Switch2")
local switchButton3, switchBall3 = createSwitchModel(MenuPanel, UDim2.new(0.285, 0, 0.2, 36), "Switch3")
local switchButton4, switchBall4 = createSwitchModel(MenuPanel, UDim2.new(0.590, 62, 0.1, 77), "Switch4")
local switchButton5, switchBall5 = createSwitchModel(MenuPanel, UDim2.new(0.220, 19, 0.2, 81), "Switch5")
local switchButton6, switchBall6 = createSwitchModel(MenuPanel, UDim2.new(0.239, 19, 0.2, 125), "Switch6")
local switchButton7, switchBall7 = createSwitchModel(MenuPanel, UDim2.new(0.4, 49, 0.242, 125), "Switch7")

local function SaveSwitchState(isActive, switchName)
    local SwitchInfo = {
        SwitchOn = isActive,
        LastModified = os.time()
    }
    writefile(switchName.."_SwitchState.json", game:GetService("HttpService"):JSONEncode(SwitchInfo))
end

local function LoadSwitchState(switchName)
    if isfile(switchName.."_SwitchState.json") then
        local fileContents = readfile(switchName.."_SwitchState.json")
        if fileContents then
            local switchData = game:GetService("HttpService"):JSONDecode(fileContents)
            if switchData and switchData.SwitchOn ~= nil then
                return switchData.SwitchOn
            end
        end
    end
    return false
end

local function toggleSwitch(isActive, switchBall)
    if isActive then
        switchBall.Position = UDim2.new(1, -35, 0.5, -15)
        switchBall.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    else
        switchBall.Position = UDim2.new(0, 5, 0.5, -15)
        switchBall.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    end
end

local isLoop1Active = LoadSwitchState("Switch1")
local isLoop2Active = LoadSwitchState("Switch2")
local isLoop3Active = LoadSwitchState("Switch3")
local isLoop4Active = LoadSwitchState("Switch4")
local isLoop5Active = LoadSwitchState("Switch5")
local isLoop6Active = LoadSwitchState("Switch6")
local isLoop7Active = LoadSwitchState("Switch7")

local function loop1()
    while true do
        if isLoop1Active then

local loaded = false
 
   success, err = pcall(function()
       while not loaded do
    if game["loaded"] then
        
        loaded = true
        break
    end
    end
   end)
            if success then

                warn(" game loaded Function executed successfully")

             
                
            else
                warn("Error occurred:", err)
            
            end

print("game loaded")
local success, result = pcall(function()
    repeat
        task.wait()
    until game.Players.LocalPlayer ~= nil and game.Players.LocalPlayer.Name ~= nil and
        game.Players.LocalPlayer:GetMouse() ~= nil

    repeat
        task.wait()
    until game:IsLoaded()
    game:WaitForChild("ReplicatedStorage")
    game.ReplicatedStorage:WaitForChild("Datas")
    game.ReplicatedStorage.Datas:WaitForChild(game.Players.LocalPlayer.UserId)
end)
if success then



                warn(" game loaded Function executed successfully")

                
            else
                warn("Error occurred:", err)
            
            end

task.wait()


local stackneeded = true
local targetted;
local transformStatus = false
local autoFarmLoopRunning = false
local stacked = false
local flying = false

local charge = false
local checkValue;

getgenv().dead = false
getgenv().rebirthed = false

function format_number(number)
    local suffixes = {"", "K", "M", "B", "T", "QD"}
    local suffix_index = 1

    while math.abs(number) >= 1000 and suffix_index < #suffixes do
        number = number / 1000.0
        suffix_index = suffix_index + 1
    end

    return string.format("%.2f%s", number, suffixes[suffix_index])
end


function getCheckValue()
    data = game.ReplicatedStorage.Datas[game.Players.LocalPlayer.UserId]
    local a = data.Strength.Value
    local b = data.Energy.Value
    local c = data.Defense.Value
    local d = data.Speed.Value

    local smallest = a 

    if b < smallest then
        smallest = b
    end

    if c < smallest then
        smallest = c
    end

    if d < smallest then
        smallest = d
    end

    checkValue = smallest
    return checkValue
end
local PaidFormsList = {
    Evil = {{
        name = "SSJ2 Kaioken",
        reqvalue = 50000,
        endrangevalue = 160000,
        alignment = "Neutral",
        rebirthReq = 0,
        formOwned = false,
        GamePassID = 6950449
    }, {
        name = "LSSJ Kaioken",
        reqvalue = 160001,
        endrangevalue = 250000,
        alignment = "Neutral",
        rebirthReq = 0,
        formOwned = false,
        GamePassID = 6950449
    }, {
        name = "Mystic Kaioken",
        reqvalue = 250001,
        endrangevalue = 550000,
        alignment = "Neutral",
        rebirthReq = 0,
        formOwned = false,
        GamePassID = 6950449
    }, {
        name = "SSJ5",
        reqvalue = 550001,
        endrangevalue = 800000,
        alignment = "Neutral",
        rebirthReq = 0,
        formOwned = false,
        GamePassID = 6950469
    }, {
        name = "LSSJ3",
        reqvalue = 800001,
        endrangevalue = 1000000,
        alignment = "Neutral",
        rebirthReq = 0,
        formOwned = false,
        GamePassID = 6951002
    }, {
        name = "SSJG4",
        reqvalue = 1000001,
        endrangevalue = 1800000,
        alignment = "Neutral",
        rebirthReq = 0,
        formOwned = false,
        GamePassID = 6950465
    }, {
        name = "LSSJ4",
        reqvalue = 1800001,
        endrangevalue = 3000000,
        alignment = "Neutral",
        rebirthReq = 0,
        formOwned = false,
        GamePassID = 6951002
    }, {
        name = "LSSJG",
        reqvalue = 3000001,
        endrangevalue = 4000000,
        alignment = "Neutral",
        rebirthReq = 0,
        formOwned = false,
        GamePassID = 6951002
    }, {
        name = "Super Broly",
        reqvalue = 4000000,
        endrangevalue = 30000000,
        alignment = "Neutral",
        rebirthReq = 0,
        formOwned = false,
        GamePassID = 7837022
    }, {
        name = "True God of Destruction",
        reqvalue = 30000001,
        endrangevalue = 50000000,
        alignment = "Evil",
        rebirthReq = 10,
        formOwned = false,
        GamePassID = 9848987
    }, {
        name = "SSJB4",
        reqvalue = 50000001,
        endrangevalue = 120000000,
        alignment = "Neutral",
        rebirthReq = 13,
        formOwned = false,
        GamePassID = 6950465
    }, {
        name = "Blanco",
        reqvalue = 120000001,
        endrangevalue = 120000000986636346000000000,
        alignment = "Neutral",
        rebirthReq = 24,
        formOwned = false,
        GamePassID = 676684901
    }},

    Good = {{
        name = "SSJ2 Kaioken",
        reqvalue = 50000,
        endrangevalue = 160000,
        alignment = "Neutral",
        rebirthReq = 0,
        formOwned = false,
        GamePassID = 6950449
    }, {
        name = "LSSJ Kaioken",
        reqvalue = 160001,
        endrangevalue = 250000,
        alignment = "Neutral",
        rebirthReq = 0,
        formOwned = false,
        GamePassID = 6950449
    }, {
        name = "Mystic Kaioken",
        reqvalue = 250001,
        endrangevalue = 550000,
        alignment = "Neutral",
        rebirthReq = 0,
        formOwned = false,
        GamePassID = 6950449
    }, {
        name = "SSJ5",
        reqvalue = 550001,
        endrangevalue = 800000,
        alignment = "Neutral",
        rebirthReq = 0,
        formOwned = false,
        GamePassID = 6950469
    }, {
        name = "LSSJ3",
        reqvalue = 800001,
        endrangevalue = 1000000,
        alignment = "Neutral",
        rebirthReq = 0,
        formOwned = false,
        GamePassID = 6951002
    }, {
        name = "SSJG4",
        reqvalue = 1000001,
        endrangevalue = 1800000,
        alignment = "Neutral",
        rebirthReq = 0,
        formOwned = false,
        GamePassID = 6950465
    }, {
        name = "LSSJ4",
        reqvalue = 1800001,
        endrangevalue = 3000000,
        alignment = "Neutral",
        rebirthReq = 0,
        formOwned = false,
        GamePassID = 6951002
    }, {
        name = "LSSJG",
        reqvalue = 3000001,
        endrangevalue = 4000000,
        alignment = "Neutral",
        rebirthReq = 0,
        formOwned = false,
        GamePassID = 6951002
    }, {
        name = "Super Broly",
        reqvalue = 4000000,
        endrangevalue = 30000000,
        alignment = "Neutral",
        rebirthReq = 0,
        formOwned = false,
        GamePassID = 7837022
    }, {
        name = "SSJB4",
        reqvalue = 50000001,
        endrangevalue = 120000001,
        alignment = "Neutral",
        rebirthReq = 13,
        formOwned = false,
        GamePassID = 6950465
    }, {
        name = "Blanco",
        reqvalue = 120000000,
        endrangevalue = 120000000986636346000000000,
        alignment = "Neutral",
        rebirthReq = 24,
        formOwned = false,
        GamePassID = 676684901
    }}
}

local FormsList = {

    Evil = {{
        name = "Kaioken",
        reqvalue = 1000,
        endrangevalue = 2500,
        alignment = "Neutral",
        rebirthReq = 0
    }, {
        name = "FSSJ",
        reqvalue = 2501,
        endrangevalue = 6000,
        alignment = "Neutral",
        rebirthReq = 0
    }, {
        name = "SSJ",
        reqvalue = 6001,
        endrangevalue = 16000,
        alignment = "Neutral",
        rebirthReq = 0
    }, {
        name = "SSJ Kaioken",
        reqvalue = 16001,
        endrangevalue = 34000,
        alignment = "Neutral",
        rebirthReq = 0
    }, {
        name = "SSJ2",
        reqvalue = 34001,
        endrangevalue = 65000,
        alignment = "Neutral",
        rebirthReq = 0
    }, {
        name = "SSJ2 Majin",
        reqvalue = 65001,
        endrangevalue = 95000,
        alignment = "Evil",
        rebirthReq = 0
    }, {
        name = "SSJ3",
        reqvalue = 95001,
        endrangevalue = 140000,
        alignment = "Neutral",
        rebirthReq = 0
    }, {
        name = "LSSJ",
        reqvalue = 140001,
        endrangevalue = 200000,
        alignment = "Neutral",
        rebirthReq = 0
    }, {
        name = "Mystic",
        reqvalue = 200001,
        endrangevalue = 300000,
        alignment = "Neutral",
        rebirthReq = 0
    }, {
        name = "SSJ4",
        reqvalue = 300001,
        endrangevalue = 450000,
        alignment = "Neutral",
        rebirthReq = 0
    }, {
        name = "SSJG",
        reqvalue = 450001,
        endrangevalue = 700000,
        alignment = "Neutral",
        rebirthReq = 0
    }, {
        name = "Corrupt SSJ",
        reqvalue = 700001,
        endrangevalue = 1400000,
        alignment = "Evil",
        rebirthReq = 0
    }, {
        name = "SSJ Rose",
        reqvalue = 1400001,
        endrangevalue = 2400000,
        alignment = "Evil",
        rebirthReq = 0
    }, {
        name = "True Rose",
        reqvalue = 2400001,
        endrangevalue = 3000000,
        alignment = "Evil",
        rebirthReq = 0
    }, {
        name = "SSJ Berserker",
        reqvalue = 3000001,
        endrangevalue = 3500000,
        alignment = "Evil",
        rebirthReq = 1
    }, {
        name = "Dark Rose",
        reqvalue = 3500001,
        endrangevalue = 4000000,
        alignment = "Evil",
        rebirthReq = 2
    }, {
        name = "Evil SSJ",
        reqvalue = 4000001,
        endrangevalue = 5000000,
        alignment = "Evil",
        rebirthReq = 3
    }, {
        name = "Ultra Instinct Omen",
        reqvalue = 5000001,
        endrangevalue = 8000000,
        alignment = "Neutral",
        rebirthReq = 3
    }, {
        name = "Godly SSJ2",
        reqvalue = 8000001,
        endrangevalue = 14000000,
        alignment = "Neutral",
        rebirthReq = 4
    }, {
        name = "Jiren Ultra Instinct",
        reqvalue = 14000001,
        endrangevalue = 30000000,
        alignment = "Evil",
        rebirthReq = 6
    }, {
        name = "God of Destruction",
        reqvalue = 30000001,
        endrangevalue = 50000000,
        alignment = "Evil",
        rebirthReq = 10
    }, {
        name = "SSJR3",
        reqvalue = 50000001,
        endrangevalue = 100000000,
        alignment = "Evil",
        rebirthReq = 12
    }, {
        name = "LBSSJ4",
        reqvalue = 100000001,
        endrangevalue = 120000000,
        alignment = "Good",
        rebirthReq = 18
    }, {
        name = "Ultra Ego",
        reqvalue = 120000001,
        endrangevalue = 120000002,
        alignment = "Evil",
        rebirthReq = 20
    },
{
        name = "Beast",
        reqvalue = 120000003,
        endrangevalue = 100000000000000000000000,
        alignment = "Evil",
        rebirthReq = 24
    }}, -- close evil

    Good = {{
        name = "Kaioken",
        reqvalue = 1000,
        endrangevalue = 2500,
        alignment = "Neutral",
        rebirthReq = 0
    }, {
        name = "FSSJ",
        reqvalue = 2501,
        endrangevalue = 6000,
        alignment = "Neutral",
        rebirthReq = 0
    }, {
        name = "SSJ",
        reqvalue = 6001,
        endrangevalue = 16000,
        alignment = "Neutral",
        rebirthReq = 0
    }, {
        name = "SSJ Kaioken",
        reqvalue = 16001,
        endrangevalue = 34000,
        alignment = "Neutral",
        rebirthReq = 0
    }, {
        name = "SSJ2",
        reqvalue = 34001,
        endrangevalue = 65000,
        alignment = "Neutral",
        rebirthReq = 0
    }, {
        name = "Spirit SSJ",
        reqvalue = 65001,
        endrangevalue = 95000,
        alignment = "Good",
        rebirthReq = 0
    }, {
        name = "SSJ3",
        reqvalue = 95001,
        endrangevalue = 140000,
        alignment = "Neutral",
        rebirthReq = 0
    }, {
        name = "LSSJ",
        reqvalue = 140001,
        endrangevalue = 200000,
        alignment = "Neutral",
        rebirthReq = 0
    }, {
        name = "Mystic",
        reqvalue = 200001,
        endrangevalue = 300000,
        alignment = "Neutral",
        rebirthReq = 0
    }, {
        name = "SSJ4",
        reqvalue = 300001,
        endrangevalue = 450000,
        alignment = "Neutral",
        rebirthReq = 0
    }, {
        name = "SSJG",
        reqvalue = 450001,
        endrangevalue = 700000,
        alignment = "Neutral",
        rebirthReq = 0
    }, {
        name = "SSJ Rage",
        reqvalue = 700001,
        endrangevalue = 1200000,
        alignment = "Good",
        rebirthReq = 0
    }, {
        name = "SSJ Blue",
        reqvalue = 1200001,
        endrangevalue = 2200000,
        alignment = "Good",
        rebirthReq = 0
    }, {
        name = "SSJB Kaioken",
        reqvalue = 2200001,
        endrangevalue = 3000000,
        alignment = "Good",
        rebirthReq = 0
    }, {
        name = "Kefla SSJ2",
        reqvalue = 3000001,
        endrangevalue = 3500000,
        alignment = "Good",
        rebirthReq = 1
    }, {
        name = "Blue Evolution",
        reqvalue = 3500001,
        endrangevalue = 5000000,
        alignment = "Good",
        rebirthReq = 2
    }, {
        name = "Ultra Instinct Omen",
        reqvalue = 5000001,
        endrangevalue = 8000000,
        alignment = "Neutral",
        rebirthReq = 3
    }, {
        name = "Godly SSJ2",
        reqvalue = 8000001,
        endrangevalue = 14000000,
        alignment = "Neutral",
        rebirthReq = 4
    }, {
        name = "Mastered Ultra Instinct",
        reqvalue = 14000001,
        endrangevalue = 30000000,
        alignment = "Good",
        rebirthReq = 6
    }, {
        name = "God of Creation",
        reqvalue = 30000001,
        endrangevalue = 50000000,
        alignment = "Good",
        rebirthReq = 10
    }, {
        name = "SSJB3",
        reqvalue = 50000001,
        endrangevalue = 100000000,
        alignment = "Good",
        rebirthReq = 12
    }, {
        name = "LBSSJ4",
        reqvalue = 100000001,
        endrangevalue = 120000001,
        alignment = "Good",
        rebirthReq = 18
    }, {
        name = "SSJBUI",
        reqvalue = 120000001,
        endrangevalue = 120000002,
        alignment = "Good",
        rebirthReq = 20
    },
{
        name = "Beast",
        reqvalue = 120000003,
        endrangevalue = 100000000000000000000000,
        alignment = "Good",
        rebirthReq = 24
    }}
}

local quests = {{
    name = "X Fighter Trainer",
    nickname = "X Fighter",
    requiredValue = 0,
    endRange = 30000,
    planet = "Earth"
}, {
    name = "Klirin",
    nickname = "Klirin",
    requiredValue = 30001,
    endRange = 60000,
    planet = "Earth"
}, {
    name = "Kid Nohag",
    nickname = "Kid Nohag",
    requiredValue = 60001,
    endRange = 80000,
    planet = "Earth"
}, {
    name = "Turtle Student",
    nickname = "Turtle Student",
    requiredValue = 80001,
    endRange = 100000,
    planet = "Earth"
}, {
    name = "Radish",
    nickname = "Radish",
    requiredValue = 100001,
    endRange = 200000,
    planet = "Earth"
}, {
    name = "Mapa",
    nickname = "Mapa",
    requiredValue = 200001,
    endRange = 300000,
    planet = "Earth"
}, {
    name = "Citizen",
    nickname = "Evil Saya",
    requiredValue = 300001,
    endRange = 400000,
    planet = "Earth"
}, {
    name = "Top X Fighter",
    nickname = "X Fighter Master",
    requiredValue = 400001,
    endRange = 750000,
    planet = "Earth"
}, {
    name = "Super Vegetable",
    nickname = "Super Vegetable",
    requiredValue = 750001,
    endRange = 1000000,
    planet = "Earth"
}, {
    name = "Chilly",
    nickname = "Chilly",
    requiredValue = 100001,
    endRange = 3000000,
    planet = "Earth"
}, {
    name = "Perfect Atom",
    nickname = "Perfect Atom",
    requiredValue = 3000001,
    endRange = 5100000,
    planet = "Earth"
}, {
    name = "SSJ2 Wukong",
    nickname = "SSJ2 Wukong",
    requiredValue = 5100001,
    endRange = 6000000,
    planet = "Earth"
}, {
    name = "SSJB Wukong",
    nickname = "SSJB Wukong",
    requiredValue = 6000001,
    endRange = 30500000,
    planet = "Earth"
}, {
    name = "Broccoli",
    nickname = "Broccoli",
    requiredValue = 30500001,
    endRange = 100000000,
    planet = "Earth"
}, {
    name = "SSJG Kakata",
    nickname = "SSJG Kakata",
    requiredValue = 100000000,
    endRange = 150000000,
    planet = "Earth"
}, {
    name = "Vegetable (GoD in-training)",
    nickname = "Vegetable (GoD in-training)",
    requiredValue = 150000001,
    endRange = 250000000,
    planet = "Bills"
}, {
    name = "Wukong (Omen)",
    nickname = "Wukong (Omen)",
    requiredValue = 250000001,
    endRange = 320000000,
    planet = "Bills"
}, {
    name = "Vills (50%)",
    nickname = "Vills (50%)",
    requiredValue = 320000001,
    endRange = 500000000,
    planet = "Bills"
}, {
    name = "Vis (20%)",
    nickname = "Vis (20%)",
    requiredValue = 500000001,
    endRange = 1000000000,
    planet = "Bills"
}, {
    name = "Vegetable (LBSSJ4)",
    nickname = "Vegetable (LBSSJ4)",
    requiredValue = 1000000001,
    endRange = 1900000000,
    planet = "Bills"
}, {
    name = "Wukong (LBSSJ4)",
    nickname = "Wukong (LBSSJ4)",
    requiredValue = 1500000001,
    endRange = 3000000000,
    planet = "Bills"
}, {
    name = "Vekuta (LBSSJ4)",
    nickname = "Vekuta (LBSSJ4)",
    requiredValue = 3000000001,
    endRange = 3500000000,
    planet = "Bills"
}, {
    name = "Wukong Rose",
    nickname = "Wukong Rose",
    requiredValue = 3500000001,
    endRange = 5250000000,
    planet = "Bills"
}, {
    name = "Vekuta (SSJBUI)",
    nickname = "Vekuta (SSJBUI)",
    requiredValue = 4450000001,
    endRange = 2000000000000000000,
    planet = "Bills"
}}



local function check1()
    pcall(function()
    local checkValue = getCheckValue()

    if checkValue >= 150000000 and game.placeId ~= 5151400895 then
        data = game.ReplicatedStorage.Datas[game.Players.LocalPlayer.UserId]
        if data.Zeni.Value >= 15000 then

            local A_1 = "Vills Planet"
            local Event = game:GetService("ReplicatedStorage").Package.Events.TP
            Event:InvokeServer(A_1)
            tp = true
            return tp
        else
            SelectedQuests = "SSJG Kakata"
            SelectedMobs1 = "SSJG Kakata"

            tp = false
            return SelectedQuests, SelectedMobs, tp

        end
    end

    if checkValue <= 150000000 and game.placeId == 5151400895 then

        if checkValue < 150000000 and game.placeId ~= 3311165597 then
            local A_1 = "Earth"
            local Event = game:GetService("ReplicatedStorage").Package.Events.TP
            Event:InvokeServer(A_1)
            task.wait(8)
        end
    end
end)
end

function target()
    targetted = game.Players.LocalPlayer.name

end
pcall(function() target() end)
local function deadcheck(LDCheck)
    success, err = pcall(function()
        task.wait()
        if game.Players.LocalPlayer.Character.Humanoid.Health <= 0 then
            getgenv().dead = true
            transformStatus = false
            autoFarmLoopRunning = false
            flying = false
            questneeded = true
            

        else
            autoFarmLoopRunning = true
            getgenv().dead = false
            
        end
    end)
    if LDCheck then
        getgenv().stackneeded = false
        autoFarmLoopRunning = true
        print("last dead check passed")
    end
    if success then
        warn("Stack loop Function executed successfully with a value of " .. tostring(getgenv().dead))
      
        
    else
        warn("Error occurred:", err)
        
    end
    return autoFarmLoopRunning, transformStatus, flying
end

function startgame()
    pcall(function()

        repeat

            if game.workspace[targetted] then
                task.wait()
                local Event = game:GetService("ReplicatedStorage").Package.Events.Start
                Event:InvokeServer()
                task.wait()

                local Event = game:GetService("ReplicatedStorage").Package.Events.Start
                Event:InvokeServer()

                task.wait()

                game.Players.LocalPlayer.PlayerGui.Main.bruh.Disabled = true

                game.Players.LocalPlayer.PlayerGui.Main.bruh.Disabled = false

                task.wait()
                local Event = game:GetService("ReplicatedStorage").Package.Events.Start
                Event:InvokeServer()

            end
        until game.workspace.Living[targetted]

    end)

end
repeat
 success, err = pcall(function() 
local function CheckGamePass(UserId, GamePassID)
    local MarketplaceService = game:GetService("MarketplaceService")
    return MarketplaceService:UserOwnsGamePassAsync(UserId, GamePassID)
end

local userId = game.Players.LocalPlayer.UserId 

for _, form in ipairs(PaidFormsList["Evil"]) do

    form.formOwned = CheckGamePass(userId, form.GamePassID)

end

for _, form in ipairs(PaidFormsList["Good"]) do
    form.formOwned = CheckGamePass(userId, form.GamePassID)
end

for _, form in ipairs(PaidFormsList["Good"]) do

    print(string.format("Name: %s, ReqValue: %d, EndRangeValue: %d, Alignment: %s, RebirthReq: %d, FormOwned: %s",
        form.name, form.reqvalue, form.endrangevalue, form.alignment, form.rebirthReq, tostring(form.formOwned)))

end
end)
task.wait()
until success


local function autostack(stack1)
    pcall(function()
        targetted = game.Players.LocalPlayer.name
        data = game.ReplicatedStorage.Datas[game.Players.LocalPlayer.UserId]
        if stack1 == true and data.Energy.Value > 8000000 and getgenv().dead == false then
            task.wait(1)
          

            game.workspace.Living[targetted].UpperTorso:Destroy()
            task.wait(5)
            local Remote = game.ReplicatedStorage.Package.Events['equipskill']
            local Arguments = {
                [1] = "Godly SSJ2"
            }
            Remote:InvokeServer(unpack(Arguments))
            local Remote = game.ReplicatedStorage.Package.Events['ta']
            i = 0
            repeat
                Remote:InvokeServer(unpack(Arguments))
                i = i + 1
                task.wait(.1)
            until i == 8
            task.wait()
            getgenv().stackneeded = false
            transformStatus = true
            autoFarmLoopRunning = true
            flying = false
            return transformStatus, autoFarmLoopRunning, flying
        elseif stack1 == false then
            getgenv().stackneeded = false
            transformStatus = true
            autoFarmLoopRunning = true
            flying = false
            return  transformStatus, autoFarmLoopRunning, flying
        elseif stack1 == true and data.Energy.Value < 8000000 then
            task.wait()
            getgenv().stackneeded = false
            transformStatus = true
            autoFarmLoopRunning = true
            flying = false
            return  transformStatus, autoFarmLoopRunning, flying
        end
    end)
end

pcall(function()
    task.wait()
    check1()

    repeat

        startgame()

    until game.workspace.Living[targetted]

end)
task.spawn(function()
pcall(function()
    local bb = game:service 'VirtualUser'
    game:service 'Players'.LocalPlayer.Idled:connect(function()
        bb:CaptureController()
        bb:ClickButton2(Vector2.new())
        task.wait(2)

    end)
end)
end)
sameplanet = true
SelectedQuests = ""
SelectedMobs = ""
local planet1 = ""

local function getQuest(switch1)
    switch1 = getgenv().switch1

    local checkValue = getCheckValue()

    local previousQuestName -- Variable to keep track of the previous quest's name for switch == 1
  

    for i, quest in ipairs(quests) do
        if checkValue >= quest.requiredValue and checkValue <= quest.endRange then
            currentQuestIndex = i

            if switch1 == 1 then

                SelectedQuests = quest.name
                SelectedMobs = quest.nickname
                planet1 = quest.planet

                return SelectedQuests, SelectedMobs, planet1 -- exit the loop if a quest is found
            elseif switch1 == 2 then
                if currentQuestIndex >= 2 then

                    for j = i - 1, 1, -1 do -- search for the previous quest
                        local prevQuest = quests[j]

                        if planet1 == prevQuest.planet then

                            SelectedQuests = prevQuest.name
                            SelectedMobs = prevQuest.nickname
                            sameplanet = true

                            return SelectedQuests, SelectedMobs, sameplanet -- exit the loop once the previous quest is found
                        else
                            sameplanet = false

                            SelectedQuests = quest.name
                            SelectedMobs = quest.nickname
                            return SelectedQuests, SelectedMobs, switch1, sameplanet
                        end
                    end

                elseif currentQuestIndex <= 1 then
                    SelectedQuests = quest.name
                    SelectedMobs = quest.nickname

                    return SelectedQuests, SelectedMobs, switch1
                end
                break -- exit the loop if a quest is found (could also remove this line if the loop should continue searching for quests)
            end

        end
    end

end
questneeded = false
-- Function
local attacks2 = {"Super Dragon Fist", "God Slicer", "Spirit Barrage", "Mach Kick", "Wolf Fang Fist", "High Power Rush",
                  "Meteor Strike", "Meteor Charge", "Spirit Breaking Cannon", "Vital Strike", "Flash Kick", "Meteor Charge", "Flash Kick"}

-- Function
local attacks = {"Spirit Breaking Cannon", "Vanish Strike", "Uppercut"
                }

local RebValue = ""

local rebirthOnJoin = game.ReplicatedStorage.Datas[game.Players.LocalPlayer.UserId].Rebirth.Value


task.spawn(function()
    while true and task.wait() do
        pcall(function()
            data = game.ReplicatedStorage.Datas[game.Players.LocalPlayer.UserId]
            while true and task.wait() do
                task.wait()
                RebValue = data.Rebirth.Value
                if rebirthOnJoin ~= RebValue then
                   

                    local A_1 = "Earth"
                    local Event = game:GetService("ReplicatedStorage").Package.Events.TP

                    Event:InvokeServer(A_1)

                    task.wait()
                end
            end
        end)
    end
end)

task.spawn(function()
    while true and task.wait() do
        pcall(function()
local args = {
                [1] = true
            }
            game:GetService("ReplicatedStorage").Package.Events.block:InvokeServer(unpack(args))
  game.Players.LocalPlayer.Status.Blocking.Value = true
      end)
    end
end)


questneeded = true
SelectedMobs1 = ""
getgenv().autostackloop = true
getgenv().stackneeded = true
-- main loop

while true do
    warn("in main loop")
    success1, err1 = pcall(function()
        task.wait()
        deadcheck(false)
        if getgenv().stackneeded == true then
            deadcheck(false)
            repeat
                task.wait()
                deadcheck(false)
            until getgenv().dead == false
            if getgenv().stackneeded == true then

                stack1 = true
                --autostack(stack1)
                repeat
                    success, err = pcall(function()
                        targetted = game.Players.LocalPlayer.name
                        data = game.ReplicatedStorage.Datas[game.Players.LocalPlayer.UserId]
                        if stack1 == true and data.Energy.Value > 8000000 and getgenv().dead == false then
                            task.wait(1)
                
                            game.workspace.Living[targetted].UpperTorso:Destroy()
                            task.wait(5)
                            local Remote = game.ReplicatedStorage.Package.Events['equipskill']
                            local Arguments = {
                                [1] = "Godly SSJ2"
                            }
                            Remote:InvokeServer(unpack(Arguments))
                            local Remote = game.ReplicatedStorage.Package.Events['ta']
                            i = 0
                            repeat
                                Remote:InvokeServer(unpack(Arguments))
                                i = i + 1
                                task.wait(.1)
                            until i == 3
                            task.wait()
                            getgenv().stackneeded = false
                            transformStatus = true
                            autoFarmLoopRunning = true
                            flying = false
                            
                        elseif stack1 == false then
                            getgenv().stackneeded = false
                            transformStatus = true
                            autoFarmLoopRunning = true
                            flying = false
                            
                        elseif stack1 == true and data.Energy.Value < 8000000 then
                            task.wait()
                            getgenv().stackneeded = false
                            transformStatus = true
                            autoFarmLoopRunning = true
                            flying = false
                            
                        end
                    end)
                    if success then
                        warn("(1)Stack loop Function executed successfully with a value of " .. tostring(getgenv().stackneeded))
                        -- Access the result returned by the function
                        getgenv().stackneeded = false
                    else
                        warn("Error occurred:", err)
                        
                    end
                    task.wait()
                until getgenv().stackneeded == false
                deadcheck(true)
                getgenv().stackneeded = false
                questneeded = true
                autoFarmLoopRunning = true
            end
            
        end
        autoFarmLoopRunning = true
        getgenv().stackneeded = false
    end)
    getgenv().stackneeded = false
    if success1 then
        warn("(2)Stack loop Function executed successfully with a value of " .. tostring(getgenv().stackneeded))
        -- Access the result returned by the function
        
    else
        warn("Error occurred:", err1)
        
    end

warn("line 1100 quest status = " .. tostring(questneeded))
warn("line 1100 enter loop status status = " .. tostring(autoFarmLoopRunning))
    checkstackreq = getCheckValue()
    if checkstackreq < 8000000 then
        autoFarmLoopRunning = true
    end

    if getgenv().rebirthed == true and game.placeId == 5151400895 then
        task.wait(10)
check1()
        return

    elseif getgenv().rebirthed == true and game.placeId ~= 5151400895 then
        task.wait(3)
check1()
    end

    pcall(function()

        game.Workspace.Living:WaitForChild(targetted)
        game.Workspace.Living[targetted]:WaitForChild("HumanoidRootPart")

    end)

    if charge == false and getgenv().dead == false and autoFarmLoopRunning == true then

        task.spawn(function()
            while autoFarmLoopRunning do
                pcall(function()
                local args = {
                    [1] = "Blacknwhite27"
                }

                game:GetService("ReplicatedStorage").Package.Events.cha:InvokeServer(unpack(args))
                task.wait()
            end)
            end
        end)
        task.spawn(function()
            while autoFarmLoopRunning do
                pcall(function()
                    data = game.ReplicatedStorage.Datas[game.Players.LocalPlayer.UserId]
                    local formtouse;

                    if transformStatus == true and game.Workspace.Living[targetted].Stats.Ki.Value > 300 and
                        game:GetService("ReplicatedStorage").Datas[game.Players.LocalPlayer.UserId].Quest.Value ~=
                        "X Fighter Trainer" then

                        local value = getCheckValue()
                        local alignment = data.Allignment.Value
                        local forms = FormsList[alignment]
                        local Paidforms = PaidFormsList[alignment]

                        local matchFound = false 
                        local paidmatchFound = false

                        for _, form in ipairs(Paidforms) do
                            if value >= form.reqvalue and value <= form.endrangevalue and form.reqvalue >=
                                data.Rebirth.Value and form.formOwned == true then

                                formtouse = form.name
                                paidmatchFound = true 
                                break 
                            end

                        end

                        if paidmatchFound == false and isLoop2Active then
                            for _, form in ipairs(forms) do
                                if value >= form.reqvalue and value <= form.endrangevalue and form.reqvalue >=
                                    data.Rebirth.Value then
                                    formtouse = form.name
                                    matchFound = true 

                                    break 
                                end
                            end
                        end

                        if not matchFound and not paidmatchFound and isLoop2Active then
                            for _, form in ipairs(forms) do
                                if form.rebirthReq >= data.Rebirth.Value then
                                    formtouse = form.name
                                    break
                                end
                            end

                        end
                        equipRemote = game:GetService("ReplicatedStorage").Package.Events.equipskill
                        equipRemote:InvokeServer(formtouse)
                        repeat
                            task.wait()
                            if game.Players.LocalPlayer.Status.SelectedTransformation.Value ~=
                                game.Players.LocalPlayer.Status.Transformation.Value then
                                game:GetService("ReplicatedStorage").Package.Events.ta:InvokeServer()
                            end
                        until game.Players.LocalPlayer.Status.SelectedTransformation.Value ==
                            game.Players.LocalPlayer.Status.Transformation.Value or
                            game.Workspace.Living[targetted].Stats.Ki.Value < 300
                    end

                end)
                task.wait(.5)
            end
        end)
        charge = true
    end

    if flying == false and getgenv().dead == false and autoFarmLoopRunning == true then
        success, err = pcall(function()

            game.Workspace.Living:WaitForChild(targetted)
            game.Workspace.Living[targetted]:WaitForChild("HumanoidRootPart")
            local bv = game.Workspace.Living[targetted].HumanoidRootPart:WaitForChild("BodyVelocity")
            local bg = game.Workspace.Living[targetted].HumanoidRootPart:WaitForChild("BodyGyro")
            

            bg.P = 1
            bg.MaxTorque = Vector3.new(500000, 500000, 500000)
            bv.P = 1
            bv.MaxForce = Vector3.new(100000, 100000, 100000)
            flying = true
        end)
        if success then
            warn("Fly Function executed successfully")
            -- Access the result returned by the function
            
        else
            warn("Error occurred:", err)
            
        end
    end

    if getgenv().dead == false and autoFarmLoopRunning == true then
       warn("entered if for auto farm loop")
        task.wait()

        
             success, err = pcall(function()
                while autoFarmLoopRunning do
                    task.wait()
                    check1()
                    local SelectedQuests, SelectedMobs, sameplanet;
                     success1, err1 = pcall(function()

                        while autoFarmLoopRunning do
                            if breakagain == true then
                                breakagain = false
                                break
                            end
                            if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                for i, v in ipairs(game:GetService("Workspace").Living:GetChildren()) do
                                    task.wait()
                                    local q;
                                    getgenv().switch1 = 1
                                    q = getgenv().switch1
                                    SelectedQuests, SelectedMobs, sameplanet = getQuest(q)

                                    if v.Name:lower() == SelectedMobs:lower() then

                                        local humanoid = v.Humanoid

                                        if humanoid then
                                            local currentState = humanoid:GetState()

                                            if currentState == Enum.HumanoidStateType.Dead then
                                                getgenv().switch1 = 2
                                                q = getgenv().switch1
                                                SelectedQuests, SelectedMobs, sameplanet = getQuest(q)

                                            end
                                        end
                                        break
                                    end
                                end
                            end

                            if string.len(game:GetService("ReplicatedStorage").Datas[game.Players.LocalPlayer.UserId]
                                              .Quest.Value) <= 0 or questneeded == true then
                                
                                SelectedMobs1 = SelectedMobs

                                checkValue = getCheckValue()
                                if checkValue >= 150000000 and game.placeId ~= 5151400895 then
                                    SelectedQuests, SelectedMobs1 = "SSJG Kakata", "SSJG Kakata"
                                    local A_1 = "Vills Planet"
                                    local Event = game:GetService("ReplicatedStorage").Package.Events.TP
                                    Event:InvokeServer(A_1)
                                end

                                if game:GetService("ReplicatedStorage").Datas[game.Players.LocalPlayer.UserId].Quest
                                    .Value ~= SelectedQuests and  isLoop1Active then 
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService(
                                                                                                     "Workspace").Others
                                                                                                     .NPCs[SelectedQuests]
                                                                                                     .HumanoidRootPart
                                                                                                     .CFrame
                                    repeat
                                        task.wait()

                                        game.ReplicatedStorage.Package.Events.Qaction:InvokeServer(game:GetService(
                                                                                                       "Workspace").Others
                                                                                                       .NPCs[SelectedQuests])
                                    until game:GetService("ReplicatedStorage").Datas[game.Players.LocalPlayer.UserId]
                                        .Quest.Value == SelectedQuests or
                                        game.Players.LocalPlayer.Character.Humanoid.Health <= 0
                                end -- undefine
                                
                            end

                            if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                for i, v in ipairs(game:GetService("Workspace").Living:GetChildren()) do
                                    task.wait()

                                    if v.Name:lower() == SelectedMobs1:lower() and isLoop4Active and game.Players.LocalPlayer.Character and
                                        game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
                                        v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 or v.Name:lower() == "ssjg kakata" and SelectedMobs1:lower() == "ssjg kakata" then
                                        task.wait()
                                        if v.Name:lower() == "ssjg kakata" then
                                            repeat
                                                pcall(function()
                                                    if v.Humanoid.Health > 0 then
                                                        ssjgalive = true
                                                    end
                                                    end)
                                            wait()
                                            until ssjgalive == true
end
                                        
                                        questneeded = false
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart
                                                                                                         .CFrame +
                                                                                                         Vector3.new(0,
                                                0, 0)
                                        

                                        local Echar = v
                                        task.spawn(function()
                                            repeat

                                                local myChar = game.Players.LocalPlayer.Character
                                                
                                                myChar.HumanoidRootPart.CFrame =
                                                    Echar:GetPrimaryPartCFrame() * CFrame.new(0, 0, 5)

                                                task.wait()
                                            until not autoFarmLoopRunning or v.Humanoid.Health <= 0 or
                                                game.Players.LocalPlayer.Character.Humanoid.Health <= 0
                                        end)

                                        task.wait(0.2)
                                        local alignment = data.Allignment.Value
                                        if alignment == "Evil" then
                                            puntype = "Soul Punisher"
                                        else
                                            puntype = "Destruction"

                                        end
                                        repeat
                                            task.wait()
                                            
                                            if checkValue > 2100000 and game.Workspace.Living[targetted].Stats.Ki.Value >
                                                10000 then -- op move stack 1

                                                repeat
                                                   
                                                   
                                                        task.wait()
                                                        A_2 = "Blacknwhite27"
                                                        local spam = 0
                                                        repeat
                                                            task.spawn(function()
                                                        
                                                               
                                                        
                                                        for _, A_1 in ipairs(attacks2) do
                                                                      if isLoop3Active then
                                                            task.spawn(function()                                            
                                                                task.wait()
                                                                game:GetService("ReplicatedStorage").Package.Events.mel:InvokeServer(
                                                                    A_1, A_2)
                                                            end) 
                                                            end
                                                            
                                                         
                                                        end
                                                        spam = spam + 1
                                                        wait(.1)
                                                    end) 
                                                    until spam == 10 or
                                                    game.Players.LocalPlayer.Character.Humanoid.Health <= 0
                                                    
                                                    
                                                    
                                                    

                                                    task.wait(0.3)
                                                until not autoFarmLoopRunning or v.Humanoid.Health <= 0 or
                                                    game.Players.LocalPlayer.Character.Humanoid.Health <= 0 or
                                                    game.Workspace.Living[targetted].Stats.Ki.Value < 10000
                                            else
                                                task.spawn(function()
                                                    repeat
                                                        game:GetService("ReplicatedStorage").Package.Events.p:FireServer(
                                                            "Blacknwhite27", 1)
                                                        task.wait()
                                                    until not autoFarmLoopRunning or v.Humanoid.Health <= 0 or
                                                        game.Players.LocalPlayer.Character.Humanoid.Health <= 0 or
                                                        game.Workspace.Living[targetted].Stats.Ki.Value > 10000 and
                                                        checkValue > 2100000

                                                end)

                                                repeat
                                                    if game.Workspace.Living[targetted].Stats.Ki.Value > 400 then

                                                        task.wait()
                                                        local Event =
                                                            game:GetService("ReplicatedStorage").Package.Events.mel
                                                        local A_2 = "Blacknwhite27"
                                                        task.spawn(function()
                                                            local A_1 = "Mach Kick"
                                                            Event:InvokeServer(A_1, A_2)

                                                        end)
                                                        task.spawn(function()
                                                            A_1 = "Energy Volley"
                                                            A_2 = {
                                                                ["FaceMouse"] = false,
                                                                ["MouseHit"] = CFrame.new(15932.0273, -12.8115005,
                                                                    15540.2061, 0.983303905, -0.0826973468, 0.162094966,
                                                                    0, 0.89077127, 0.454452157, -0.181971505,
                                                                    -0.446864575, 0.875898659)
                                                            }
                                                            A_3 = "Blacknwhite27"
                                                            Event =
                                                                game:GetService("ReplicatedStorage").Package.Events
                                                                    .voleys
                                                            Event:InvokeServer(A_1, A_2, A_3)

                                                        end)
                                                        task.wait(.3)
                                                    else

                                                        game:GetService("ReplicatedStorage").Package.Events.p:FireServer(
                                                            "Blacknwhite27", 1)

                                                        task.wait()

                                                    end
                                                    task.wait()
                                                until not autoFarmLoopRunning or v.Humanoid.Health <= 0 or
                                                    game.Players.LocalPlayer.Character.Humanoid.Health <= 0 or
                                                    game.Workspace.Living[targetted].Stats.Ki.Value > 10000 and
                                                    checkValue > 2100000

                                            end
                                            task.wait()
                                        until not autoFarmLoopRunning or v.Humanoid.Health <= 0 or
                                            game.Players.LocalPlayer.Character.Humanoid.Health <= 0
                                            
                                        if game.Players.LocalPlayer.Character.Humanoid.Health <= 0 then
                                            getgenv().stackneeded = true
                                            getgenv().dead = true
                                            autoFarmLoopRunning = false
                                            flying = false
                                            charge = false
                                            questneeded = true

                                        end
                                        breakagain = true
                                        break
                                    end

                                end
                            else
                                questneeded = true
                            end
                            task.wait()
                        end
                    end)
                    if success1 then
                        warn("Function executed successfully")
                       
                        
                    else
                        warn("Error occurred:", err1)
                        questneeded = true
                    end
                end
            
            end)
            if success then
                warn("Function executed successfully")
                
                
            else
                warn("Error occurred:", err)
                questneeded = true
            end
            task.wait()
        
        
    end
end


        end
        wait()
    end
end

local function loop2()
    while true do
        if isLoop2Active then        
        end
        wait()
    end
end

local function loop3()
    while true do
        if isLoop3Active then
        end
        wait()
    end
end

local function loop4()
local function formatNumber(number)
    local suffixes = {"", "K", "M", "B", "T", "QD"}
    local suffix_index = 1

    while math.abs(number) >= 1000 and suffix_index < #suffixes do
        number = number / 1000.0
        suffix_index = suffix_index + 1
    end

    return string.format("%.2f%s", number, suffixes[suffix_index])
end

local function updateNumbers()
    local player = game.Players.LocalPlayer
    local rebirthFrame = player.PlayerGui.Main.MainFrame.Frames.Rebirth
    local statsFrame = player.PlayerGui.Main.MainFrame.Frames.Stats
    local strengthLabel = statsFrame:FindFirstChild("Strength")

    local strengthValue
    if strengthLabel and strengthLabel:IsA("TextLabel") then
        local strengthText = strengthLabel.Text:match("%d+")
        strengthValue = tonumber(strengthText)
    end

    local menuGui = game.CoreGui.MenuGui

    -- Limpiar todos los clones existentes antes de actualizar
    for _, child in ipairs(menuGui.Background:GetChildren()) do
        child:Destroy()
    end

    local yOffset = -50
    local xOffset = 50

    for _, child in ipairs(rebirthFrame:GetChildren()) do
        if child:IsA("TextLabel") then
            local text = child.Text:match("%d+")
            if text then
                local number = tonumber(text)
                if number and strengthValue then
                    local formattedNumber = formatNumber(number)
                    local formattedStrength = formatNumber(strengthValue)
                    local combinedText = formattedNumber .. "/" .. formattedStrength
                    local clonedLabel = Instance.new("TextButton", menuGui.Background)
                   clonedLabel.Name = "Cloned" .. child.Name
                    clonedLabel.Text = combinedText
                   clonedLabel.Font = child.Font
                   clonedLabel.TextSize = 30
                   clonedLabel.TextColor3 = Color3.fromRGB(0, 0, 0)  -- Color del texto
                   clonedLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)  -- Color de fondo
                   clonedLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 255)  -- Color del contorno del texto
                   clonedLabel.TextStrokeTransparency = 0.000  -- Transparencia del contorno del texto
                   clonedLabel.BackgroundTransparency = 1
                   clonedLabel.Position = UDim2.new(0, xOffset, 0, yOffset)
                   clonedLabel.Size = UDim2.new(0, 200, 0, 30)
                   yOffset = yOffset + 40
                    
                end
            end
        end
    end
end

local function onCharacterAdded(character)
    -- Conectar eventos de cambio relevantes para actualizar dinÃ¡micamente
    character:WaitForChild("Humanoid").Died:Connect(function()
        updateNumbers()  -- Actualizar nÃºmeros cuando el jugador muere
    end)

    -- Ejemplo de escucha de cambio en una propiedad especÃ­fica
    local statsFrame = character:WaitForChild("PlayerGui"):WaitForChild("Main"):WaitForChild("MainFrame"):WaitForChild("Frames"):WaitForChild("Stats")
    local strengthLabel = statsFrame:FindFirstChild("Strength")
    if strengthLabel then
        strengthLabel:GetPropertyChangedSignal("Text"):Connect(function()
            updateNumbers()  -- Actualizar nÃºmeros cuando cambia la fuerza
        end)
    end
end

local function initialize()
    local player = game.Players.LocalPlayer
    local menuGui = Instance.new("ScreenGui")
    menuGui.Name = "MenuGui"

    local backgroundFrame = Instance.new("Frame")
    backgroundFrame.Name = "Background"
    backgroundFrame.Size = UDim2.new(0, 220, 0, 0)
    backgroundFrame.Position = UDim2.new(0, 30, 0, 20)
    backgroundFrame.BackgroundTransparency = 0.5
    backgroundFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    backgroundFrame.BorderSizePixel = 0
    backgroundFrame.Parent = menuGui

    menuGui.Parent = game.CoreGui

    -- Escuchar eventos de cambio de personaje
    player.CharacterAdded:Connect(function(character)
        onCharacterAdded(character)
        updateNumbers()  -- Llamar a updateNumbers inicialmente para configurar la interfaz por primera vez
    end)

    player.CharacterRemoving:Connect(function()
        updateNumbers()  -- Limpiar la interfaz al remover el personaje
    end)

    -- Llamar a updateNumbers regularmente para mantener actualizada la interfaz
    game:GetService("RunService").Heartbeat:Connect(function()
        updateNumbers()
    end)
end

initialize()
        wait() 
end

local function loop5()
    while true do
        if isLoop5Active then
function rebirth()
	game:GetService("ReplicatedStorage"):WaitForChild("Package"):WaitForChild("Events"):WaitForChild("reb"):InvokeServer()
end
rebirth() 
        end
    wait()
    end
end

local function loop6()
    while true do
        if isLoop6Active then
local executed = false
while not executed do
    game:GetService("Workspace").Others.BossMaps:Destroy()
    game:GetService("Workspace").Others.Map:Destroy()
    executed = true
end
        end
        wait() 
    end
end


local function loop7()
    while true do
        if isLoop7Active then
            spawn(function()
                local success, err = pcall(function()
                    local replicatedStorage = game:GetService("ReplicatedStorage")
                    local events = replicatedStorage.Package.Events
                    local target = "Blacknwhite27"

                    -- Llamadas agrupadas para reducir overhead
                    pcall(function()
                    
                        events.cha:InvokeServer(target)
                        events.voleys:InvokeServer("Energy Volley", { FaceMouse = false, MouseHit = CFrame.new() }, target)
                        events.mel:InvokeServer("High Power Rush", target)
                        events.cha:InvokeServer(target)
                        events.mel:InvokeServer("Mach Kick", target)
                        events.mel:InvokeServer("Wolf Fang Fist", target)
                        events.mel:InvokeServer("Super Dragon Fist", target)
                        events.mel:InvokeServer("Spirit Barrage", target)
                        events.mel:InvokeServer("God Slicer", target)
                        events.mel:InvokeServer("Flash Kick", target)
                        events.mel:InvokeServer("Spirit Breaking Cannon", target)
                        events.mel:InvokeServer("Meteor Strike", target)
                        events.mel:InvokeServer("Vanish Strike", target)
                        events.mel:InvokeServer("Bone Charge", target)
                        events.mel:InvokeServer("Uppercut", target)
                        events.mel:InvokeServer("Sledgehammer", target)
                        events.mel:InvokeServer("Vital Strike", target)
                        events.cha:InvokeServer(target)
                        local args = {
                [1] = true
            }
            game:GetService("ReplicatedStorage").Package.Events.block:InvokeServer(unpack(args))
  game.Players.LocalPlayer.Status.Blocking.Value = true
                        events.p:FireServer(target, 1)
                    end)

                    -- Espera antes de la siguiente iteraciÃ³n para reducir carga
                    task.wait(0.2)
                end)

                -- Manejo de errores
                if not success then
                    warn("Error en loop7:", err)
                end
            end)
        end
        task.wait(0.2) -- Aumentar la espera entre iteraciones principales para reducir la frecuencia de ejecuciÃ³n
    end
end

-- Bucle para manejo de muerte y otros eventos
spawn(function()
    while true do
        pcall(function()
            spawn(function()
                repeat
                    local success1, err1 = pcall(function()
                        task.wait(0.1) -- Aumentar la espera para verificar menos frecuentemente
                        deadcheck(false)
                    end)
                until not success1 or err1

                -- Manejo de errores
                if not success1 then
                    warn("Error en el manejo de muerte:", err1)
                end

                task.wait(0.2) -- Aumentar la espera entre iteraciones para reducir la carga
            end)
        end)
        task.wait(0.1) -- Aumentar la espera entre iteraciones principales para reducir la frecuencia de ejecuciÃ³n
    end
end)

-- Bucle para manejo de spam
spawn(function()
    while true do
        local spam = 0
        repeat
            local success, err = pcall(function()
                spam = spam + 1
                task.wait(0.5) -- Aumentar la espera entre iteraciones para reducir la frecuencia del spam
            end)
        until spam == 12 or not success

        -- Manejo de errores
        if not success then
            warn("Error en el spam:", err)
        end

        task.wait(2) -- Aumentar la espera entre iteraciones principales para reducir la frecuencia de ejecuciÃ³n
    end
end)



switchButton1.MouseButton1Click:Connect(function()
    isLoop1Active = not isLoop1Active
    toggleSwitch(isLoop1Active, switchBall1)
    SaveSwitchState(isLoop1Active, "Switch1")
end)

switchButton2.MouseButton1Click:Connect(function()
    isLoop2Active = not isLoop2Active
    toggleSwitch(isLoop2Active, switchBall2)
    SaveSwitchState(isLoop2Active, "Switch2")
end)

switchButton3.MouseButton1Click:Connect(function()
    isLoop3Active = not isLoop3Active
    toggleSwitch(isLoop3Active, switchBall3)
    SaveSwitchState(isLoop3Active, "Switch3")
end)

switchButton4.MouseButton1Click:Connect(function()
    isLoop4Active = not isLoop4Active
    toggleSwitch(isLoop4Active, switchBall4)
    SaveSwitchState(isLoop4Active, "Switch4")
end)

switchButton5.MouseButton1Click:Connect(function()
    isLoop5Active = not isLoop5Active
    toggleSwitch(isLoop5Active, switchBall5)
    SaveSwitchState(isLoop5Active, "Switch5")
end)

switchButton6.MouseButton1Click:Connect(function()
    isLoop6Active = not isLoop6Active
    toggleSwitch(isLoop6Active, switchBall6)
    SaveSwitchState(isLoop6Active, "Switch6")
end)

switchButton7.MouseButton1Click:Connect(function()
    isLoop7Active = not isLoop7Active
    toggleSwitch(isLoop7Active, switchBall7)
    SaveSwitchState(isLoop7Active, "Switch7")
end)

toggleSwitch(isLoop1Active, switchBall1)
toggleSwitch(isLoop2Active, switchBall2)
toggleSwitch(isLoop3Active, switchBall3)
toggleSwitch(isLoop4Active, switchBall4)
toggleSwitch(isLoop5Active, switchBall5)
toggleSwitch(isLoop6Active, switchBall6)
toggleSwitch(isLoop7Active, switchBall7)

coroutine.wrap(loop1)()
coroutine.wrap(loop2)()
coroutine.wrap(loop3)()
coroutine.wrap(loop4)()
coroutine.wrap(loop5)()
coroutine.wrap(loop6)()
coroutine.wrap(loop7)()
end

initSwitches(MenuPanel)
            MainButton.MouseButton1Click:Connect(togglePanel)
earthButton.MouseButton1Click:Connect(function()
  game.ReplicatedStorage.Package.Events.TP:InvokeServer("Vills Planet")
end)

billsButton.MouseButton1Click:Connect(function()
game.ReplicatedStorage.Package.Events.TP:InvokeServer("Earth")
end)

farmButton.MouseButton1Click:Connect(onFarmButtonClick)
formsButton.MouseButton1Click:Connect(onFormsButtonClick)

showPlayerThumbnail()
        
        
         
