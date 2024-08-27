local Library = loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local plr = game.Players.LocalPlayer

local function getChar()
        return plr.Character
end

local function getPos()
        return getChar().HumanoidRootPart.Position
end

local function TPCFrame(Arg2)
        getChar().HumanoidRootPart.CFrame = Arg2
end

local function getTeam()
        return plr.Team
end

local function getFlag(Color)
        local old = getPos()
        if Color == "Yellow" then
                 TPCFrame(CFrame.new(-1.9204726219177246, 3.999999761581421, 203.99520874023438))
        task.wait()
        TPCFrame(CFrame.new(old))
        elseif Color == "Red" then
        TPCFrame(CFrame.new(149.90963745117188, 3.9999992847442627, 51.03753662109375))
        task.wait()
        TPCFrame(CFrame.new(old))
        elseif Color == "Blue" then
        TPCFrame(CFrame.new(-2.0121514797210693, 3.9999992847442627, -101.81643676757812))
        task.wait()
        TPCFrame(CFrame.new(old))
        elseif Color == "Green" then
        TPCFrame(CFrame.new(-155.8241424560547, 3.999999761581421, 51.10609436035156))
        task.wait()
        TPCFrame(CFrame.new(old))
        end
end

local function Win()
        local old = getPos()
        if getTeam() == game.Teams["Yellow Team"] then
        getFlag("Red")
        task.wait()
        TPCFrame(CFrame.new(-1.9204726219177246, 3.999999761581421, 203.99520874023438))
        task.wait(5.5)
        getFlag("Blue")
        task.wait()
        TPCFrame(CFrame.new(-1.9204726219177246, 3.999999761581421, 203.99520874023438))
        task.wait(5.5)
        getFlag("Green")
        task.wait()
        TPCFrame(CFrame.new(-1.9204726219177246, 3.999999761581421, 203.99520874023438))
        task.wait(5.5)
        TPCFrame(CFrame.new(old))
        elseif getTeam() == game.Teams["Red Team"] then
        getFlag("Yellow")
        task.wait()
        TPCFrame(CFrame.new(149.90963745117188, 3.9999992847442627, 51.03753662109375))
        task.wait(5.5)
        getFlag("Blue")
        task.wait()
        TPCFrame(CFrame.new(149.90963745117188, 3.9999992847442627, 51.03753662109375))
        task.wait(5.5)
        getFlag("Green")
        task.wait()
        TPCFrame(CFrame.new(149.90963745117188, 3.9999992847442627, 51.03753662109375))
        task.wait(5.5)
        TPCFrame(CFrame.new(old))
        elseif getTeam() == game.Teams["Blue Team"] then
        getFlag("Yellow")
        task.wait()
        TPCFrame(CFrame.new(-2.0121514797210693, 3.9999992847442627, -101.81643676757812))
        task.wait(5.5)
        getFlag("Red")
        task.wait()
        TPCFrame(CFrame.new(-2.0121514797210693, 3.9999992847442627, -101.81643676757812))
        task.wait(5.5)
        getFlag("Green")
        task.wait()
        TPCFrame(CFrame.new(-2.0121514797210693, 3.9999992847442627, -101.81643676757812))
        task.wait(5.5)
        TPCFrame(CFrame.new(old))
        elseif getTeam() == game.Teams["Green Team"] then
        getFlag("Yellow")
        task.wait()
        TPCFrame(CFrame.new(-155.8241424560547, 3.999999761581421, 51.10609436035156))
        task.wait(5.5)
        getFlag("Red")
        task.wait()
        TPCFrame(CFrame.new(-155.8241424560547, 3.999999761581421, 51.10609436035156))
        task.wait(5.5)
        getFlag("Blue")
        task.wait()
        TPCFrame(CFrame.new(-155.8241424560547, 3.999999761581421, 51.10609436035156))
        task.wait(5.5)
        TPCFrame(CFrame.new(old))
        end
end

local Window = Library:NewWindow("NoobHubV1 Hub")

local Main = Window:NewSection("Main")

local Others = Window:NewSection("Others")

Main:CreateButton("Get YellowFlag", function()getFlag("Yellow")
end)

Main:CreateButton("Get RedFlag", function()getFlag("Red")
end)

Main:CreateButton("Get BlueFlag", function()getFlag("Blue")
end)

Main:CreateButton("Get GreenFlag", function()getFlag("Green")
end)

Others:CreateButton("Win", function()Win()
end)
