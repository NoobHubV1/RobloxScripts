-- Place Check
if game.PlaceId ~= 1701332290 then

	local OrionLib = loadstring(Game:HttpGet('https://raw.githubusercontent.com/NoobHubV1/RobloxScripts/main/OrionLib.lua'))()
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local NetworkEvents = ReplicatedStorage:WaitForChild("NetworkEvents")
	local Players = game:GetService("Players")
	local ScriptLoaded = false
	local LocalPlayer = Players.LocalPlayer

        -- Functions
	local function GiveItem(Item)
		NetworkEvents.RemoteFunction:InvokeServer("PICKUP_ITEM", tostring(Item:gsub(" ", "")))
	end
	local HealPlayer = function(Name)
	        if Name == "all" then
			for i, v in pairs(game.Players:GetPlayers()) do
                            if v.Name ~= game:GetService("Players").LocalPlayer then
                    NetworkEvents.RemoteFunction:InvokeServer(
                        "HEAL_PLAYER",
                        v,
                        math.huge
                    )
                            end
		        end
		elseif Name == "others" then
			for i, v in pairs(game.Players:GetPlayers()) do
			    if v ~= game:GetService("Players").LocalPlayer then
		    NetworkEvents.RemoteFunction:InvokeServer("HEAL_PLAYER", v, math.huge)
			    end
			end
	        elseif Name == "me" then
		        NetworkEvents.RemoteFunction:InvokeServer("HEAL_PLAYER", LocalPlayer, math.huge)
		else
			NetworkEvents.RemoteFunction:InvokeServer("HEAL_PLAYER", Name, math.huge)
		end
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
	local function LoadFuncti(Calling, Functi)
		Calling(Functi)
	end
	local function Noclip(State)
		LocalPlayer.Character.HumanoidRootPart.CanCollide = State
		for i, v in pairs(LocalPlayer.Character:GetChildren()) do
			if v:IsA("MeshPart") then
				v.CanCollide = State
			end
		end
	end
	local LoadHttps = function(Https)
		spawn(loadstring(Game:HttpGet(Https)))
	end
	local function updatePlayerDropdown()
                local playerNames = {}
                     for _, otherPlayer in pairs(Players:GetPlayers()) do
                           table.insert(playerNames, otherPlayer.DisplayName)
                     end
                return playerNames
	end
	local function getPlayerByName(name)
                for _, otherPlayer in pairs(Players:GetPlayers()) do
                      if otherPlayer.DisplayName == name then
                             return otherPlayer
                      end
                end
        return nil
	end
	function U() spawn(function() while getgenv().healme do LoadFuncti(HealPlayer, "me")
	task.wait()
	end
	end)
	end
	function C(Player) spawn(function() while getgenv().heal do LoadFuncti(HealPlayer, getPlayerByName(Player))
	task.wait()
	end
	end)
	end
	function Y() spawn(function() while getgenv().healothers do LoadFuncti(HealPlayer, "others")
	task.wait()
	end
	end)
	end
	function H() spawn(function() while getgenv().healall do LoadFuncti(HealPlayer, "all")
	task.wait()
	end
	end)
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
			LoadFuncti(SelectedItem)
		end
	})
        local Section = Tab:AddSection({
		Name = "Heal Plr"
	})
	Tab:AddDropdown({
		Name = "Select Player",
		Default = "",
	        Options = updatePlayerDropdown(),
                Callback = function(Value)
                        SelectedPlayer = Value
		end
	})
	Tab:AddButton({
		Name = "Heal",
		Callback = function()
			LoadFuncti(HealPlayer, getPlayerByName(SelectedPlayer))
		end
	})
	Tab:AddToggle({
                Name = "Loop Heal",
                Callback = function(State)
                        getgenv().heal = State C(SelectedPlayer)
                end
        })
        Tab:AddButton({
		Name = "Heal Yourself",
		Callback = function()
			LoadFuncti(HealPlayer, "me")
		end
	})
        Tab:AddToggle({
                Name = "Loop Heal Yourself",
                Callback = function(State)
                        getgenv().healme = State U()
                end
        })
	Tab:AddButton({
                Name = "Heal Others",
                Callback = function()
                        LoadFuncti(HealPlayer, "others")
                end
	})
	Tab:AddToggle({
		Name = "Loop Heal Others",
		Default = false,
		Callback = function(State)
			getgenv().healothers = State Y()
		end
	})
        Tab:AddButton({
                Name = "Heal All",
                Callback = function()
                        LoadFuncti(HealPlayer, "all")
               end
         })
         Tab:AddToggle({
                Name = "Loop Heal All",
                Callback = function(State)
                        getgenv().healall = State H()
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
                        getgenv().Loop = State
			   while Loop do
				   LoadFuncti(KillZombies)
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
                        LoadHttps("https://raw.githubusercontent.com/NoobHubV1/RobloxScripts/main/Fly.lua")
                end
         })
         Tab:AddButton({
                Name = "Shift Lock",
                Callback = function()
                        LoadHttps("https://raw.githubusercontent.com/NoobHubV1/RobloxScripts/main/Shift%20Lock.lua")
                end
         })
         Tab:AddButton({
                Name = "Keyboard",
                Callback = function()
                        LoadHttps("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt")
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

Players.PlayerAdded:Connect(function()
	Tab:UpdateDropdown({
		Name = "Select Player",
	        Options = updatePlayerDropdown()
	})
end)

Players.PlayerRemoving:Connect(function()
	Tab:UpdateDropdown({
		Name = "Select Player",
	        Options = updatePlayerDropdown()
	})
end)
	
        Notify('Loaded!', "Script Successfully Loaded!\nJoin Our Discord At (https://discord.gg/NoobHubV1) For Support Script, You Execute Script NoobHubV1 Loader", 'rbxassetid://4483345998', 15)
	ScriptLoaded = true
	OrionLib:Init()
end
