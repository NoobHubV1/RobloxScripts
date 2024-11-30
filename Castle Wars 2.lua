local Library = loadstring(Game:HttpGet('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard'))()
local plr = game.Players.LocalPlayer

local function getChar()
        return plr.Character
end

local function getPos()
        return getChar().HumanoidRootPart.Position
end

local function getTeam()
        return plr.Team
end

local function TPCFrame(Arg2)
        getChar().HumanoidRootPart.CFrame = Arg2
end

local function getFlag(Color)
        local old = getPos()
        if Color == "Yellow" then
        TPCFrame(CFrame.new(7.631763935089111, 8.230772018432617, 231.5720977783203))
        task.wait()
        TPCFrame(CFrame.new(old))
        elseif Color == "Green" then
        TPCFrame(CFrame.new(228.39013671875, 8.230772018432617, 11.631553649902344))
        task.wait()
        TPCFrame(CFrame.new(old))
        elseif Color == "Blue" then
        TPCFrame(CFrame.new(-214.5366973876953, 8.230772018432617, 10.208163261413574))
        task.wait()
        TPCFrame(CFrame.new(old))
        elseif Color == "Red" then
        TPCFrame(CFrame.new(7.779882431030273, 8.230772018432617, -212.0309295654297))
        task.wait()
        TPCFrame(CFrame.new(old))
        end
end

local function Win()
        if getTeam() == game.Teams["Blue Castle"] then
        getFlag("Yellow")
        task.wait()
        getFlag("Blue")
        task.wait()
        getFlag("Red")
        task.wait()
        getFlag("Blue")
        task.wait()
        getFlag("Green")
        task.wait()
        getFlag("Blue")
        elseif getTeam() == game.Teams["Red Castle"] then
        getFlag("Yellow")
        task.wait()
        getFlag("Red")
        task.wait()
        getFlag("Blue")
        task.wait()
        getFlag("Red")
        task.wait()
        getFlag("Green")
        task.wait()
        getFlag("Red")
        elseif getTeam() == game.Teams["Yellow Castle"] then
        getFlag("Red")
        task.wait()
        getFlag("Yellow")
        task.wait()
        getFlag("Blue")
        task.wait()
        getFlag("Yellow")
        task.wait()
        getFlag("Green")
        task.wait()
        getFlag("Yellow")
        elseif getTeam() == game.Teams["Green Castle"] then
        getFlag("Red")
        task.wait()
        getFlag("Green")
        task.wait()
        getFlag("Blue")
        task.wait()
        getFlag("Green")
        task.wait()
        getFlag("Yellow")
        task.wait()
        getFlag("Green")
        end
end

function Y() spawn(function() while getgenv().autowin do Win()
task.wait(0.5)
end
end)
end

local Window = Library:NewWindow("NoobHubV1 Hub")

local Section = Window:NewSection("Main")

Section:CreateButton("Get BlueFlag", function()getFlag("Blue")
end)

Section:CreateButton("Get RedFlag", function()getFlag("Red")
end)

Section:CreateButton("Get YellowFlag", function()getFlag("Yellow")
end)

Section:CreateButton("Get GreenFlag", function()getFlag("Green")
end)

local Section = Window:NewSection("Teleport")

Section:CreateButton("Goto YellowWars", function()TPCFrame(CFrame.new(8.104340553283691, 34.384605407714844, 282.4715576171875))
end)

Section:CreateButton("Goto GreenWars", function()TPCFrame(CFrame.new(282.7029724121094, 34.384605407714844, 10.628011703491211))
end)

Section:CreateButton("Goto RedWars", function()TPCFrame(CFrame.new(6.144602298736572, 34.384605407714844, -262.69915771484375))
end)

Section:CreateButton("Goto BlueWars", function()TPCFrame(CFrame.new(-266.5501708984375, 34.384605407714844, 9.965800285339355))
end)

local Section = Window:NewSection("Others")

Section:CreateButton("Win", function()Win()
end)

Section:CreateToggle("Auto Win", function(Value)getgenv().autowin = Value Y()
end)
