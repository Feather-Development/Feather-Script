wait(game:IsLoaded())

--[[ Preload ]]--

local betterisfile = function(file)
	local suc, res = pcall(function() return readfile(file) end)
	return suc and res ~= nil
end
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

--[[ Preload Checks ]]--

if not (getasset and requestfunc and queueteleport) then
	print("[Feather] Missing dependency(s).")
	return
end

--[[ Rejoin Checks ]]--

queueteleport [[
    repeat wait() until game:IsLoaded() wait(5)
    print("[Feather] Reexecuting script...")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Feather-Development/Feather-Script/main/main.lua"))()
]]

--[[ Variables ]]--

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local LocalPlayer = Player
local Humanoid = Player.Character.Humanoid
local Character = Player.Character
local Entity = loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/Libraries/entityHandler.lua"))() -- Mabye download the file and put it in the /Feather/ folder.
local espLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Sirius/request/library/esp/esp.lua'),true))()
local TPService = game:GetService("TeleportService")
local Directory = "Feather"

--[[ Setup ]]--

wait()

local Feather = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = Feather:MakeWindow({
    Name = "Feather", 
    HidePremium = false,
    SaveConfig = true, 
    ConfigFolder = "Feather/Profiles"
})

--[[ Private Access ]]--

local hasPrivate_IDs = {
    3555144226,
}

local hasPrivate_Names = {
    "comet2_exe",
}

local Combat = Window:MakeTab({
    Name = "Combat",
    Icon = "rbxassetid://9729721518",
    PremiumOnly = false
})

local Blatant = Window:MakeTab({
    Name = "Blatant",
    Icon = "rbxassetid://9729725301",
    PremiumOnly = false
})

local Render = Window:MakeTab({
    Name = "Render",
    Icon = "rbxassetid://9729726400",
    PremiumOnly = false
})

local World = Window:MakeTab({
    Name = "World",
    Icon = "rbxassetid://9729728100",
    PremiumOnly = false
})

local Utility = Window:MakeTab({
    Name = "Utility",
    Icon = "rbxassetid://9729729099",
    PremiumOnly = false
})

if not isfolder(Directory.."/Scripts/") then
    makefolder(Directory.."/Scripts/")
end

if not betterisfile(Directory.."Scripts/anygame.lua") then
    local req = requestfunc({
        Url = "https://raw.githubusercontent.com/Feather-Development/Feather-Script/main/Scripts/anygame.lua",
        Method = "GET"
    })
    writefile(Directory.."/Scripts/anygame.lua", req.Body)
end

if not isfolder(Directory.."/Addons/") then
    makefolder(Directory.."/Addons/")
end

for i,v in pairs(listfiles(Directory.."/Scripts")) do
    print(v)
    if v == Directory.."/Scripts".."\\"..game.PlaceId..".lua" then
        local anygame = loadstring(readfile(v))()
        anygame.Script = {
            Feather,
            {Blatant, Combat, Render, World, Utility}
        }
        anygame()
    elseif v == Directory.."/Scripts".."\\".."anygame.lua" then
        local anygame = loadstring(readfile(v))()
        --anygame.Script = {
        --    Feather,
        --    {Blatant, Combat, Render, World, Utility}
        --}
        --anygame()
    end
end
print("[Feather] Loaded script")

Feather:MakeNotification({
    Name = "Feather",
    Content = "Press Right-Shift to open the Feather Window.",
    Image = "rbxassetid://9677399831",
    Time = 5
})

--[[ Init ]]--

Feather:Init()