     local Window = MakeWindow({
         Hub = {
         Title = "Ohboirblx",
         Animation = "Youtube: TBoy Roblox"
         },
        Key = {
        KeySystem = false,
        Title = "Key System",
        Description = "",
        KeyLink = "",
        Keys = {"1234"},
        Notifi = {
        Notifications = true,
        CorrectKey = "Running the Script...",
       Incorrectkey = "The key is incorrect",
       CopyKeyLink = "Copied to Clipboard"
      }
    }
  })

       MinimizeButton({
       Image = "https://create.roblox.com/store/asset/9242918232/gojo-satoru",
       Size = {60, 60},
       Color = Color3.fromRGB(10, 10, 10),
       Corner = true,
       Stroke = false,
       StrokeColor = Color3.fromRGB(255, 0, 0)
      })
      
------ Tab
     local Tab1o = MakeTab({Name = "visual"})
     local Tab2o = MakeTab({Name = "player"})
     
------- BUTTON
    
    AddButton(Tab1o, {
    Name = "ESP Player",
    Callback = function()
        -- ESP PLAYER SCRIPT
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        local LocalPlayer = Players.LocalPlayer
        local Camera = workspace.CurrentCamera
        
        -- Check if ESP is already enabled, then toggle off
        if _G.ESPEnabled then
            -- Disable ESP
            for _, obj in pairs(_G.ESPObjects or {}) do
                pcall(function()
                    if obj.Highlight then obj.Highlight:Destroy() end
                    if obj.Billboard then obj.Billboard:Destroy() end
                end)
            end
            _G.ESPObjects = {}
            _G.ESPEnabled = false
            print("ESP Disabled")
            return
        end
        
        _G.ESPEnabled = true
        _G.ESPObjects = {}
        
        -- Function to create ESP for a player
        local function createESP(player)
            if player == LocalPlayer then return end
            
            local character = player.Character
            if not character then
                player.CharacterAdded:Connect(function(newChar)
                    task.wait(0.5)
                    createESP(player)
                end)
                return
            end
            
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            if not humanoidRootPart then return end
            
            -- Create Highlight (glowing outline)
            local highlight = Instance.new("Highlight")
            highlight.FillColor = Color3.fromRGB(255, 50, 50)
            highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
            highlight.FillTransparency = 0.3
            highlight.OutlineTransparency = 0.5
            highlight.Parent = character
            
            -- Create Billboard (name + distance display)
            local billboard = Instance.new("BillboardGui")
            billboard.Size = UDim2.new(0, 200, 0, 50)
           
    AddButton(Tab2o, {
    Name = "Player",
    Callback = function()
        -- PLAYER FUNCTIONS: Speed, Jump, Fly, Unban
        local Players = game:GetService("Players")
        local UserInputService = game:GetService("UserInputService")
        local RunService = game:GetService("RunService")
        local LocalPlayer = Players.LocalPlayer
        local Camera = workspace.CurrentCamera
        
        -- Toggle states
        if _G.PlayerMenuOpen == nil then
            _G.PlayerMenuOpen = false
        end
        
        -- Close existing GUI if open
        if _G.PlayerMenuOpen and _G.PlayerGUI then
            _G.PlayerGUI:Destroy()
            _G.PlayerMenuOpen = false
            print("Player Menu Closed")
            return
        end
        
        -- Create main GUI
        local screenGui = Instance.new("ScreenGui")
        screenGui.Name = "PlayerMenuGUI"
        screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
        _G.PlayerGUI = screenGui
        
        -- Main frame
        local mainFrame = Instance.new("Frame")
        mainFrame.Size = UDim2.new(0, 300, 0, 400)
        mainFrame.Position = UDim2.new(0.5, -150, 0.5, -200)
        mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        mainFrame.BackgroundTransparency = 0.2
        mainFrame.BorderSizePixel = 2
        mainFrame.BorderColor3 = Color3.fromRGB(0, 150, 255)
        mainFrame.Active = true
        mainFrame.Draggable = true
        mainFrame.Parent = screenGui
        
        -- Title
        local title = Instance.new("TextLabel")
        title.Size = UDim2.new(1, 0, 0, 40)
        title.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
        title.Text = "⚡ Player Controls ⚡"
        title.TextColor3 = Color3.fromRGB(255, 255, 255)
        title.Font = Enum.Font.SourceSansBold
        title.TextSize = 20
        title.Parent = mainFrame
        
        -- Close button
        local closeBtn = Instance.new("TextButton")
        closeBtn.Size = UDim2.new(0, 30, 0, 30)
        closeBtn.Position = UDim2.new(1, -35, 0, 5)
        closeBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
        closeBtn.Text = "X"
        closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        closeBtn.Font = Enum.Font.SourceSansBold
        closeBtn.TextSize = 18
        closeBtn.Parent = mainFrame
        closeBtn.MouseButton1Click:Connect(function()
            screenGui:Destroy()
            _G.PlayerMenuOpen = false
            if _G.FlyConnection then
                _G.FlyConnection:Disconnect()
                _G.FlyConnection = nil
            end
            _G.FlyEnabled = false
        end)
        
        -- Speed slider
        local speedLabel = Instance.new("TextLabel")
        speedLabel.Size = UDim2.new(1, 0, 0, 25)
        speedLabel.Position = UDim2.new(0, 0, 0, 50)
        speedLabel.BackgroundTransparency = 1
        speedLabel.Text = "Speed: 16"
        speedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        speedLabel.Font = Enum.Font.SourceSans
        speedLabel.TextSize = 16
        speedLabel.Parent = mainFrame
        
        local speedSlider = Instance.new("TextBox")
        speedSlider.Size = UDim2.new(0.8, 0, 0, 30)
        speedSlider.Position = UDim2.new(0.1, 0, 0, 75)
        speedSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        speedSlider.Text = "16"
        speedSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
        speedSlider.Font = Enum.Font.SourceSans
        speedSlider.TextSize = 16
        speedSlider.PlaceholderText = "Enter speed (1-500)"
        speedSlider.Parent = mainFrame
        
        local speedApply = Instance.new("TextButton")
        speedApply.Size = UDim2.new(0.8, 0, 0, 25)
        speedApply.Position = UDim2.new(0.1, 0, 0, 110)
        speedApply.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
        speedApply.Text = "Apply Speed"
        speedApply.TextColor3 = Color3.fromRGB(255, 255, 255)
        speedApply.Font = Enum.Font.SourceSansBold
        speedApply.TextSize = 16
        speedApply.Parent = mainFrame
        speedApply.MouseButton1Click:Connect(function()
            local speed = tonumber(speedSlider.Text)
            if speed and speed > 0 then
                LocalPlayer.Character.Humanoid.WalkSpeed = speed
                speedLabel.Text = "Speed: " .. speed
                print("Speed set to: " .. speed)
            else
                print("Invalid speed value")
            end
        end)
        
        -- Jump height slider
        local jumpLabel = Instance.new("TextLabel")
        jumpLabel.Size = UDim2.new(1, 0, 0, 25)
        jumpLabel.Position = UDim2.new(0, 0, 0, 145)
        jumpLabel.BackgroundTransparency = 1
        jumpLabel.Text = "Jump Height: 50"
        jumpLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        jumpLabel.Font = Enum.Font.SourceSans
        jumpLabel.TextSize = 16
        jumpLabel.Parent = mainFrame
        
        local jumpSlider = Instance.new("TextBox")
        jumpSlider.Size = UDim2.new(0.8, 0, 0, 30)
        jumpSlider.Position = UDim2.new(0.1, 0, 0, 170)
        jumpSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        jumpSlider.Text = "50"
        jumpSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
        jumpSlider.Font = Enum.Font.SourceSans
        jumpSlider.TextSize = 16
        jumpSlider.PlaceholderText = "Enter jump power (1-500)"
        jumpSlider.Parent = mainFrame
        
        local jumpApply = Instance.new("TextButton")
        jumpApply.Size = UDim2.new(0.8, 0, 0, 25)
        jumpApply.Position = UDim2.new(0.1, 0, 0, 205)
        jumpApply.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
        jumpApply.Text = "Apply Jump Height"
        jumpApply.TextColor3 = Color3.fromRGB(255, 255, 255)
        jumpApply.Font = Enum.Font.SourceSansBold
        jumpApply.TextSize = 16
        jumpApply.Parent = mainFrame
        jumpApply.MouseButton1Click:Connect(function()
            local jumpPower = tonumber(jumpSlider.Text)
            if jumpPower and jumpPower > 0 then
                LocalPlayer.Character.Humanoid.JumpPower = jumpPower
                jumpLabel.Text = "Jump Height: " .. jumpPower
                print("Jump power set to: " .. jumpPower)
            else
                print("Invalid jump power value")
            end
        end)
        
        -- Fly toggle
        local flyLabel = Instance.new("TextLabel")
        flyLabel.Size = UDim2.new(1, 0, 0, 25)
        flyLabel.Position = UDim2.new(0, 0, 0, 240)
        flyLabel.BackgroundTransparency = 1
        flyLabel.Text = "Fly: OFF"
        flyLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
        flyLabel.Font = Enum.Font.SourceSans
        flyLabel.TextSize = 16
        flyLabel.Parent = mainFrame
        
        local flyToggle = Instance.new("TextButton")
        flyToggle.Size = UDim2.new(0.8, 0, 0, 30)
        flyToggle.Position = UDim2.new(0.1, 0, 0, 265)
        flyToggle.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
        flyToggle.Text = "Toggle Fly"
        flyToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
        flyToggle.Font = Enum.Font.SourceSansBold
        flyToggle.TextSize = 16
        flyToggle.Parent = mainFrame
        flyToggle.MouseButton1Click:Connect(function()
            _G.FlyEnabled = not _G.FlyEnabled
            
            if _G.FlyEnabled then
                flyLabel.Text = "Fly: ON"
                flyLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
                flyToggle.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
                
                local char = LocalPlayer.Character
                if char then
                    local hum = char:FindFirstChild("Humanoid")
                    local root = char:FindFirstChild("HumanoidRootPart")
                    if hum and root then
                        hum.PlatformStand = true
                        
                        _G.FlyConnection = RunService.RenderStepped:Connect(function()
                            if not _G.FlyEnabled or not root then
                                _G.FlyConnection:Disconnect()
                                _G.FlyConnection = nil
                                return
                            end
                            
                            local moveDirection = Vector3.new()
                            local speed = tonumber(speedSlider.Text) or 50
                            
                            if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                                moveDirection = moveDirection + Camera.CFrame.LookVector
                            end
                            if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                                moveDirection = moveDirection - Camera.CFrame.LookVector
                            end
                            if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                                moveDirection = moveDirection - Camera.CFrame.RightVector
                            end
                            if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                                moveDirection = moveDirection + Camera.CFrame.RightVector
                            end
                            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                                moveDirection = moveDirection + Vector3.new(0, 1, 0)
                            end
                            if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
                                moveDirection = moveDirection - Vector3.new(0, 1, 0)
                            end
                            
                            if moveDirection.Magnitude > 0 then
                                moveDirection = moveDirection.Unit * speed
                                root.Velocity = moveDirection
                            else
                                root.Velocity = Vector3.new(0, 0, 0)
                            end
                        end)
                    end
                end
            else
                flyLabel.Text = "Fly: OFF"
                flyLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
                flyToggle.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
                
                if _G.FlyConnection then
                    _G.FlyConnection:Disconnect()
                    _G.FlyConnection = nil
                end
                
                local char = LocalPlayer.Character
                if char then
                    local hum = char:FindFirstChild("Humanoid")
                    if hum then
                        hum.PlatformStand = false
                    end
                end
            end
        end)
        
        -- Unban button (Note: Unban only works in games where you have admin permissions)
        local unbanLabel = Instance.new("TextLabel")
        unbanLabel.Size = UDim2.new(1, 0, 0, 25)
        unbanLabel.Position = UDim2.new(0, 0, 0, 305)
        unbanLabel.BackgroundTransparency = 1
        unbanLabel.Text = "Unban Player"
        unbanLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        unbanLabel.Font = Enum.Font.SourceSans
        unbanLabel.TextSize = 16
        unbanLabel.Parent = mainFrame
        
        local unbanInput = Instance.new("TextBox")
        unbanInput.Size = UDim2.new(0.8, 0, 0, 30)
        unbanInput.Position = UDim2.new(0.1, 0, 0, 330)
        unbanInput.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        unbanInput.Text = ""
        unbanInput.TextColor3 = Color3.fromRGB(255, 255, 255)
        unbanInput.Font = Enum.Font.SourceSans
        unbanInput.TextSize = 16
        unbanInput.PlaceholderText = "Enter Player ID or Name"
        unbanInput.Parent = mainFrame
        
        local unbanBtn = Instance.new("TextButton")
        unbanBtn.Size = UDim2.new(0.8, 0, 0, 25)
        unbanBtn.Position = UDim2.new(0.1, 0, 0, 365)
        unbanBtn.BackgroundColor3 = Color3.fromRGB(200, 100, 0)
        unbanBtn.Text = "Unban Player"
        unbanBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        unbanBtn.Font = Enum.Font.SourceSansBold
        unbanBtn.TextSize = 16
        unbanBtn.Parent = mainFrame
        unbanBtn.MouseButton1Click:Connect(function()
            local target = unbanInput.Text
            if target and target ~= "" then
                -- Try to find player
                local player = Players:FindFirstChild(target)
                if not player then
                    -- Try to find by partial name
                    for _, p in pairs(Players:GetPlayers()) do
                        if p.Name:lower():find(target:lower()) then
                            player = p
                            break
                        end
                    end
                end
                
                if player then
                    -- Attempt to unban (works only if you have admin)
                    local success, err = pcall(function()
                        -- Method 1: Load character again
                        player:LoadCharacter()
                        
                        -- Method 2: Teleport to spawn (if available)
                        local spawns = workspace:FindFirstChild("SpawnLocation")
                        if spawns then
                            player.Character.HumanoidRootPart.CFrame = spawns.CFrame
                        end
                        
                        -- Method 3: Reset player state
                        local hum = player.Character and player.Character:FindFirstChild("Humanoid")
                        if hum then
                            hum.Health = hum.MaxHealth
                        end
                    end)
                    
                    if success then
                        print("Unbanned player: " .. player.Name)
                    else
                        print("Failed to unban: " .. err)
                    end
                else
                    print("Player not found: " .. target)
                end
            end
        end)
        
        _G.PlayerMenuOpen = true
        print("Player Menu Opened")
    end
})   