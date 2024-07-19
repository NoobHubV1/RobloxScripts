local Library = loadstring(Game:HttpGet('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard'))()

local Window = Library:NewWindow("NoobHubV1 Check Key")

local KeySystem = Window:NewSection("Check Key")

KeySystem:CreateTextbox("Key", function(Value)CheckKey = Value
end)

KeySystem:CreateButton("Check Key", function()if CheckKey == "NoobHubV1PremiumScript" then
         loadstring(Game:HttpGet('https://raw.githubusercontent.com/NoobHubV1/RobloxScripts/main/LoaderGame/AllGames.lua'))()
                                              end
end)

KeySystem:CreateButton("Copy Key Link", function()setclipboard("https://paste-drop.com/paste/3qMxRvQfyB")
end)
