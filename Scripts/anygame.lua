local Script = {
    Feather = nil,
    Categories = {
        Combat,
        Blatant,
        Render,
        World,
        Utility
    }
}

local Category = Script.Categories

do

    --[[ Variables --]]

    local Entity = loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/Libraries/entityHandler.lua"))() -- Mabye download the file and put it in the /Feather/ folder.
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local Character = Entity.character
    local Humanoid = Character.Humanoid
    local espLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Sirius/request/library/esp/esp.lua'), true))()
    local TPService = game:GetService("TeleportService")

    --[[ Functions --]]

    local function hasValue(Array, Value)
        for i, v in ipairs(Array) do
            if v == Value then
                return true
            end
        end
    
        return false
    end
    
    local RenderStepTable = {}
    local StepTable = {}
    
    local function BindToRenderStep(name, num, func)
        if RenderStepTable[name] == nil then
            RenderStepTable[name] = game:GetService("RunService").RenderStepped:Connect(func)
        end
    end
    local function UnbindFromRenderStep(name)
        if RenderStepTable[name] then
            RenderStepTable[name]:Disconnect()
            RenderStepTable[name] = nil
        end
    end
    
    local function BindToStepped(name, num, func)
        if StepTable[name] == nil then
            StepTable[name] = game:GetService("RunService").Stepped:Connect(func)
        end
    end
    local function UnbindFromStepped(name)
        if StepTable[name] then
            StepTable[name]:Disconnect()
            StepTable[name] = nil
        end
    end
    
    
    local function Notify(Contents)
        Script.Feather:MakeNotification({
            Name = "Feather",
            Content = Contents,
            Image = "rbxassetid://9677399831",
            Time = 5
        })
    end

    --[[ Modules --]]

    --[[ Combat --]]

    --[[ Blatant --]]

    Category.Blatant:AddSlider({
        Name = "Speed",
        Min = 16,
        Max = 256,
        Default = 16,
        Color = Color3.fromRGB(65, 114, 146),
        Increment = 1,
        ValueName = "Speed",
        Flag = "Walkspeed",
        Save = true,
        Callback = function(Value)
            Humanoid.WalkSpeed = Value
        end
    })

    Category.Blatant:AddSlider({
        Name = "Jump",
        Min = 50,
        Max = 500,
        Default = 50,
        Color = Color3.fromRGB(1, 127, 96),
        Increment = 1,
        ValueName = "Power",
        Flag = "Jumppower",
        Save = true,
        Callback = function(Value)
            Humanoid.JumpPower = Value
        end
    }) 

    Category.Blatant:AddSlider({
        Name = "Flight",
        Min = 0,
        Max = 6,
        Default =  0,
        Color = Color3.fromRGB(130, 14, 16),
        Increment = 1,
        ValueName = "Speed",
        Flag = "FlightSpeed",
        Save = true,
        Callback = function(Value)
            Humanoid.JumpPower = Value
        end
    })

    Category.Blatant:AddTextbox({
        Name = "Teleport to Player",
        Callback = function(Value)
        Value = Value:lower()
            for i,v in pairs(Players:GetChildren()) do
                if string.find(v.Name:lower(), Value) then
                    Player.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
                else
                    if string.find(v.DisplayName:lower(), Value) then
                        Player.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
                    end
                end
            end
        end
    })

    --[[ Render --]]

    Category.Render:AddLabel("ESP")
    Category.Render:AddToggle({
        Name = "ESP",
        Default = false,
        Flag = "ESPToggle",
        Save = true,
        Callback = function(Value)
            if Value then
                espLib.Init()
            else
                espLib.Unload()
            end
        end
    })

    --[[ World --]]

    Category.World:AddLabel("FPS Booster")
    local FPSLevel = Category.World:AddDropdown({
        Name = "Levels",
        Default = "Level 1",
        Options = {"Level 1", "Level 2", "Level 3"},
        Flag = "FPSLevel",
        Save = true
    })
    Category.World:AddButton({
        Name = "Boost",
        Callback = function()
            Notify("This feature is currently irreversible, please rejoin to reset.")
            if FPSLevel.Value == "Level 1" then
                for _,v in pairs(workspace:GetDescendants()) do
                    if v.ClassName == "Part" or v.ClassName == "SpawnLocation" or v.ClassName == "WedgePart" or v.ClassName == "Terrain" or v.ClassName == "MeshPart" then
                        v.Material = "Plastic"
                    end
                end
            elseif FPSLevel.Value == "Level 2" then
                for _,v in pairs(workspace:GetDescendants()) do
                    if v.ClassName == "Part" or v.ClassName == "SpawnLocation" or v.ClassName == "WedgePart" or v.ClassName == "Terrain" or v.ClassName == "MeshPart" then
                        v.Material = "Plastic"
                    end
                end
                for _,v in pairs(workspace:GetDescendants()) do
                end
            elseif FPSLevel.Value == "Level 3" then
                for _,v in pairs(workspace:GetDescendants()) do
                    if v.ClassName == "Part" or v.ClassName == "SpawnLocation" or v.ClassName == "WedgePart" or v.ClassName == "Terrain" or v.ClassName == "MeshPart" then
                        v.BrickColor = BrickColor.new(155, 155, 155)
                        v.Material = "Plastic"
                    end
                end
            else
                Notify("Something incredibly wrong has happened.")
            end
        end
    })

    --[[ Utility --]]

    Category.Utility:AddButton({
        Name = "Reset Character",
        Callback = function()
            Player.Character.Humanoid.Health = 0
        end
    })

    Category.Utility:AddButton({
        Name = "Serverhop",
        Callback = function()
            Notify("Sending you to a new game.")
            TPService:Teleport(game.PlaceId, Player)
        end
    })

end