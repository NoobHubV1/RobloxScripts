-- Place Check
if game.PlaceId ~= 1701332290 then

	local OrionLib = loadstring(Game:HttpGet('https://raw.githubusercontent.com/NoobHubV1/RobloxScripts/main/OrionLib.lua'))()
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local NetworkEvents = ReplicatedStorage:WaitForChild("NetworkEvents")
	local Players = game:GetService("Players")
	local LocalPlayer = Players.LocalPlayer

        -- Functions
	local function GiveItem(Item)
		NetworkEvents.RemoteFunction:InvokeServer("PICKUP_ITEM", tostring(Item:gsub(" ", "")))
	end
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
	local function HealYourself()
		NetworkEvents.RemoteFunction:InvokeServer("HEAL_PLAYER", GetPlrs("me"), math.huge)
	end
	local function HealAllPlayers()
		NetworkEvents.RemoteFunction:InvokeServer("HEAL_PLAYER", GetPlrs("all"), math.huge)
	end
	local function HealPlayer(Name)
		NetworkEvents.RemoteFunction:InvokeServer("HEAL_PLAYER", GetPlrs(Name), math.huge)
	end
	local function KillZombies()
		for i, v in pairs(game:GetService("Workspace").NPC:GetChildren()) do
                NetworkEvents.RemoteFunction:InvokeServer(
                    "DO_DAMAGE",
                    v.Humanoid,
                    math.huge
                )
		end
	end
	local function Noclip(State)
		LocalPlayer.Character.HumanoidRootPart.CanCollide = State
		for i, v in pairs(LocalPlayer.Character:GetChildren()) do
			if v:IsA("MeshPart") then
				v.CanCollide = State
			end
		end
	end
	
        local function Notify(name, content, image, time)
		OrionLib:MakeNotification({
			Name = name,
			Content = content,
			Image = image,
			Time = time
		})
	end
	Notify("Check Id", "Check Id Game", "rbxassetid://4483345998", 5)

	        wait(5)

	Notify("Check Id Complete", "Loading Script", "rbxassetid://4483345998", 2)

	        wait(2)

	local Window = OrionLib:MakeWindow({
		Name = "Field Trip Z",
		HidePremium = false,
		SaveConfig = true,
		ConfigFolder = "OrionTest",
		IntroText = "Loading..."
	})
	local Tab = Window:MakeTab({
		Name = "Main",
		Icon = "rbxassetid://4483345998",
		PremiumOnly = false
	})
        local Section = Tab:AddSection({
		Name = "Get Item"
	})
	Tab:AddDropdown({
		Name = "Item",
		Default = "Bandage",
	        Options = {"Bandage", "Med Kit", "Donut"},
                Callback = function(Value)
                        SelectedItem = Value
		end
	})
        Tab:AddButton({
		Name = "Get Item",
		Callback = function()
			GiveItem(SelectedItem)
		end
	})
        local Section = Tab:AddSection({
		Name = "Heal Yourself"
	})
        Tab:AddButton({
		Name = "Heal Yourself",
		Callback = function()
			HealYourself()
		end
	})
        Tab:AddToggle({
                Name = "Loop Heal Yourself",
                Callback = function(State)
                        getgenv().HealLoop = State
                        while HealLoop do
                                HealYourself()
				task.wait()
                        end
                end
        })
	local Section = Tab:AddSection({
                Name = "Heal Player"
        })
	Tab:AddTextbox({
                Name = "Heal Player",
		Default = "PlayerName",
		TextDisappear = false,
                Callback = function(Value)
                        PlayerName = Value
               end
        })
	Tab:AddButton({
                Name = "Heal Player",
                Callback = function()
                        HealPlayer(PlayerName)
                end
	})
	Tab:AddToggle({
		Name = "Loop Heal Player",
		Default = false,
		Callback = function(State)
			while true do 
				HealPlayer(PlayerName)
			        task.wait()
			end
		end
	})
        local Section = Tab:AddSection({
                Name = "Heal All"
        })
        Tab:AddButton({
                Name = "Heal All",
                Callback = function()
                        HealAllPlayers()
               end
         })
         Tab:AddToggle({
                Name = "Loop Heal All",
                Callback = function(State)
                        getgenv().HealAllLoop = State
                        while HealAllLoop do
                                HealAllPlayers()
				task.wait()
                        end
                end
        })
        local Tab = Window:MakeTab({
		Name = "Combat",
		Icon = "rbxassetid://4483345998",
		PremiumOnly = false
	})
        local Section = Tab:AddSection({
		Name = "Kill Zombies"
	})
        Tab:AddToggle({
                Name = "Kill Aura",
                Callback = function(State)
                        getgenv().KillZombiesLoop = State
                        while KillZombiesLoop do
                                KillZombies()
				task.wait()
                        end
                end
        })
        local Tab = Window:MakeTab({
		Name = "Others",
		Icon = "rbxassetid://4483345998",
		PremiumOnly = false
	})
        local Section = Tab:AddSection({
		Name = "Others Section"
	})
        Tab:AddToggle({
                Name = "Inf Jump",
                Callback = function(State)
                        InfJump = State
game:GetService("UserInputService").JumpRequest:connect(function()
	if InfJump then
		game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):ChangeState("Jumping")
 end
end)
                end
        })
	Tab:AddToggle({
		Name = "Noclip",
		Callback = function(State)
			getgenv().Noclipping = State
			if Noclipping == true then
				spawn(function()
					while Noclipping == true do
						Noclip(false)
						task.wait(.05)
					end
				end)
			end
			if Noclipping == false then
				Noclip(true)
			end
		end
	})
        Tab:AddButton({
                Name = "Fly",
                Callback = function()
                        loadstring(Game:HttpGet('https://raw.githubusercontent.com/NoobHubV1/RobloxScripts/main/Fly.lua'))()
                end
         })
         Tab:AddButton({
                Name = "Shift Lock",
                Callback = function()
                        loadstring(Game:HttpGet('https://raw.githubusercontent.com/NoobHubV1/RobloxScripts/main/Shift%20Lock.lua'))()
                end
         })
         Tab:AddButton({
                Name = "Keyboard",
                Callback = function()
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
                end
         })
         local Tab = Window:MakeTab({
		Name = "Destroy Script",
		Icon = "rbxassetid://4483345998",
		PremiumOnly = false
	 })
         Tab:AddButton({
                Name = "Destroy",
                Callback = function()
                        OrionLib:Destroy()
                end
         })

         Notify('Loaded!', "Script Successfully Loaded!\nJoin Our Discord At (https://discord.gg/NoobHubV1) For Support Script, You Execute Script NoobHubV1 Loader", 'rbxassetid://4483345998', 15)
	OrionLib:Init()
end
