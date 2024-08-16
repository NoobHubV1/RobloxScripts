local Library = loadstring(Game:HttpGet('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard'))()

local function GiveItem(Item)
        if Item == "Virus" then
                game:GetService("ReplicatedStorage").Events.GiveVirus:FireServer()
        elseif Item == "Cure" then
                game:GetService("ReplicatedStorage").Events.GiveCure:FireServer()
        elseif Item == "MuntantVirus" then
                game:GetService("ReplicatedStorage").Events.GiveMuntantVirus:FireServer()
        elseif Item == "Coffee" then
                game:GetService("ReplicatedStorage").Events.GiveCoffee:FireServer()
        elseif Item == "CheeseBurger" then
                game:GetService("ReplicatedStorage").Events.GiveCheeseBurger:FireServer()
        end
end

local Window = Library:NewWindow("NoobHubV1 Hub")

local Section = Window:NewSection("Main")

Section:CreateDropdown("Item", {"Virus","Cure","MuntantVirus","Coffee","CheeseBurger"}, 1, function(val)SelectedItem = val
end)

Section:CreateButton("Give Item", function()GiveItem(SelectedItem)
end)
