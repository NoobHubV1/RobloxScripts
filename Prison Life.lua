local Library = loadstring(Game:HttpGet('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard'))()

local function GetPlrs(txt)
	local tl = txt:lower()
	    local found= {}
	    if tl == "me" or tl == "me " then
	    table.insert(found,game.Players.LocalPlayer)
	    return found
	    elseif tl == "random" or tl == "random " then
	    table.insert(found,game.Players:GetPlayers()[math.random(1, #Game.Players:GetPlayers())])
	    return found
	    elseif tl == "others" or tl == "others " then
	    for i,v in pairs(game.Players:GetPlayers()) do
	    if v ~= game.Players.LocalPlayer then
	    table.insert(found, v)
	    end
	    end
	    return found
	    elseif tl == "all" or tl == "all " then
	    for i,v in pairs(game.Players:GetPlayers()) do
	    table.insert(found, v)
	    end
	    return found
	    elseif tl == "enemies" or tl == "enemies " then
	    for i,v in pairs(game.Players:GetPlayers()) do
	    if v ~= game.Players.LocalPlayer and v.Team ~= plr.Team then
	    table.insert(found, v)
	    end
	    end
	    return found
	    elseif tl == "team" or tl == "team " then
	    for i,v in pairs(game.Players:GetPlayers()) do
	    if v ~= game.Players.LocalPlayer and v.Team == plr.Team then
	    table.insert(found, v)
	    end
	    end
	    return found
	    else
	    for i,v in pairs(game.Players:GetPlayers()) do
	    if v.Name:lower():match(tl) or v.DisplayName:lower():match(tl) then
	    table.insert(found, v)
	    end
	    end
	    return found
	end
end

local PhantomForcesWindow = Library:NewWindow("NoobHubV1 Hub")

local PrisonLife = PhantomForcesWindow:NewSection("Kill Gui")

PrisonLife:CreateTextbox("Name", function(Value)PlayerName = Value
end)

PrisonLife:CreateButton("Kill", function()GetPlrs(PlayerName).Character.Humanoid.Health = 0
end)
