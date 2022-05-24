wait(game:IsLoaded())

--[ Preload ]--

local getasset = getsynasset or getcustomasset or function(location) return "rbxasset://"..location end
local queueteleport = syn and syn.queue_on_teleport or queue_on_teleport or fluxus and fluxus.queue_on_teleport or function() end
local requestfunc = syn and syn.request or http and http.request or http_request or fluxus and fluxus.request or request or function(tab)
	if tab.Method == "GET" then
		return {
			Body = game:HttpGet(tab.Url, true),
			Headers = {},
			StatusCode = 200
		}
	else
		return {
			Body = "bad exploit",
			Headers = {},
			StatusCode = 404
		}
	end
end

--[ Preload Checks ]--

if not (getasset and requestfunc and queueteleport) then
	print("[Feather] Missing dependency(s).")
	return
end

--[ Rejoin Checks ]--

queueteleport [[
    repeat wait() until game:IsLoaded() wait(5)
    print("[Feather] Reexecuting script...")
    print("[Feather] Loadstring not found.")
]]

--[ Variables ]--

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local LocalPlayer = Player
local Humanoid = Player.Character.Humanoid
local Character = Player.Character
local Entity = loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/Libraries/entityHandler.lua"))() -- Mabye download the file and put it in the /Feather/ folder.
local espLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Sirius/request/library/esp/esp.lua'),true))()
local TPService = game:GetService("TeleportService")

--[ Setup ]--

wait()

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({
    Name = "Feather", 
    HidePremium = false,
    SaveConfig = true, 
    ConfigFolder = "Feather/Profiles"
})

--[ Private Access ]--

local hasPrivate_IDs = {
    3555144226,
}

local hasPrivate_Names = {
    "comet2_exe",
}

--[ Functions ]--

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
    OrionLib:MakeNotification({
        Name = "Feather",
        Content = Contents,
        Image = "rbxassetid://9677399831",
        Time = 5
    })
end

--[ Categories ]--

local Combat = Window:MakeTab({
    Name = "Combat",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local Blatant = Window:MakeTab({
    Name = "Blatant",
    Icon = "rbxassetid://9678803501",
    PremiumOnly = false
})

local Render = Window:MakeTab({
    Name = "Render",
    Icon = "rbxassetid://9678804235",
    PremiumOnly = false
})

local World = Window:MakeTab({
    Name = "World",
    Icon = "rbxassetid://9678804882",
    PremiumOnly = false
})

local Utility = Window:MakeTab({
    Name = "Utility",
    Icon = "rbxassetid://9678805436",
    PremiumOnly = false
})


--[ Modules ]--

---[ Private ≈ Beta ]---

if hasValue(hasPrivate_IDs, LocalPlayer.UserId) and hasValue(hasPrivate_Names, LocalPlayer.Name) then

    local Private = Window:MakeTab({
        Name = "Private",
        Icon = "rbxassetid://9677399831",
        PremiumOnly = false
    })

end

---[ Combat ]--

---[ Blatant ]--

Blatant:AddSlider({
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

Blatant:AddSlider({
    Name = "Jump",
    Min = 50,
    Max = 500,
    Default = 50,
    Color = Color3.fromRGB(1, 127, 96),
	Increment = 1,
	ValueName = "Jump",
    Flag = "Jumppower",
    Save = true,
    Callback = function(Value)
        Humanoid.JumpPower = Value
    end
})

Blatant:AddTextbox({
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

---[ Render ]-- 

Render:AddLabel("ESP")
Render:AddToggle({
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

---[ World ]--

World:AddLabel("FPS Booster")
local FPSLevel = World:AddDropdown({
    Name = "Levels",
    Default = "Level 1",
    Options = {"Level 1", "Level 2", "Level 3"},
    Flag = "FPSLevel",
    Save = true
})
World:AddButton({
    Name = "Boost",
    Flag = "FPSBoost",
    Save = true,
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

---[ Utility ]--

Utility:AddButton({
    Name = "Reset Character",
    Callback = function()
        Player.Character.Humanoid.Health = 0
    end
})

Utility:AddButton({
    Name = "Serverhop",
    Callback = function()
        Notify("Sending you to a new game.")
        TPService:Teleport(game.PlaceId, Player)
    end
})

--[ Notification ]--

OrionLib:MakeNotification({
    Name = "Feather",
    Content = "Press Right-Shift to open the Feather Window.",
    Image = "rbxassetid://9677399831",
    Time = 5
})

--[ Init ]--

OrionLib:Init()
