if not game.workspace:FindFirstChild("PFA") then local part = Instance.new("Part") part.Name = "PFA" part.Parent = game.workspace part.CFrame = CFrame.new(-3.231036901473999, -7.852593898773193, 50.97597122192383) part.Size = Vector3.new(500, 0, 500) part.Anchored = 1 part.Reflectance = 1 end

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
        TPCFrame(CFrame.new(-3.3321471214294434, -5.642877101898193, 203.14895629882812))
        task.wait(5.5)
        getFlag("Blue")
        task.wait()
        TPCFrame(CFrame.new(-3.3321471214294434, -5.642877101898193, 203.14895629882812))
        task.wait(5.5)
        getFlag("Green")
        task.wait()
        TPCFrame(CFrame.new(-3.3321471214294434, -5.642877101898193, 203.14895629882812))
        task.wait(5.5)
        TPCFrame(CFrame.new(old))
        elseif getTeam() == game.Teams["Red Team"] then
        getFlag("Yellow")
        task.wait()
        TPCFrame(CFrame.new(150.74948120117188, -4.8275957107543945, 50.99748611450195))
        task.wait(5.5)
        getFlag("Blue")
        task.wait()
        TPCFrame(CFrame.new(150.74948120117188, -4.8275957107543945, 50.99748611450195))
        task.wait(5.5)
        getFlag("Green")
        task.wait()
        TPCFrame(CFrame.new(150.74948120117188, -4.8275957107543945, 50.99748611450195))
        task.wait(5.5)
        TPCFrame(CFrame.new(old))
        elseif getTeam() == game.Teams["Blue Team"] then
        getFlag("Yellow")
        task.wait()
        TPCFrame(CFrame.new(-1.44679856300354, -4.827594757080078, -101.60074615478516))
        task.wait(5.5)
        getFlag("Red")
        task.wait()
        TPCFrame(CFrame.new(-1.44679856300354, -4.827594757080078, -101.60074615478516))
        task.wait(5.5)
        getFlag("Green")
        task.wait()
        TPCFrame(CFrame.new(-1.44679856300354, -4.827594757080078, -101.60074615478516))
        task.wait(5.5)
        TPCFrame(CFrame.new(old))
        elseif getTeam() == game.Teams["Green Team"] then
        getFlag("Yellow")
        task.wait()
        TPCFrame(CFrame.new(-154.27056884765625, -4.827594757080078, 50.37508773803711))
        task.wait(5.5)
        getFlag("Red")
        task.wait()
        TPCFrame(CFrame.new(-154.27056884765625, -4.827594757080078, 50.37508773803711))
        task.wait(5.5)
        getFlag("Blue")
        task.wait()
        TPCFrame(CFrame.new(-154.27056884765625, -4.827594757080078, 50.37508773803711))
        task.wait(5.5)
        TPCFrame(CFrame.new(old))
        end
end

local function KillAura()
        local connections = getgenv().configs and getgenv().configs.connection
if connections then
    local Disable = configs.Disable
    for i,v in connections do
        v:Disconnect() 
    end
    Disable:Fire()
    Disable:Destroy()
    table.clear(configs)
end

local Disable = Instance.new("BindableEvent")
getgenv().configs = {
    connections = {},
    Disable = Disable,
    Size = Vector3.new(30,30,30),
    DeathCheck = true
}

local Players = cloneref(game:GetService("Players"))
local RunService = cloneref(game:GetService("RunService"))
local lp = Players.LocalPlayer
local Run = true
local Ignorelist = OverlapParams.new()
Ignorelist.FilterType = Enum.RaycastFilterType.Include

local function getchar(plr)
    local plr = plr or lp
    return plr.Character
end

local function gethumanoid(plr: Player | Character)
    local char = plr:IsA("Model") and plr or getchar(plr)

    if char then
        return char:FindFirstChildWhichIsA("Humanoid")
    end
end

local function IsAlive(Humanoid)
    return Humanoid and Humanoid.Health > 0
end

local function GetTouchInterest(Tool)
    return Tool and Tool:FindFirstChildWhichIsA("TouchTransmitter",true)
end

local function GetCharacters(LocalPlayerChar)
    local Characters = {}
    for i,v in Players:GetPlayers() do
        table.insert(Characters,getchar(v))
    end
    table.remove(Characters,table.find(Characters,LocalPlayerChar))
    return Characters
end

local function Attack(Tool,TouchPart,ToTouch)
    if Tool:IsDescendantOf(workspace) then
        Tool:Activate()
        firetouchinterest(TouchPart,ToTouch,1)
        firetouchinterest(TouchPart,ToTouch,0)
    end
end

table.insert(getgenv().configs.connections,Disable.Event:Connect(function()
    Run = false
end))

while Run do
    local char = getchar()
    if IsAlive(gethumanoid(char)) then
        local Tool = char and char:FindFirstChildWhichIsA("Tool")
        local TouchInterest = Tool and GetTouchInterest(Tool)

        if TouchInterest then
            local TouchPart = TouchInterest.Parent
            local Characters = GetCharacters(char)
            Ignorelist.FilterDescendantsInstances = Characters
            local InstancesInBox = workspace:GetPartBoundsInBox(TouchPart.CFrame,TouchPart.Size + getgenv().configs.Size,Ignorelist)

            for i,v in InstancesInBox do
                local Character = v:FindFirstAncestorWhichIsA("Model")

                if table.find(Characters,Character) then
                    if getgenv().configs.DeathCheck then                    
                        if IsAlive(gethumanoid(Character)) then
                            Attack(Tool,TouchPart,v)
                        end
                    else
                        Attack(Tool,TouchPart,v)
                    end
                end
            end
        end
    end
    RunService.Heartbeat:Wait()
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

Others:CreateButton("KillAura", function()KillAura()
end)
