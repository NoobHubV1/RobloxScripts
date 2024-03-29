-- Place Check
if game.PlaceId ~= 1119466531 then

	local OrionLib = loadstring(Game:HttpGet('https://raw.githubusercontent.com/NoobHubV1/NoobHubV1/main/OrionLib.lua'))()
        local function Notify(name, content, image, time)
		OrionLib:MakeNotification({
			Name = name,
			Content = content,
			Image = image,
			Time = time
		})
	end
	local Window = OrionLib:MakeWindow({
		Name = "Legends Of Speed",
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
		Name = "Settings"
	})
        Tab:AddDropdown({
		Name = "Orb",
		Default = "Red Orb",
	        Options = {"Red Orb", "Blue Orb", "Orange Orb"},
                Callback = function(Orb)
                        SelectedOrb = Orb
		end
	})
        local Section = Tab:AddSection({
		Name = "Auto Farm"
	})
        Tab:AddToggle({
                Name = "Auto Orb",
                Callback = function(Value)
                        getgenv().OrbLoop = Value
                        while OrbLoop do
                                for i = 1, 3 do
                                        game.ReplicatedStorage.rEvents.orbEvent:FireServer("collectOrb", SelectedOrb, "City")
                                end
                                task.wait(WaitTimeAutoOrb)
                        end
                end
        })
        Tab:AddToggle({
                Name = "Auto Gem",
                Callback = function(Value)
                        getgenv().GemLoop = Value
                        while GemLoop do
                                for i = 1, 3 do
                                        game.ReplicatedStorage.rEvents.orbEvent:FireServer("collectOrb", "Gem", "City")
                                end
                                task.wait(WaitTimeAutoGem)
                        end
                end
        })
        Tab:AddToggle({
                Name = "Auto Hoop",
                Callback = function(Value)
                        getgenv().HoopLoop = Value
                        while HoopLoop do
                                for i, v in pairs(game:GetService("Workspace").Hoops:GetChildren()) do
                        firetouchinterest(v, game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, 0)
                        wait()
                        firetouchinterest(v, game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, 1)
                    end
                                task.wait(WaitTimeAutoHoop)
                        end
                end
        })
        local Section = Tab:AddSection({
		Name = "Wait Time"
	})
        Tab:AddTextbox({
		Name = "Wait Time Auto Orb",
		Default = "Amount",
		TextDisappear = false,
		Callback = function(Amount)
			WaitTimeAutoOrb = Amount
		end	  
	})
        Tab:AddTextbox({
		Name = "Wait Time Auto Gem",
		Default = "Amount",
		TextDisappear = false,
		Callback = function(Amount)
			WaitTimeAutoGem = Amount
		end	  
	})
        Tab:AddTextbox({
		Name = "Wait Time Auto Hoop",
		Default = "Amount",
		TextDisappear = false,
		Callback = function(Amount)
			WaitTimeAutoHoop = Amount
		end	  
	})
        Tab:AddTextbox({
		Name = "Wait Time Bug Pet",
		Default = "Amount",
		TextDisappear = false,
		Callback = function(Amount)
			WaitTimeBugPet = Amount
		end	  
	})
        Tab:AddTextbox({
		Name = "Wait Time Auto Rebirth",
		Default = "Amount",
		TextDisappear = false,
		Callback = function(Amount)
			WaitTimeAutoRebirth = Amount
		end	  
	})
        local Tab = Window:MakeTab({
		Name = "Teleport",
		Icon = "rbxassetid://4483345998",
		PremiumOnly = false
	})
        local Section = Tab:AddSection({
		Name = "Teleport"
	})
        Tab:AddButton({
		Name = "Highway Legends",
		Callback = function()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3682.60254, 71.5308151, 5592.50879, -0.0193620101, 3.62180188e-08, -0.999812543, 4.99353519e-08, 1, 3.52577771e-08, 0.999812543, -4.92433294e-08, -0.0193620101)
		end
	})
        Tab:AddButton({
		Name = "Snow City",
		Callback = function()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-866.386841, 4.00088787, 2165.70654, -0.499959469, -9.93534854e-08, -0.866048813, -4.44803661e-08, 1, -8.90424445e-08, 0.866048813, -5.99544503e-09, -0.499959469)
		end
	})
        Tab:AddButton({
		Name = "Magma City",
		Callback = function()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1616.82739, 4.05089617, 4330.65283, 7.86637156e-06, -4.15036254e-08, -1, -6.3789912e-08, 1, -4.15041264e-08, 1, 6.37902389e-08, 7.86637156e-06)
		end
	})
        Tab:AddButton({
		Name = "City",
		Callback = function()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-537.767456, 3.95088959, 386.226837, 1, 0, 0, 0, 1, 0, 0, 0, 1)
		end
	})
        local Tab = Window:MakeTab({
		Name = "Pets",
		Icon = "rbxassetid://4483345998",
		PremiumOnly = false
	})
        Tab:AddDropdown({
		Name = "Egg",
		Default = "Yellow Crystal",
	        Options = {"Yellow Crystal", "Blue Crystal", "Red Crystal", "Lightning Crystal", "Inferno Crystal", "Lava Crystal", "Snow Crystal", "Electro Legends Crystal", "Space Crystal", "Alien Crystal", "Electro Crystal", "Desert Crystal"},
                Callback = function(Egg)
                        SelectedEgg = Egg
		end
	})
        Tab:AddToggle({
                Name = "Auto Egg",
                Callback = function(Value)
                        getgenv().EggLoop = Value
                        while EggLoop do
                                game.ReplicatedStorage.rEvents.openCrystalRemote:InvokeServer("openCrystal", SelectedEgg)
                                task.wait()
                        end
                end
        })
        Tab:AddToggle({
                Name = "Bug Pet",
                Callback = function(Value)
                        getgenv().BugLoop = Value
                        while BugLoop do
                                for i = 1, 3 do
                                        game.ReplicatedStorage.rEvents.orbEvent:FireServer("collectOrb", "Yellow Orb", "City")
                                end
                                task.wait(WaitTimeBugPet)
                        end
                end
        })
        local Tab = Window:MakeTab({
		Name = "Misc",
		Icon = "rbxassetid://4483345998",
		PremiumOnly = false
	})
        Tab:AddToggle({
                Name = "Auto Rebirth",
                Callback = function(Value)
                        getgenv().RebirthLoop = Value
                        while RebirthLoop do
                                game.ReplicatedStorage.rEvents.rebirthEvent:FireServer("rebirthRequest")
                                task.wait()
                        end
                end
        })
        local Section = Tab:AddSection({
		Name = "Get Gem And Orb"
	})
        Tab:AddTextbox({
		Name = "Gem",
		Default = "Amount",
		TextDisappear = false,
		Callback = function(Amount)
			for i = 1, Amount do
                                game.ReplicatedStorage.rEvents.orbEvent:FireServer("collectOrb", "Gem", "City")
                        end
		end	  
	})
        Tab:AddTextbox({
		Name = "Orb",
		Default = "Amount",
		TextDisappear = false,
		Callback = function(Amount)
			for i = 1, Amount do
                                game.ReplicatedStorage.rEvents.orbEvent:FireServer("collectOrb", SelectedOrb, "City")
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
