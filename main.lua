wait(game:IsLoaded()) --[[ Preload --]] local ft = getsynasset or getcustomasset or function(c) return "\114\98\120\97\115\115\101\116\58\47\47"..c end local i = syn and syn.queue_on_teleport or queue_on_teleport or fluxus and fluxus.queue_on_teleport or function() end local p = syn and syn.request or http and http.request or http_request or fluxus and fluxus.request or request or function(n) if n.Method == "\71\69\84" then return { Body = game:HttpGet(n.Url, true), Headers = {}, StatusCode = 200 } else return { Body = "\98\97\100\32\101\120\112\108\111\105\116", Headers = {}, StatusCode = 404 } end end --[[ Preload Checks --]] if not (ft and p and i) then print("\91\70\101\97\116\104\101\114\93\32\77\105\115\115\105\110\103\32\100\101\112\101\110\100\101\110\99\121\40\115\41\46") return end --[[ Rejoin Checks --]] i [[     repeat wait() until game:IsLoaded() wait(5)     print("\91\70\101\97\116\104\101\114\93\32\82\101\101\120\101\99\117\116\105\110\103\32\115\99\114\105\112\116\46\46\46")     loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\70\101\97\116\104\101\114\45\68\101\118\101\108\111\112\109\101\110\116\47\70\101\97\116\104\101\114\45\83\99\114\105\112\116\47\109\97\105\110\47\109\97\105\110\46\108\117\97"))() ]] --[[ Variables --]] local d = game:GetService("\80\108\97\121\101\114\115") local md = d.LocalPlayer local q = md local sq = md.Character.Humanoid local a = md.Character local ga = loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\55\71\114\97\110\100\68\97\100\80\71\78\47\86\97\112\101\86\52\70\111\114\82\111\98\108\111\120\47\109\97\105\110\47\76\105\98\114\97\114\105\101\115\47\101\110\116\105\116\121\72\97\110\100\108\101\114\46\108\117\97"))()  local lg = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Sirius/request/library/esp/esp.lua'),true))() local ol = game:GetService("\84\101\108\101\112\111\114\116\83\101\114\118\105\99\101") --[[ Setup --]] wait() local jo = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))() local rj = jo:MakeWindow({ Name = "\70\101\97\116\104\101\114",  HidePremium = false, SaveConfig = true,  ConfigFolder = "\70\101\97\116\104\101\114\47\80\114\111\102\105\108\101\115" }) --[[ Private Access --]] local er = { 3555144226, } local ce = { "\99\111\109\101\116\50\95\101\120\101", } --[[ Functions --]] local function b(k, t) for i, v in ipairs(k) do if v == t then return true end end return false end local nc = {} local _ = {} local function f(j, g, l) if nc[j] == nil then nc[j] = game:GetService("\82\117\110\83\101\114\118\105\99\101").RenderStepped:Connect(l) end end local function m(j) if nc[j] then nc[j]:Disconnect() nc[j] = nil end end local function s(j, g, l) if _[j] == nil then _[j] = game:GetService("\82\117\110\83\101\114\118\105\99\101").Stepped:Connect(l) end end local function o(j) if _[j] then _[j]:Disconnect() _[j] = nil end end local function r(e) jo:MakeNotification({ Name = "\70\101\97\116\104\101\114", Content = e, Image = "\114\98\120\97\115\115\101\116\105\100\58\47\47\57\54\55\55\51\57\57\56\51\49", Time = 5 }) end --[[ Categories --]] local b_ = rj:MakeTab({ Name = "\67\111\109\98\97\116", Icon = "\114\98\120\97\115\115\101\116\105\100\58\47\47\52\52\56\51\51\52\53\57\57\56", PremiumOnly = false }) local kb = rj:MakeTab({ Name = "\66\108\97\116\97\110\116", Icon = "\114\98\120\97\115\115\101\116\105\100\58\47\47\57\54\55\56\56\48\51\53\48\49", PremiumOnly = false }) local tk = rj:MakeTab({ Name = "\82\101\110\100\101\114", Icon = "\114\98\120\97\115\115\101\116\105\100\58\47\47\57\54\55\56\56\48\52\50\51\53", PremiumOnly = false }) local ftk = rj:MakeTab({ Name = "\87\111\114\108\100", Icon = "\114\98\120\97\115\115\101\116\105\100\58\47\47\57\54\55\56\56\48\52\56\56\50", PremiumOnly = false }) local ift = rj:MakeTab({ Name = "\85\116\105\108\105\116\121", Icon = "\114\98\120\97\115\115\101\116\105\100\58\47\47\57\54\55\56\56\48\53\52\51\54", PremiumOnly = false }) --[[ Modules --]] [[ Private ≈ Beta ]] if b(er, q.UserId) and b(ce, q.Name) then local pi = rj:MakeTab({ Name = "\80\114\105\118\97\116\101", Icon = "\114\98\120\97\115\115\101\116\105\100\58\47\47\57\54\55\55\51\57\57\56\51\49", PremiumOnly = false }) end [[ Combat ]] [[ Blatant ]] kb:AddSlider({ Name = "\83\112\101\101\100", Min = 16, Max = 256, Default = 16, Color = Color3.fromRGB(65, 114, 146), Increment = 1, ValueName = "\83\112\101\101\100", Flag = "\87\97\108\107\115\112\101\101\100", Save = true, Callback = function(t) sq.WalkSpeed = t end }) kb:AddSlider({ Name = "\74\117\109\112", Min = 50, Max = 500, Default = 50, Color = Color3.fromRGB(1, 127, 96), Increment = 1, ValueName = "\74\117\109\112", Flag = "\74\117\109\112\112\111\119\101\114", Save = true, Callback = function(t) sq.JumpPower = t end }) kb:AddTextbox({ Name = "\84\101\108\101\112\111\114\116\32\116\111\32\80\108\97\121\101\114", Callback = function(t) t = t:lower() for i,v in pairs(d:GetChildren()) do if string.find(v.Name:lower(), t) then md.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame else if string.find(v.DisplayName:lower(), t) then md.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame end end end end }) [[ Render ]] tk:AddLabel("\69\83\80") tk:AddToggle({ Name = "\69\83\80", Default = false, Flag = "\69\83\80\84\111\103\103\108\101", Save = true, Callback = function(t) if t then lg.Init() else lg.Unload() end end }) [[ World ]] ftk:AddLabel("\70\80\83\32\66\111\111\115\116\101\114") local dp = ftk:AddDropdown({ Name = "\76\101\118\101\108\115", Default = "\76\101\118\101\108\32\49", Options = {"\76\101\118\101\108\32\49", "\76\101\118\101\108\32\50", "\76\101\118\101\108\32\51"}, Flag = "\70\80\83\76\101\118\101\108", Save = true }) ftk:AddButton({ Name = "\66\111\111\115\116", Flag = "\70\80\83\66\111\111\115\116", Save = true, Callback = function() r("\84\104\105\115\32\102\101\97\116\117\114\101\32\105\115\32\99\117\114\114\101\110\116\108\121\32\105\114\114\101\118\101\114\115\105\98\108\101\44\32\112\108\101\97\115\101\32\114\101\106\111\105\110\32\116\111\32\114\101\115\101\116\46") if dp.Value == "\76\101\118\101\108\32\49" then for _,v in pairs(workspace:GetDescendants()) do if v.ClassName == "\80\97\114\116" or v.ClassName == "\83\112\97\119\110\76\111\99\97\116\105\111\110" or v.ClassName == "\87\101\100\103\101\80\97\114\116" or v.ClassName == "\84\101\114\114\97\105\110" or v.ClassName == "\77\101\115\104\80\97\114\116" then v.Material = "\80\108\97\115\116\105\99" end end elseif dp.Value == "\76\101\118\101\108\32\50" then for _,v in pairs(workspace:GetDescendants()) do if v.ClassName == "\80\97\114\116" or v.ClassName == "\83\112\97\119\110\76\111\99\97\116\105\111\110" or v.ClassName == "\87\101\100\103\101\80\97\114\116" or v.ClassName == "\84\101\114\114\97\105\110" or v.ClassName == "\77\101\115\104\80\97\114\116" then v.Material = "\80\108\97\115\116\105\99" end end for _,v in pairs(workspace:GetDescendants()) do end elseif dp.Value == "\76\101\118\101\108\32\51" then for _,v in pairs(workspace:GetDescendants()) do if v.ClassName == "\80\97\114\116" or v.ClassName == "\83\112\97\119\110\76\111\99\97\116\105\111\110" or v.ClassName == "\87\101\100\103\101\80\97\114\116" or v.ClassName == "\84\101\114\114\97\105\110" or v.ClassName == "\77\101\115\104\80\97\114\116" then v.BrickColor = BrickColor.new(155, 155, 155) v.Material = "\80\108\97\115\116\105\99" end end else r("\83\111\109\101\116\104\105\110\103\32\105\110\99\114\101\100\105\98\108\121\32\119\114\111\110\103\32\104\97\115\32\104\97\112\112\101\110\101\100\46") end end }) [[ Utility ]] ift:AddButton({ Name = "\82\101\115\101\116\32\67\104\97\114\97\99\116\101\114", Callback = function() md.Character.Humanoid.Health = 0 end }) ift:AddButton({ Name = "\83\101\114\118\101\114\104\111\112", Callback = function() r("\83\101\110\100\105\110\103\32\121\111\117\32\116\111\32\97\32\110\101\119\32\103\97\109\101\46") ol:Teleport(game.PlaceId, md) end }) --[[ Notification --]] jo:MakeNotification({ Name = "\70\101\97\116\104\101\114", Content = "\80\114\101\115\115\32\82\105\103\104\116\45\83\104\105\102\116\32\116\111\32\111\112\101\110\32\116\104\101\32\70\101\97\116\104\101\114\32\87\105\110\100\111\119\46", Image = "\114\98\120\97\115\115\101\116\105\100\58\47\47\57\54\55\55\51\57\57\56\51\49", Time = 5 }) --[[ Init --]] jo:Init()