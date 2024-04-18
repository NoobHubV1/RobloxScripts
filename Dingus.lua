local PathfindingService = game:GetService("PathfindingService")
local Players = game:GetService("Players")
local Character = Players.LocalPlayer.Character or Players.LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local tasks = {}
local proximityprompts = {}
local path = PathfindingService:CreatePath({AgentCanJump = false,AgentCanClimb = false,})
local library = loadstring(game:GetObjects("rbxassetid://7657867786")[1].Source)()
local Wait = library.subs.Wait
local config = require(game:GetService("ReplicatedStorage").config)
local HumanoidRootPart = Character.HumanoidRootPart


-- taken from devforum
local function GetPlayer(Input)
    for _, Player in ipairs(Players:GetPlayers()) do
        if (string.lower(Input) == string.sub(string.lower(Player.Name), 1, #Input)) then
            return Player;
        end
    end
end

local function getclosestprompt()
    local Character = Players.LocalPlayer.Character or Players.LocalPlayer.CharacterAdded:Wait()
    local prompt, distance = nil, 9e9

    for i,v in pairs(proximityprompts) do
        if Character and Character:FindFirstChild("HumanoidRootPart") then
            local distanceBetween = (Character.HumanoidRootPart.Position - i.Position).Magnitude

            if distanceBetween < distance then
                distance = distanceBetween
                prompt = v
            end
        end
    end

    return prompt
end

local function fireproximityprompt(Obj, Amount, Skip)
    if Obj.ClassName == "ProximityPrompt" then 
        Amount = Amount or 1
        local PromptTime = Obj.HoldDuration
        if Skip then 
            Obj.HoldDuration = 0
        end
        for i = 1, Amount do 
            Obj:InputHoldBegin()
            if not Skip then 
                task.wait(Obj.HoldDuration + 1)
            end
            Obj:InputHoldEnd()
        end
        Obj.HoldDuration = PromptTime
    else 
        error("userdata<ProximityPrompt> expected")
    end
end

local function killplayer(name)
    if name == "all" then
        for i,v in pairs(Players:GetChildren()) do
            if v ~= Players.LocalPlayer then
                game:GetService("ReplicatedStorage").Remotes.KillCharacter:InvokeServer(v.Character)
            end
        end
    else
        game:GetService("ReplicatedStorage").Remotes.KillCharacter:InvokeServer(GetPlayer(name).Character)
    end
end

for i,v in pairs(game:GetService("ReplicatedStorage").Remotes.RequestTaskList:InvokeServer()) do
    if v.TaskRequired then
        tasks[v.TaskName] = v
        print(v.TaskName .. " | " .. v.TaskDescriptor .. " | " .. v.TaskType)
    end
end

for i,v in pairs(workspace.LoadedMap:GetDescendants()) do
    if v:IsA("ProximityPrompt") then
        proximityprompts[v.Parent.Parent] = v
    end
end

local goober = library:CreateWindow({
    Name = "dingus",
})

local general = goober:CreateTab({
    Name = "general"
})

local hidersection = general:CreateSection({
    Name = "hider"
})

local shootersection = general:CreateSection({
    Name = "hunter"
})

shootersection:AddButton({
    Name = "kill all",
    Callback = function()
        killplayer("all")
    end
})

shootersection:AddToggle({
    Name = "Auto kill all",
    Callback = function(State)
        getgenv().KillAllLoop = State
        while KillAllLoop do
                killplayer("all")
                task.wait(8)
        end
    end
})

shootersection:AddToggle({
    Name = "no shoot cooldown",
    Callback = function(v)
        if v then
            config.HUNTER_FIRE_COOLDOWN_EXTRA = 0
        else
            config.HUNTER_FIRE_COOLDOWN_EXTRA = 1.25
        end
    end
})

shootersection:AddToggle({
    Name = "no blindness",
    Callback = function(v)
        if v then
            config.HUNTER_MISS_BLIND_TIME = 0

        else
            config.HUNTER_MISS_BLIND_TIME = 12
        end
    end
})

shootersection:AddTextbox({
    Name = "kill person",
    Flag = "goober"
})

shootersection:AddButton({
    Name = "kill him",
    Callback = function()
        killplayer(library.Flags["goober"])
    end
})

hidersection:AddButton({
    Name = "legit auto task (really buggy for some reason)",
    Callback = function()
        for i = 1, 20 do
            game.ReplicatedStorage.Remotes.InvokeTaskCompleted:InvokeServer(i)
        task.wait(2)
        end
    end
})

hidersection:AddButton({
    Name = "All Tasks",
    Callback = function()
        for i = 1, 50 do
            game.ReplicatedStorage.Remotes.InvokeTaskCompleted:InvokeServer(i)
        end
    end
})

hidersection:AddToggle({
    Name = "Auto All Tasks",
    Callback = function(State)
        getgenv().AllTasksLoop = State
        while AllTasksLoop do
                for i = 1, 50 do
            game.ReplicatedStorage.Remotes.InvokeTaskCompleted:InvokeServer(i)
                task.wait()
                end
                task.wait()
        end
    end
})
