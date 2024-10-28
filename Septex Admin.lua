if game.PlaceId == 155615604 and not game:FindFirstChild('Septex_Admin') then
local Prefix = ';'
local Folder = Instance.new("Folder",game)
Folder.Name = "Septex_Admin"
local ScreenGui = Instance.new("ScreenGui",game.Players.LocalPlayer:WaitForChild"PlayerGui")
ScreenGui.Name = "ScreenGui"
ScreenGui.ResetOnSpawn = false
local Frame = Instance.new("Frame",ScreenGui)
Frame.Name = "Frame"
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 1.000
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.5, 0, 0.899999998, 0)
Frame.Position = Frame.Position+UDim2.new(0,0,1.1,0)
Frame.Size = UDim2.new(0, 577, 0, 65)
local UICorner = Instance.new('UICorner',Frame)
UICorner.CornerRadius = UDim.new(0, 3)
local TextLabel = Instance.new("TextLabel",Frame)
TextLabel.Name = "TextLabel"
TextLabel.BackgroundColor3 = Color3.fromRGB(155, 155, 155)
TextLabel.Position = UDim2.new(0.0200897697, 0, 0.022615375, 0)
TextLabel.Size = UDim2.new(0.974358976, 0, 0.945454538, 0)
TextLabel.Text = ""
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
local UICorner_2 = Instance.new("UICorner",TextLabel)
UICorner_2.CornerRadius = UDim.new(0, 6)
local TextBox = Instance.new("TextBox",Frame)
TextBox.Name = "CommandBar"
TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox.BackgroundTransparency = 1.000
TextBox.BorderSizePixel = 0
TextBox.Position = UDim2.new(0.0359953903, 0, 0.128254473, 0)
TextBox.Size = UDim2.new(0, 519, 0, 46)
TextBox.Font = Enum.Font.SourceSans
TextBox.PlaceholderColor3 = Color3.fromRGB(205, 205, 205)
TextBox.PlaceholderText = "Press "..Prefix.." To Enter"
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.ClearTextOnFocus = false
TextBox.TextSize = 24.000
TextBox.TextTransparency = 0.140
TextBox.TextWrapped = true
Instance.new("UIStroke",TextLabel)
local Commands = Instance.new("TextLabel",ScreenGui)
Commands.Name = "Commands"
Commands.AnchorPoint = Vector2.new(0.5, 0.5)
Commands.BackgroundColor3 = Color3.fromRGB(58, 58, 58)
Commands.Position = UDim2.new(0.5, 0, 0.5, 0)
Commands.Size = UDim2.new(0, 455, 0, 357)
Commands.Text = ""
Commands.TextColor3 = Color3.fromRGB(255, 255, 255)
Commands.Visible = false
local UICorner_3 = Instance.new('UICorner',Commands)
UICorner_3.CornerRadius = UDim.new(0, 6)
Instance.new('UIStroke',Commands)
local CommandsList = Instance.new("ScrollingFrame",Commands)
CommandsList.Active = true
CommandsList.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CommandsList.BackgroundTransparency = 1.000
CommandsList.Position = UDim2.new(0, 0, 0.077441074, 0)
CommandsList.Size = UDim2.new(0, 455, 0, 274)
CommandsList.ScrollBarThickness = 5
CommandsList.AutomaticCanvasSize="Y"
local UIListLayout = Instance.new("UIListLayout",CommandsList)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 8)
local TEMP_CMD = Instance.new("TextLabel",Folder)
TEMP_CMD.BackgroundColor3 = Color3.fromRGB(72, 72, 72)
TEMP_CMD.BackgroundTransparency = 0.750
TEMP_CMD.Size = UDim2.new(0, 455, 0, 14)
TEMP_CMD.Font = Enum.Font.SourceSans
TEMP_CMD.Text = "sex"--//yes
TEMP_CMD.TextColor3 = Color3.fromRGB(255, 255, 255)
TEMP_CMD.TextSize = 14.000
SavedCmdsPosition = Commands.Position
local TextLabel_2 = Instance.new("TextLabel",Frame)
TextLabel_2.Name = "TextLabel_2"
TextLabel_2.BackgroundColor3 = Color3.fromRGB(58, 58, 58)
TextLabel_2.Position = UDim2.new(-0.132423401, 0, 0.0226149559, 0)
TextLabel_2.Size = UDim2.new(0.121672593, 0, 0.945454538, 0)
TextLabel_2.Text = ""
TextLabel_2.TextTransparency = 0.030
local UICorner_4 = Instance.new('UICorner',TextLabel_2)
UICorner_4.CornerRadius = UDim.new(0, 6)
Instance.new("UIStroke",TextLabel_2)
local CmdButton = Instance.new("ImageButton",TextLabel_2)
CmdButton.Name = "CmdButton"
CmdButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CmdButton.BackgroundTransparency = 1.000
CmdButton.Position = UDim2.new(0.298999995, 0, 0.27700001, 0)
CmdButton.Size = UDim2.new(0, 27, 0, 27)
CmdButton.Image = "rbxassetid://11570802781"
CmdButton.ImageTransparency = 0.430
CmdButton.MouseButton1Up:Connect(function()
	if Commands.Visible == false then
		Commands:TweenPosition(SavedCmdsPosition,"Out","Quart",1)
		Commands.Visible = true
	else
		Commands:TweenPosition(SavedCmdsPosition+UDim2.new(0,0,1,0),"Out","Quart",1)
		wait(.5)
		Commands.Visible = false
	end
end)
CmdButton.MouseEnter:Connect(function()
	CmdButton.ImageColor3 = Color3.new(0.588235, 0.588235, 0.588235)
end)
CmdButton.MouseLeave:Connect(function()
	CmdButton.ImageColor3 = Color3.new(1, 1, 1)
end)
local TextLabel = Instance.new("TextLabel",Commands)
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Size = UDim2.new(0, 455, 0, 17)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Commands List"
TextLabel.TextColor3 = Color3.fromRGB(234, 234, 234)
TextLabel.TextSize = 17.000
local plr,Player = game.Players.LocalPlayer,game.Players.LocalPlayer
local saved = workspace:FindFirstChild("Criminals Spawn").SpawnLocation.CFrame
local Unloaded = false
local Flinger = loadstring(game:HttpGet("https://github.com/NoobHubV1/RobloxScripts/raw/main/Flinger%20Lib.lua"))()
local States = {}
      States.AutoRespawn = true
      States.OldItemMethod = false
      States.AutoGuns = false
      States.AutoItems = false
      States.AutoRemoveff = false
      States.Autoguard = false
      States.Killaura = false
      States.CopyChat = false
      States.AntiFling = false
      States.ff = false
      States.Notify = false
      States.DraggableGuis = false
      States.AutoDumpCars = false
      States.Notify = false
      States.ChatNotify = false
      States.AntiTase = false
      States.ClickArrest = false
      States.ClickKill = false
      States.ArrestAura = false
      States.Infjump = false
      States.AntiTouch = false
      States.DoorsDestroy = false
      States.LoopCrim = false
      States.SilentAim = false
      States.DoorsDestroy = false
      States.anticrash = false
      States.OneShot = false
local API = {}
      API.Whitelisted = {}
      API.LoopmKilling = {}
      API.LoopCrim = {}
      API.LoopFling = {}
local CommandsAmount = 0
local Killcool1 = false

local CloneTXT = TEMP_CMD:Clone()
CloneTXT.Text = "kill / oof / die [plr,all,team] | Kill a player(s)"
CloneTXT.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_2 = TEMP_CMD:Clone()
CloneTXT_2.Text = "unload | Unload the script"
CloneTXT_2.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_3 = TEMP_CMD:Clone()
CloneTXT_3.Text = "bring [plr] | bring the player"
CloneTXT_3.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_4 = TEMP_CMD:Clone()
CloneTXT_4.Text = "whitelist / wl | Whitelisted the player"
CloneTXT_4.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_5 = TEMP_CMD:Clone()
CloneTXT_5.Text = "unwhitelist / unwl | Blacklisted the player"
CloneTXT_5.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_6 = TEMP_CMD:Clone()
CloneTXT_6.Text = "re / refresh | respawn character and save position"
CloneTXT_6.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_7 = TEMP_CMD:Clone()
CloneTXT_7.Text = "autore / autorespawn [on/off] | Auto respawn character (if dead) and auto save position"
CloneTXT_7.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_8 = TEMP_CMD:Clone()
CloneTXT_8.Text = "inmate | Changed team inmate"
CloneTXT_8.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_9 = TEMP_CMD:Clone()
CloneTXT_9.Text = "guard | Changed team guard"
CloneTXT_9.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_10 = TEMP_CMD:Clone()
CloneTXT_10.Text = "criminal / crim [ME,PLAYER] | Changed player to team criminal"
CloneTXT_10.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_11 = TEMP_CMD:Clone()
CloneTXT_11.Text = "olditemmethod / oldimethod [on,off] | Teleports to get item"
CloneTXT_11.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_12 = TEMP_CMD:Clone()
CloneTXT_12.Text = "prefix [NEW PREFIX] | Sets a different prefix"
CloneTXT_12.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_13 = TEMP_CMD:Clone()
CloneTXT_13.Text = "pp | sus"
CloneTXT_13.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_14 = TEMP_CMD:Clone()
CloneTXT_14.Text = "damage / dmg [plr,all,team] [Amount] | Damages a player(s)"
CloneTXT_14.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_15 = TEMP_CMD:Clone()
CloneTXT_15.Text = "autoguns / aguns [ON/OFF] | Auto Get All Guns (if dead)"
CloneTXT_15.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_16 = TEMP_CMD:Clone()
CloneTXT_16.Text = "autoitems / aitems [ON/OFF] | Auto Get All Items (if died)"
CloneTXT_16.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_17 = TEMP_CMD:Clone()
CloneTXT_17.Text = "autoremoveff / autorff [ON/OFF] | Auto delete forcefield (if dead)"
CloneTXT_17.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_18 = TEMP_CMD:Clone()
CloneTXT_18.Text = "allcmds | tells you the amount of commands septex admin has"
CloneTXT_18.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_19 = TEMP_CMD:Clone()
CloneTXT_19.Text = "autoguard / aguard [ON/OFF] | Auto Team guard"
CloneTXT_19.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_20 = TEMP_CMD:Clone()
CloneTXT_20.Text = "killaura [on/off] | Activate kill aura"
CloneTXT_20.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_21 = TEMP_CMD:Clone()
CloneTXT_21.Text = "copychat [on/off] | Copy chat everyone"
CloneTXT_21.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_22 = TEMP_CMD:Clone()
CloneTXT_22.Text = "notify [on/off] | Notify player join and leave and pick up and died and respawn!"
CloneTXT_22.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_23 = TEMP_CMD:Clone()
CloneTXT_23.Text = "antifling [ON/OFF] | Activate antifling"
CloneTXT_23.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_24 = TEMP_CMD:Clone()
CloneTXT_24.Text = "infjump [ON/OFF] | Infinite jumps"
CloneTXT_24.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_25 = TEMP_CMD:Clone()
CloneTXT_25.Text = "forcefield / ff [on/off] | Activate forcefield"
CloneTXT_25.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_26 = TEMP_CMD:Clone()
CloneTXT_26.Text = "arrest [plr,all] | Arrests the targeted player"
CloneTXT_26.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_27 = TEMP_CMD:Clone()
CloneTXT_27.Text = "meleekill / mk / mkill [plr,all,team] | Teleports to kill player(s)"
CloneTXT_27.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_28 = TEMP_CMD:Clone()
CloneTXT_28.Text = "tp [plr1] [plr2] | Teleports player1 to player2"
CloneTXT_28.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_29 = TEMP_CMD:Clone()
CloneTXT_29.Text = "speed / ws [number] | Changed speed to number"
CloneTXT_29.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_30 = TEMP_CMD:Clone()
CloneTXT_30.Text = "btools | Get a btools"
CloneTXT_30.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_31 = TEMP_CMD:Clone()
CloneTXT_31.Text = "shotgun / rem / remington | Obtain remington 870"
CloneTXT_31.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_32 = TEMP_CMD:Clone()
CloneTXT_32.Text = "ak / ak-47 | obtain ak-47"
CloneTXT_32.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_33 = TEMP_CMD:Clone()
CloneTXT_33.Text = "m9 / pistol | obtain m9"
CloneTXT_33.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_34 = TEMP_CMD:Clone()
CloneTXT_34.Text = "m4 / m4a1 | Obtain m4a1"
CloneTXT_34.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_35 = TEMP_CMD:Clone()
CloneTXT_35.Text = "guns | Obtain all guns"
CloneTXT_35.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_36 = TEMP_CMD:Clone()
CloneTXT_36.Text = "items | Obtain all items"
CloneTXT_36.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_37 = TEMP_CMD:Clone()
CloneTXT_37.Text = "hammer / ham | Obtain hammer"
CloneTXT_37.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_38 = TEMP_CMD:Clone()
CloneTXT_38.Text = "knife / knive | Obtain Crude Knife"
CloneTXT_38.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_39 = TEMP_CMD:Clone()
CloneTXT_39.Text = "food | Obtain Breakfast / Lunch / Dinner"
CloneTXT_39.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_40 = TEMP_CMD:Clone()
CloneTXT_40.Text = "drag | draggable the Text Command"
CloneTXT_40.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_41 = TEMP_CMD:Clone()
CloneTXT_41.Text = "autodumpcars / autodeletecars / autonocars [on/off] | Auto Remove car (if cmd "..Prefix.."bring)"
CloneTXT_41.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_42 = TEMP_CMD:Clone()
CloneTXT_42.Text = "opengate | Open the gate"
CloneTXT_42.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_43 = TEMP_CMD:Clone()
CloneTXT_43.Text = "nex / nexus"
CloneTXT_43.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_44 = TEMP_CMD:Clone()
CloneTXT_44.Text = "yard | Teleports to location"
CloneTXT_44.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_45 = TEMP_CMD:Clone()
CloneTXT_45.Text = "gas | Teleports to location"
CloneTXT_45.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_46 = TEMP_CMD:Clone()
CloneTXT_46.Text = "roof"
CloneTXT_46.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_47 = TEMP_CMD:Clone()
CloneTXT_47.Text = "respawn / res | Respawn Character and not save position"
CloneTXT_47.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_48 = TEMP_CMD:Clone()
CloneTXT_48.Text = "getplayer [all,team] | tells you the server to player(s)"
CloneTXT_48.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_49 = TEMP_CMD:Clone()
CloneTXT_49.Text = "noclip [ON/OFF] | Go through walls"
CloneTXT_49.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_50 = TEMP_CMD:Clone()
CloneTXT_50.Text = "chatnotify [on/off] | Chat everyone player joined and left and pick up and died and respawn!"
CloneTXT_50.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_51 = TEMP_CMD:Clone()
CloneTXT_51.Text = "view [player] | Watches the selected target"
CloneTXT_51.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_52 = TEMP_CMD:Clone()
CloneTXT_52.Text = "unview | Unwatches the selected target"
CloneTXT_52.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_53 = TEMP_CMD:Clone()
CloneTXT_53.Text = "cmds | Toggles commands gui"
CloneTXT_53.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_54 = TEMP_CMD:Clone()
CloneTXT_54.Text = "rejoin / rj | rejoins the same server (UNLOADS SCRIPT)"
CloneTXT_54.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_55 = TEMP_CMD:Clone()
CloneTXT_55.Text = "doorsdestroy / nodoors [ON/OFF] | Destroy the doors"
CloneTXT_55.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_56 = TEMP_CMD:Clone()
CloneTXT_56.Text = "removecars / nocars / dumpcars | deletes all cars that are not seated"
CloneTXT_56.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_57 = TEMP_CMD:Clone()
CloneTXT_57.Text = "antisit [on/off] | Activate antisit"
CloneTXT_57.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_58 = TEMP_CMD:Clone()
CloneTXT_58.Text = "antitase / notase [on/off] | Activate taser bypass"
CloneTXT_58.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_59 = TEMP_CMD:Clone()
CloneTXT_59.Text = "clickkill [on/off] | click on someone to kill them"
CloneTXT_59.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_60 = TEMP_CMD:Clone()
CloneTXT_60.Text = "clickarrest [on/off] | click on someone to arrest them"
CloneTXT_60.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_61 = TEMP_CMD:Clone()
CloneTXT_61.Text = "arrestaura [on/off] | Arrests anyone close to you"
CloneTXT_61.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_62 = TEMP_CMD:Clone()
CloneTXT_62.Text = "antitouch [on/off] | Kills anyone who touches you"
CloneTXT_62.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_63 = TEMP_CMD:Clone()
CloneTXT_63.Text = "meleelk / mlk [plr,all,team] | Auto teleports to kill player(s)"
CloneTXT_63.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_64 = TEMP_CMD:Clone()
CloneTXT_64.Text = "unmeleelk / unmlk [plr,all,team] | Stopped auto teleports to kill player(s)"
CloneTXT_64.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_65 = TEMP_CMD:Clone()
CloneTXT_65.Text = "crimbase / cbase [player] | Teleports to location"
CloneTXT_65.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_66 = TEMP_CMD:Clone()
CloneTXT_66.Text = "car | Brings a car to you"
CloneTXT_66.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_67 = TEMP_CMD:Clone()
CloneTXT_67.Text = "loopcrim / loopcriminal [me,player] | Auto make player a criminal team."
CloneTXT_67.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_68 = TEMP_CMD:Clone()
CloneTXT_68.Text = "unloopcrim / unloopcriminal [me,player] | Stopped auto make player a criminal team."
CloneTXT_68.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_69 = TEMP_CMD:Clone()
CloneTXT_69.Text = "tase [plr,all,team] | Taser the player(s)."
CloneTXT_69.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_70 = TEMP_CMD:Clone()
CloneTXT_70.Text = "void [plr] | Teleports player to a void"
CloneTXT_70.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_71 = TEMP_CMD:Clone()
CloneTXT_71.Text = "silentaim / saim [ON/OFF] | Shoot Player and dont miss"
CloneTXT_71.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_72 = TEMP_CMD:Clone()
CloneTXT_72.Text = "keycard / key / givekey | Obtain keycard"
CloneTXT_72.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_73 = TEMP_CMD:Clone()
CloneTXT_73.Text = "addnuke / nuke [me,plr] | target dies everyone dies"
CloneTXT_73.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_74 = TEMP_CMD:Clone()
CloneTXT_74.Text = "fling [plr,all,team] | Fling the player(s)"
CloneTXT_74.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_75 = TEMP_CMD:Clone()
CloneTXT_75.Text = "anticrash [on/off] | Tries to stop simple crashes (DOESNT WORK WITH SEPTEX ADMIN CRASH)"
CloneTXT_75.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_76 = TEMP_CMD:Clone()
CloneTXT_76.Text = "loopfling / lfling [plr,all,team] | LoopFling the player(s)"
CloneTXT_76.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_77 = TEMP_CMD:Clone()
CloneTXT_77.Text = "unloopfling / unlfling [plr,all,team] | Stopped LoopFling the player(s)"
CloneTXT_77.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
local CloneTXT_78 = TEMP_CMD:Clone()
CloneTXT_78.Text = "oneshot [ON/OFF] | Make a gun to oneshot"
CloneTXT_78.Parent = CommandsList
CommandsAmount = CommandsAmount + 1
function CreateBulletTable(Bullet, PartAndPlr)
	local Args = {}
	for i =1,Bullet do
		Args[#Args + 1] = {
			["RayObject"] = Ray.new(Vector3.new(), Vector3.new()),
			["Hit"] = PartAndPlr,
		}
	end
	return Args
end
function Title(Text)
	return Player.PlayerGui['Home']['hud']['Topbar']['titleBar'].Title.Text:lower() == Text
end
function DragifyGui(Frame,Is)
	coroutine.wrap(function()
		local dragToggle = nil
		local dragSpeed = 5
		local dragInput = nil
		local dragStart = nil
		local dragPos = nil
		local startPos = nil
		local function updateInput(input)
			if not Is then
				if not States.DraggableGuis then
					return
				end
			end
			local Delta = input.Position - dragStart
			local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
			game:GetService("TweenService"):Create(Frame, TweenInfo.new(0.30), {Position = Position}):Play()
		end
		Frame.InputBegan:Connect(function(input)
			if not Is then
				if States.DraggableGuis then
					if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and game:GetService("UserInputService"):GetFocusedTextBox() == nil then
						dragToggle = true
						dragStart = input.Position
						startPos = Frame.Position
						input.Changed:Connect(function()
							if input.UserInputState == Enum.UserInputState.End then
								dragToggle = false
							end
						end)
					end
				end
			end
		end)
		Frame.InputChanged:Connect(function(input)
			if States.DraggableGuis then
				if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
					dragInput = input
				end
			end
		end)
		game:GetService("UserInputService").InputChanged:Connect(function(input)
			if States.DraggableGuis then
				if input == dragInput and dragToggle then
					updateInput(input)
				end
			end
		end)
	end)()
end
DragifyGui(Frame)
DragifyGui(Commands)
DragifyGui(TextLabel_2)
function swait()
	game:GetService("RunService").Stepped:Wait()
end

function UnSit()
  plr.Character.Humanoid.Sit = false
end

function ConvertPosition(Position)
	if typeof(Position):lower() == "position" then
		return CFrame.new(Position)
	else
		return Position
	end
end

function GetPart(Target)
	game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart")

	return Target.Character:FindFirstChild("HumanoidRootPart") or Target.Character:FindFirstChild("Head") or Target.Character:FindFirstChildOfClass("Humanoid")
end
function GetPosition(Player)
	game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart")

	if Player then
		return GetPart(Player).CFrame
	elseif not Player then
		return GetPart(plr).CFrame
	end
end
function GetCameraPosition(Player)
	return workspace["CurrentCamera"].CFrame
end
function Loop(Times, calling)
	for i = 1, tonumber(Times) do
		calling()
	end
end

function MoveTo(Cframe)
	Cframe = ConvertPosition(Cframe)
	local Amount = 5
	if Player.PlayerGui['Home']['hud']['Topbar']['titleBar'].Title.Text:lower() == "lights out" or Player.PlayerGui.Home.hud.Topbar.titleBar.Title.Text:lower() == "lightsout" then
		Amount = 10
	end
	for i = 1, Amount do task.wait()
		UnSit()
		Player.Character:WaitForChild("HumanoidRootPart").CFrame = Cframe
	end
end
function WaitForRespawn(Cframe,NoForce)
	game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart")

	local Cframe = ConvertPosition(Cframe)
	local CameraCframe = GetCameraPosition()
	coroutine.wrap(function()
		local a
		a = Player.CharacterAdded:Connect(function(NewCharacter)
			pcall(function()
				coroutine.wrap(function()
					workspace.CurrentCamera:GetPropertyChangedSignal("CFrame"):Wait()
					Loop(2, function()
						workspace["CurrentCamera"].CFrame = CameraCframe
					end)
				end)()
				NewCharacter:WaitForChild("HumanoidRootPart")
				local Amount = 7
				if Title("lights out") then
					Amount = 12
				end
				for i = 1,Amount do
					UnSit()
					NewCharacter:WaitForChild("HumanoidRootPart").CFrame = Cframe
					swait()
				end
			end)
			a:Disconnect()
			Cframe = nil
		end)
		task.spawn(function()
			wait(2)
			if a then
				a:Disconnect()
			end
		end)
	end)()
end
function GuardsFull(a)
  if a == "b" then
    return #game.Teams.Guards:GetPlayers() == 8 and plr.Team == game.Teams.Guards
  elseif a == "c" then
    return #game.Teams.Guards:GetPlayers() == 8 and plr.Team ~= game.Teams.Guards
  end
end
function ChangeTeam(TeamPath,NoForce,Pos)
	if TeamPath == game.Teams.Inmates then
		pcall(function()
		repeat task.wait() until game:GetService("Players").LocalPlayer.Character
			game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart")

			WaitForRespawn(Pos or GetPosition(),NoForce)
		end)
		workspace.Remote.TeamEvent:FireServer("Bright orange")
	elseif TeamPath == game.Teams.Guards then
		if GuardsFull("b") then
			pcall(function()
			repeat task.wait() until game:GetService("Players").LocalPlayer.Character
				game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart")

				WaitForRespawn(Pos or GetPosition(),NoForce)
			end)
			workspace.Remote.TeamEvent:FireServer("Bright orange")
			plr.CharacterAdded:Wait()
			pcall(function()
			repeat task.wait() until game:GetService("Players").LocalPlayer.Character
				game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart")

				WaitForRespawn(Pos or GetPosition(),NoForce)
			end)
			repeat wait()
				workspace.Remote.TeamEvent:FireServer("Bright blue")
			until plr.Team == game.Teams.Guards
		else
			pcall(function()
			repeat task.wait() until game:GetService("Players").LocalPlayer.Character
				game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart")

				WaitForRespawn(Pos or GetPosition(),NoForce)
			end)
			workspace.Remote.TeamEvent:FireServer("Bright blue")
		end
	elseif TeamPath == game.Teams.Criminals then
		if Player.Team == game.Teams.Inmates then
			repeat task.wait()
				plr.Character.Head.CanCollide = false
				workspace["Criminals Spawn"].SpawnLocation.CFrame = plr.Character.Head.CFrame
			until plr.Team == game.Teams.Criminals
			workspace["Criminals Spawn"].SpawnLocation.CFrame = saved
		elseif plr.Team == game.Teams.Guards then
			pcall(function()
			repeat task.wait() until game:GetService("Players").LocalPlayer.Character
				game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart")

				WaitForRespawn(Pos or GetPosition(),NoForce)
			end)
			repeat task.wait()
				plr.Character.Head.CanCollide = false
				workspace["Criminals Spawn"].SpawnLocation.CFrame = plr.Character.Head.CFrame
			until plr.Team == game.Teams.Criminals
			workspace["Criminals Spawn"].SpawnLocation.CFrame = saved
		elseif Player.Team == game.Teams.Criminals then
		if GuardsFull("c") then
			pcall(function()
			repeat task.wait() until game:GetService("Players").LocalPlayer.Character
				game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart")

				WaitForRespawn(Pos or GetPosition(),NoForce)
			end)
			workspace.Remote.TeamEvent:FireServer("Bright orange")
			plr.CharacterAdded:Wait()
			repeat task.wait()
				plr.Character.Head.CanCollide = false
				workspace["Criminals Spawn"].SpawnLocation.CFrame = plr.Character.Head.CFrame
			until plr.Team == game.Teams.Criminals
			workspace["Criminals Spawn"].SpawnLocation.CFrame = saved
		else
			pcall(function()
			repeat task.wait() until game:GetService("Players").LocalPlayer.Character
				game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart")

				WaitForRespawn(Pos or GetPosition(),NoForce)
			end)
			workspace.Remote.TeamEvent:FireServer("Bright blue")
			plr.CharacterAdded:Wait()
			pcall(function()
			repeat task.wait() until game:GetService("Players").LocalPlayer.Character
				game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart")

				WaitForRespawn(Pos or GetPosition(),NoForce)
			end)
			repeat task.wait()
				plr.Character.Head.CanCollide = false
				workspace["Criminals Spawn"].SpawnLocation.CFrame = plr.Character.Head.CFrame
			until plr.Team == game.Teams.Criminals
				workspace["Criminals Spawn"].SpawnLocation.CFrame = saved
		end
		end
	elseif TeamPath == game.Teams.Neutral then
		workspace.Remote.TeamEvent:FireServer("Medium stone grey")
	end
end
function Refresh()
  ChangeTeam(plr.Team)
end
function GetGun(Item, Ignore)
	if Unloaded then
		return
	end
	if States.OldItemMethod == false then
		task.spawn(function()
			if not plr.Character:FindFirstChild(Item) or not plr.Backpack:FindFirstChild(Item) then
				workspace:FindFirstChild("Remote")['ItemHandler']:InvokeServer({
					Position = Player.Character.Head.Position,
					Parent = workspace.Prison_ITEMS.giver:FindFirstChild(Item, true)
			        })
			end
		end)
	else
		if not plr.Character:FindFirstChild(Item) or not plr.Backpack:FindFirstChild(Item) then
			local LastPosition = GetPosition()
			repeat task.wait()
				coroutine.wrap(function()
					UnSit()
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Prison_ITEMS.giver:FindFirstChild(Item).ITEMPICKUP.CFrame
					workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver:FindFirstChild(Item).ITEMPICKUP)
				end)()
			until plr.Character:FindFirstChild(Item) or plr.Backpack:FindFirstChild(Item)
			MoveTo(LastPosition)
		end
	end
end
function GetSingle(Item, Ignore)
	if Unloaded then
		return 
	end
	if States.OldItemMethod == false then
		task.spawn(function()
			if not plr.Character:FindFirstChild(Item) or not plr.Backpack:FindFirstChild(Item) then
				workspace:FindFirstChild("Remote")['ItemHandler']:InvokeServer({
					Position = Player.Character.Head.Position,
				        Parent = workspace.Prison_ITEMS.single:FindFirstChild(Item, true)
			        })
			end
		end)
	else
		if not plr.Character:FindFirstChild(Item) or not plr.Backpack:FindFirstChild(Item) then
			local LastPosition = GetPosition()
			repeat task.wait()
				UnSit()
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Prison_ITEMS.single:FindFirstChild(Item).ITEMPICKUP.CFrame
				coroutine.wrap(function()
					workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.single:FindFirstChild(Item).ITEMPICKUP)
				end)()
			until plr.Character:FindFirstChild(Item) or plr.Backpack:FindFirstChild(Item)
			MoveTo(LastPosition)
		end
	end
end
function KillPlayer(Target,Hit,Failed,DoChange)
	Bullets = CreateBulletTable(Hit, Target.Character:FindFirstChild("Head"))
	if not Target or not Target.Character or not Target.Character:FindFirstChildOfClass("Humanoid") or Target.Character:FindFirstChildOfClass("Humanoid").Health <1 then
		return
	end
	repeat swait() until not Target.Character:FindFirstChildOfClass("ForceField")
	local CurrentTeam = nil
	local Gun = Player.Backpack:FindFirstChild("AK-47") or Player.Character:FindFirstChild("AK-47")
	if Target.Team == Player.Team then
		if Target.Team~= game.Teams.Criminals then
			CurrentTeam = Player.Team
			ChangeTeam(game.Teams.Criminals,true)
		elseif Target.Team == game.Teams.Criminals then
			CurrentTeam = Player.Team
			ChangeTeam(game.Teams.Inmates,true)
			plr.CharacterAdded:Wait()
		end
	end
	repeat task.wait() GetGun("AK-47") Gun = Player.Backpack:FindFirstChild("AK-47") or Player.Character:FindFirstChild("AK-47") until Gun
	task.spawn(function()
		game:GetService("ReplicatedStorage").ShootEvent:FireServer(Bullets, Gun)
		game:GetService("ReplicatedStorage").ReloadEvent:FireServer(Gun)
	end)
	coroutine.wrap(function()
		wait(.7)
		pcall(function()
			if Target.Character:FindFirstChildOfClass("Humanoid").Health >1 and not Failed then
				KillPlayer(Target,Bullet,true)
			end
		end)
	end)()
	if CurrentTeam and not Player.Team == CurrentTeam and not DoChange then
		wait(.3)
		ChangeTeam(CurrentTeam,true)
	end
end
function FindPlayer(String,IgnoreError)
	if String == "random" then
		return game.Players:GetPlayers()[math.random(#game.Players:GetPlayers())]
	else
		String = String:gsub("%s+", "")
		for _, v in pairs(game:GetService("Players"):GetPlayers()) do
			 if v.Name:lower():match("^" .. String:lower()) or v.DisplayName:lower():match("^" .. String:lower()) then
				return v
		         end
	        end
	        if not IgnoreError then
		         Notif("Error", "Player has left or is not in your current game.", 3)
	        end
	        return nil
	end
end
function killall(TeamToKill,Hit)
        if TeamToKill == "all" then
		local LastTeam = Player.Team
		local Hits = {}
		local Gun = Player.Backpack:FindFirstChild("AK-47") or Player.Character:FindFirstChild("AK-47")
		if LastTeam ~= game.Teams.Criminals then
			ChangeTeam(game.Teams.Criminals)
		end
		for i,v in pairs(game.Players:GetPlayers()) do
			if v and v ~= game.Players.LocalPlayer and not table.find(API.Whitelisted,v) and v ~= nil and v.Team == game.Teams.Inmates or v.Team == game.Teams.Guards then
				if not v.Character and not v.Character.Head and not v.Character.Humanoid <1 or not v.Character:FindFirstChild("ForceField") then
					for i =1,Hit do
					       Hits[#Hits + 1] = {
							["RayObject"] = Ray.new(Vector3.new(), Vector3.new()),
							["Hit"] = v.Character:FindFirstChild("Head"),
						}
					end
				end
			end
		end
		repeat task.wait() GetGun("AK-47") Gun = Player.Backpack:FindFirstChild("AK-47") or Player.Character:FindFirstChild("AK-47") until Gun
		task.spawn(function()
			game:GetService("ReplicatedStorage").ShootEvent:FireServer(Hits, Gun)
			game:GetService("ReplicatedStorage").ReloadEvent:FireServer(Gun)
		end)
		ChangeTeam(game.Teams.Inmates)
		plr.CharacterAdded:Wait()
		repeat task.wait() GetGun("AK-47") Gun = Player.Backpack:FindFirstChild("AK-47") or Player.Character:FindFirstChild("AK-47") until Gun
		local Hits = {}
		for i,v in pairs(game.Teams.Criminals:GetPlayers()) do
			if v and v ~= game.Players.LocalPlayer and not table.find(API.Whitelisted,v) and v ~= nil then
				if not v.Character and not v.Character.Head and not v.Character.Humanoid <1 or not v.Character:FindFirstChild("ForceField") then
					for i =1,Hit do
					       Hits[#Hits + 1] = {
							["RayObject"] = Ray.new(Vector3.new(), Vector3.new()),
							["Hit"] = v.Character:FindFirstChild("Head"),
						}
					end
				end
			end
		end
		task.spawn(function()
			game:GetService("ReplicatedStorage").ShootEvent:FireServer(Hits, Gun)
		        game:GetService("ReplicatedStorage").ReloadEvent:FireServer(Gun)
		end)
	end
	if TeamToKill == game.Teams.Inmates or TeamToKill == game.Teams.Guards then
		if Player.Team ~= game.Teams.Criminals then
			ChangeTeam(game.Teams.Criminals)
		end
	elseif TeamToKill == game.Teams.Criminals then
		if Player.Team ~= game.Teams.Inmates then
			ChangeTeam(game.Teams.Inmates)
			plr.CharacterAdded:Wait()
		end
	end
	repeat task.wait() GetGun("AK-47") Gun = Player.Backpack:FindFirstChild("AK-47") or Player.Character:FindFirstChild("AK-47") until Gun
	local Gun = Player.Backpack:FindFirstChild("AK-47") or Player.Character:FindFirstChild("AK-47")
	local Hits = {}
	for i,v in pairs(TeamToKill:GetPlayers()) do
		if v and v~=Player and not table.find(API.Whitelisted,v) and not v.Character.Humanoid.Health == 0 or not v.Character:FindFirstChild("ForceField") then
			for i =1,Hit do
				Hits[#Hits + 1] = {
					["RayObject"] = Ray.new(Vector3.new(), Vector3.new()),
					["Hit"] = v.Character:FindFirstChild("Head"),
				}
			end
		end
	end
	
	task.spawn(function()
		game:GetService("ReplicatedStorage").ShootEvent:FireServer(Hits, Gun)
		game:GetService("ReplicatedStorage").ReloadEvent:FireServer(Gun)
	end)
end
function AllGuns()
	local saved = game:GetService("Players").LocalPlayer.Character:GetPrimaryPartCFrame()
	if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(plr.UserId, 96651) then
		GetGun("M4A1", true)
	end
	GetGun("AK-47", true)
	task.spawn(function()
		GetGun("Remington 870", true)
	end)
	GetGun("M9", true)
	game:GetService("Players").LocalPlayer.Character:SetPrimaryPartCFrame(saved)
end
function AllItems()
        local saved = game:GetService("Players").LocalPlayer.Character:GetPrimaryPartCFrame()
	if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(plr.UserId, 96651) then
		GetGun("M4A1", true)
	end
	GetGun("AK-47", true)
	task.spawn(function()
		GetGun("Remington 870", true)
	end)
	GetGun("M9", true)
	pcall(function()
		GetSingle("Hammer", true)
	end)
	GetSingle("Crude Knife")
	game:GetService("Players").LocalPlayer.Character:SetPrimaryPartCFrame(saved)
end
function Notif(Title, Text, Time)
  game:GetService("StarterGui"):SetCore("SendNotification", {Title = Title, Text = Text, Duration = Time,})
end
local ChangeState = function(Type,StateType)
	local Value = nil
	if Type and typeof(Type):lower() == "string" and (Type):lower() == "on" then
		Value = true
	elseif Type and typeof(Type):lower() == "string" and (Type):lower() == "off" then
		Value = false
	elseif typeof(Type):lower() == "boolean" then
		Value = Type
	else
		Value = not States[StateType]
	end
	States[StateType] = Value
	Notif("OK", StateType.." has been changed to "..tostring(Value), 3)
	return Value
end
function bring(Target,TeleportTo,MoreTP)
	if not IsBringing and Target and Target.Character:FindFirstChildOfClass("Humanoid") and Target.Character:FindFirstChildOfClass("Humanoid").Health>0 and Target.Character:FindFirstChildOfClass("Humanoid").Sit == false then
		if not TeleportTo then
			TeleportTo = GetPosition()
		end
		local Orgin = GetPosition()
		local CarPad = workspace.Prison_ITEMS.buttons["Car Spawner"]
		local car = nil
		local Seat = nil
		local Failed = false
		local CheckForBreak = function()
			if not Target or not Target.Character:FindFirstChildOfClass("Humanoid") or Target.Character:FindFirstChildOfClass("Humanoid").Health<1 or Player.Character:FindFirstChildOfClass("Humanoid").Health<1 then
				Failed = true
				return true
			else
				return nil
			end
		end

		for i,v in pairs(game:GetService("Workspace").CarContainer:GetChildren()) do
			if v then
				if v:WaitForChild("Body"):WaitForChild("VehicleSeat").Occupant == nil then
					car = v
				end
			end
		end
		if not car then
			coroutine.wrap(function()
				if not car then
					car = game:GetService("Workspace").CarContainer.ChildAdded:Wait()
				end
			end)()
			repeat task.wait()
				MoveTo(game:GetService("Workspace").Prison_ITEMS.buttons:GetChildren()[7]["Car Spawner"].CFrame)
				task.spawn(function()
					workspace.Remote.ItemHandler:InvokeServer(game:GetService("Workspace").Prison_ITEMS.buttons:GetChildren()[7]["Car Spawner"])
				end)
				if CheckForBreak() then
					break
				end
			until car
		end
		car:WaitForChild("Body"):WaitForChild("VehicleSeat")
		car.PrimaryPart = car.Body.VehicleSeat
		Seat = car.Body.VehicleSeat
		repeat task.wait()
			Seat:Sit(Player.Character:FindFirstChildOfClass("Humanoid"))
		until Player.Character:FindFirstChildOfClass("Humanoid").Sit == true
		wait() --// so it doesnt break
		repeat task.wait()
			if CheckForBreak() or not Player.Character:FindFirstChildOfClass("Humanoid") or Player.Character:FindFirstChildOfClass("Humanoid").Sit == false then
				break
			end
			car.PrimaryPart = car.Body.VehicleSeat
			if Target.Character:FindFirstChildOfClass("Humanoid").MoveDirection.Magnitude >0 then
				car:SetPrimaryPartCFrame(Target.Character:GetPrimaryPartCFrame()*CFrame.new(0,-.2,-6))
			else
				car:SetPrimaryPartCFrame(Target.Character:GetPrimaryPartCFrame()*CFrame.new(0,-.2,-5))
			end
		until Target.Character:FindFirstChildOfClass("Humanoid").Sit == true
		if Failed then
			Notif("Error", "Failed to bring the player!", 3)
			TextBox.Text = ""
			return
		end
		for i =1,10 do task.wait()
			car:SetPrimaryPartCFrame(TeleportTo)
		end
		wait(.1)
		task.spawn(function()
			if States.AutoDumpCars and not Unloaded then
				repeat wait() until Target.Character:FindFirstChildOfClass("Humanoid").Sit == false
				repeat wait()
					Seat:Sit(Player.Character:FindFirstChildOfClass("Humanoid"))
				until Player.Character:FindFirstChildOfClass("Humanoid").Sit == true
				for i =1,10 do
					car:SetPrimaryPartCFrame(CFrame.new(30, 30, 30))
					swait()
				end
				UnSit()
				MoveTo(Orgin)
			elseif not States.AutoDumpCars and Unloaded == false then
				UnSit()
				MoveTo(Orgin)
			end
		end)
	else
		Notif("Error", "Player has died or is sitting or an unknown error.", 3)
		TextBox.Text = ""
	end
end
function BadArea(Target)
	local mod = require(game.ReplicatedStorage["Modules_client"]["RegionModule_client"])
	local a = pcall(function()
		if mod.findRegion(Target.Character) then
			mod = mod.findRegion(Target.Character)["Name"]
		end
	end)
	if not a then
		return
	end
	for i, v in pairs(game:GetService("ReplicatedStorage").PermittedRegions:GetChildren()) do
		if v and mod == v.Value then
			return false
		end
	end
	return true
end
function Chat(msg)
	game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "all")
end
function MeleeEvent(Targ)
	game.ReplicatedStorage.meleeEvent:FireServer(Targ)
end
function Meleekill(Tar)
	if not Tar.Character.Humanoid.Health == 0 or not Tar.Character:FindFirstChild("ForceField") then
		local Orgin = GetPosition()
		repeat task.wait()
			UnSit()
			GetPart(plr).CFrame = GetPart(Tar).CFrame
			MeleeEvent(Tar)
		until Tar.Character.Humanoid.Health < 5
		UnSit()
		GetPart(plr).CFrame = Orgin
	end
end
function IsTeamCommandCheck(String)
	for i,v in pairs(game:GetService("Teams"):GetChildren()) do
		if v and v.Name:lower() == String:lower() then
			return v
		end
	end
	return nil
end
function Destroy(parent)
	parent:Destroy()
	pcall(function()
		parent:Remove()
	end)
end
function Tase(Targ)
	local Oldt = Player.Team
	if Oldt ~= game.Teams.Guards then
		ChangeTeam(game.Teams.Guards)
		plr.CharacterAdded:Wait()
	end
	repeat task.wait() until Player.Backpack:FindFirstChild("Taser")
	local ohTable1 = {
		[1] = {
		["RayObject"] = Ray.new(Vector3.new(), Vector3.new()),
		["Distance"] = 0,
		["Cframe"] = CFrame.new(),
		["Hit"] = Targ.Character.Head
		}
	}
	local ohInstance2 = game:GetService("Players").LocalPlayer.Backpack.Taser

	game:GetService("ReplicatedStorage").ShootEvent:FireServer(ohTable1, ohInstance2)
	task.spawn(function()
		game:GetService("ReplicatedStorage").ReloadEvent:FireServer(game:GetService("Players").LocalPlayer.Backpack.Taser)
	end)
	ChangeTeam(Oldt)
end
function TaseTeam(Team)
	local Oldt = Player.Team
	if Oldt ~= game.Teams.Guards then
		ChangeTeam(game.Teams.Guards)
		plr.CharacterAdded:Wait()
	end
	repeat task.wait() until Player.Backpack:FindFirstChild("Taser")
	local ohTable1 = {}
	for i,v in pairs(game:GetService("Players"):GetPlayers()) do
		if v and v~= Player and v.Team ~= game.Teams.Guards and v.Team == Team then
			table.insert(ohTable1, {
				["RayObject"] = Ray.new(Vector3.new(), Vector3.new()),
				["Distance"] = -1,
				["Cframe"] = CFrame.new(),
				["Hit"] = v.Character.Head
			})
		end
	end
	local ohInstance2 = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Taser") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Taser")
	game:GetService("ReplicatedStorage").ShootEvent:FireServer(ohTable1, ohInstance2)
	task.spawn(function()
		game:GetService("ReplicatedStorage").ReloadEvent:FireServer(game:GetService("Players").LocalPlayer.Backpack.Taser)
	end)
	ChangeTeam(Oldt)
end
function TaseAll()
	local Oldt = Player.Team
	if Oldt ~= game.Teams.Guards then
		ChangeTeam(game.Teams.Guards)
		plr.CharacterAdded:Wait()
	end
	repeat task.wait() until Player.Backpack:FindFirstChild("Taser")
	local ohTable1 = {}
	for i,v in pairs(game:GetService("Players"):GetPlayers()) do
		if v and v~= Player and v.Team ~= game.Teams.Guards and not table.find(API.Whitelisted,v) then
			table.insert(ohTable1, {
				["RayObject"] = Ray.new(Vector3.new(), Vector3.new()),
				["Distance"] = -1,
				["Cframe"] = CFrame.new(),
				["Hit"] = v.Character.Head
			})
		end
	end
	local ohInstance2 = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Taser") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Taser")
	game:GetService("ReplicatedStorage").ShootEvent:FireServer(ohTable1, ohInstance2)
	task.spawn(function()
		game:GetService("ReplicatedStorage").ReloadEvent:FireServer(game:GetService("Players").LocalPlayer.Backpack.Taser)
	end)
	ChangeTeam(Oldt)
end
function SkidFling(T)
	if T == "all" then
		Flinger:GetTarget(T)
		Flinger:flingAll()
	elseif T == "inmates" then
		Flinger:GetTarget(T)
		Flinger:flingInmates()
	elseif T == "guards" then
		Flinger:GetTarget(T)
		Flinger:flingGuards()
	elseif T == "criminals" then
		Flinger:GetTarget(T)
		Flinger:flingCriminals()
	else
		Flinger:GetTarget(T)
		Flinger:Fling()
	end
end
function PC(Message)
  if Unloaded then return end
  local args = Message:lower():split' '
  function Command(Cmd)
	return args[1] == Prefix..Cmd
  end
  function NotCommand(Cmd)
	return args[1] ~= Prefix..Cmd
  end
  if Command("unload") then
	Destroy(game:FindFirstChild('Septex_Admin'))
	Destroy(ScreenGui)
	Unloaded = true
	Notif("OK", "Script is Unloaded", 3)
  end
  if Command("cmds") or Command("cmd") or Command("commands") then
    if Commands.Visible == false then
	Commands.Position = Commands.Position + UDim2.new(0, 0, 1, 0)
	wait(.1)
	Commands:TweenPosition(SavedCmdsPosition, "Out", "Sine", 1)
	Commands.Visible = true
    else
	Commands:TweenPosition(SavedCmdsPosition + UDim2.new(0, 0, 1, 0), "Out", "Quart", 1)
	wait(.5)
	Commands.Visible = false
    end
    TextBox.Text = ''
  end
  if Command("re") or Command("refresh") then
    Refresh()
    Notif("OK", "Refreshes Character", 3)
    TextBox.Text = ""
  end
  if Command("autore") or Command("autorespawn") then
    ChangeState(args[2],"AutoRespawn")
    TextBox.Text = ""
  end
  if Command("kill") or Command("oof") or Command("die") then
    local Team = IsTeamCommandCheck(args[2])
    if args[2] == "all" or args[2] == "everyone" or args[2] == "others" then
	Notif("OK", "Killed "..args[2], 3)
	TextBox.Text = ""
	killall("all",7)
    elseif Team == game.Teams.Inmates then
	killall(game.Teams.Inmates,7)
	Notif("OK", "Killed inmates", 3)
	TextBox.Text = ""
    elseif Team == game.Teams.Guards then
	killall(game.Teams.Guards,7)
	Notif("OK", "Killed guards", 3)
	TextBox.Text = ""
    elseif Team == game.Teams.Criminals then
	killall(game.Teams.Criminals,7)
	Notif("OK", "Killed criminals", 3)
	TextBox.Text = ""
    else
        local Target = FindPlayer(args[2])
        KillPlayer(Target,7)
        Notif("OK", "Killed "..Target.DisplayName, 3)
        TextBox.Text = ""
    end
  end
  if Command("whitelist") or Command("wl") then
      local Player = FindPlayer(args[2])
      if Player then
	  if not table.find(API.Whitelisted,Player) then
		table.insert(API.Whitelisted, Player)
		Notif("OK", "Whitelisted "..Player.DisplayName, 3)
		TextBox.Text = ""
	  end
      end
  end
  if Command("unwhitelist") or Command("unwl") then
      local Player = FindPlayer(args[2])
	 if Player then
		if table.find(API.Whitelisted,Player) then
			table.remove(API.Whitelisted,table.find(API.Whitelisted,Player))
			Notif("OK", "Blacklisted "..Player.DisplayName)
			TextBox.Text = ""
		end
	 end
  end
  if Command("inmate") then
      ChangeTeam(game.Teams.Inmates)
      Notif("OK", "Change team inmates", 3)
      TextBox.Text = ""
  end
  if Command("guard") then
      if not GuardsFull("c") then
		ChangeTeam(game.Teams.Guards)
		Notif("OK", "Change team guards", 3)
		TextBox.Text = ""
      else
		Notif("Error", "Guards Full!", 3)
		TextBox.Text = ""
      end
  end
  if Command("criminal") or Command("crim") then
      local Position = CFrame.new(-922.3338012695312, 94.4225082397461, 2130.9111328125)
      if args[2] then
		local Target = FindPlayer(args[2])
		if Target then
			if Target.Team ~= game.Teams.Criminals then
				bring(Target, Position)
				Notif("OK", 'Made '..Target.DisplayName..' criminal.', 3)
				TextBox.Text = ''
			else
				Notif("Error", 'Player has criminal!', 3)
				TextBox.Text = ""
			end
		end
	else
		if plr.Team ~= game.Teams.Criminals then
			ChangeTeam(game.Teams.Criminals)
			Notif("OK", 'Made '..Player.DisplayName..' criminal.', 3)
			TextBox.Text = ''
		else
			--
			TextBox.Text = ""
		end
	end
  end
  if Command("olditemmethod") or Command("oldimethod") then
      ChangeState(args[2],"OldItemMethod")
      TextBox.Text = ""
  end
  if Command("prefix") then
	local New = args[2]
	if New and tostring(New) then
		local Prefixn = tostring(New)
		Prefix = Prefixn
		TextBox.PlaceholderText = "Press "..New.." To Enter"
		Notif("OK", "prefix set to "..New, 3)
		TextBox.Text = ""
	else
		Notif("Error", "no prefix selected?", 3)
		TextBox.Text = ""
	end
   end
   if Command("pp") then
	AllGuns()
	wait(.5)
	for i,v in pairs(Player.Character:GetChildren()) do
		if v:IsA("Tool") then
			v.Parent = Player.Backpack
		end
	end
	Player.Backpack.M9.Parent = Player.Character
	Player.Backpack["AK-47"].Parent = Player.Character
	Player.Backpack["Remington 870"].Parent = Player.Character
	wait()
	Player.Character.M9.GripPos = Vector3.new(0.9, 2, 0)
	Player.Character["Remington 870"].GripPos = Vector3.new(0.9, 2, 2.1)
	Player.Character["AK-47"].GripPos = Vector3.new(0.9, 2, 6.4)
	wait()
	for i,v in pairs(Player.Character:GetChildren()) do
		if v:IsA("Tool") then
			v.Parent = Player.Backpack
		end
	end
	wait()
	Player.Backpack.M9.Parent = Player.Character
	Player.Backpack["AK-47"].Parent = Player.Character
	Player.Backpack["Remington 870"].Parent = Player.Character
	TextBox.Text = ""
    end
    if Command("bring") then
	local Target = FindPlayer(args[2])
	if Target then
	     bring(Target)
	     Notif("OK", "bring "..Target.DisplayName, 3)
	     TextBox.Text = ""
	end
    end
    if Command("damage") or Command("dmg") then
	local Bullets = tonumber(args[3])
	local Team = IsTeamCommandCheck(args[2])
	if args[2] == "all" or args[2] == "everyone" or args[2] == "others" then
	        Notif("OK", "damage "..args[2].." "..Bullets, 3)
		TextBox.Text = ""
		if Bullets ~= nil then
			killall("all",Bullets)
		else
			Notif("Error", "no Amount found!", 3)
		end
	elseif Team == game.Teams.Inmates then
		if Bullets ~= nil then
			killall(game.Teams.Inmates,Bullets)
			Notif("OK", "damage inmates "..Bullets, 3)
			TextBox.Text = ""
		else
			Notif("Error", "no Amount found!", 3)
			TextBox.Text = ""
		end
	elseif Team == game.Teams.Guards then
		if Bullets ~= nil then
			killall(game.Teams.Guards,Bullets)
			Notif("OK", "damage guards "..Bullets, 3)
			TextBox.Text = ""
		else
			Notif("Error", "no Amount found!", 3)
			TextBox.Text = ""
		end
	elseif Team == game.Teams.Criminals then
		if Bullets ~= nil then
			killall(game.Teams.Criminals,Bullets)
			Notif("OK", "damage "..args[2].." "..Bullets, 3)
			TextBox.Text = ""
		else
			Notif("Error", "no Amount found!", 3)
			TextBox.Text = ""
		end
	else
		local p = FindPlayer(args[2])
		if Bullets ~= nil then
			KillPlayer(p,Bullets)
			Notif("OK", "damage "..p.DisplayName.." "..Bullets, 3)
			TextBox.Text = ""
		else
			Notif("Error", "no Amount found!", 3)
			TextBox.Text = ""
		end
	end
    end
    if Command("autoguns") or Command("aguns") then
	ChangeState(args[2],"AutoGuns")
	TextBox.Text = ""
    end
    if Command("autoitems") or Command("aitems") then
	ChangeState(args[2],"AutoItems")
	TextBox.Text = ""
    end
    if Command("autoremoveff") or Command("autorff") then
	ChangeState(args[2],"AutoRemoveff")
	TextBox.Text = ""
    end
    if Command("autoguard") or Command("aguard") then
	if GuardsFull("c") then
		Notif("Error", "Guards team is full!", 3)
		TextBox.Text = ""
	else
		ChangeState(args[2],"Autoguard")
		TextBox.Text = ""
	end
    end
    if Command("killaura") then
	ChangeState(args[2],"Killaura")
	TextBox.Text = ''
    end
    if Command("copychat") then
	ChangeState(args[2],"CopyChat")
	TextBox.Text = ""
    end
    if Command("notify") then
	ChangeState(args[2],"Notify")
	TextBox.Text = ""
    end
    if Command("antifling") then
	ChangeState(args[2],"AntiFling")
	TextBox.Text = ""
    end
    if Command('infjump') then
	local value = ChangeState(args[2],"Infjump")
	TextBox.Text = ""
	if value then
		game:GetService("UserInputService").JumpRequest:connect(function()
			if States.Infjump and not Unloaded then
				game.Players.LocalPlayer.Character.Humanoid:ChangeState("Jumping")
			end
		end)
	end
    end
    if Command("ff") or Command("forcefield") then
	local value = ChangeState(args[2],"ff")
	TextBox.Text = ""
	if value then
		while wait() do
			if Unloaded then return end
			if not plr.Character:FindFirstChild'ForceField' and States.ff then
				wait()
				Refresh()
			end
		end
	end
    end 
    if Command("arrest") or Command("ar") then
	if args[2] == "all" then
		local LastPosition = GetPosition()
		for i,v in pairs(game:GetService("Players"):GetPlayers()) do
			if v and v ~= game:GetService("Players").LocalPlayer and not table.find(API.Whitelisted,v) and v.Team == game.Teams.Criminals or (BadArea(v) and v.Team == game.Teams.Inmates) and v.Character.PrimaryPart and v.Character:FindFirstChildOfClass("Humanoid").Health>0 then
				repeat task.wait()
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
					task.spawn(function()
						workspace.Remote.arrest:InvokeServer(v.Character.PrimaryPart)
					end)
				until v.Character["Head"]:FindFirstChildOfClass("BillboardGui") or v.Character.Humanoid.Health == 0
				MoveTo(LastPosition)
			end
		end
		MoveTo(LastPosition)
		Notif("OK", "Arrested "..args[2], 3)
	elseif args[2] ~= "all" then
		local LastPosition = GetPosition()
		local Target = FindPlayer(args[2])
		if Target then
			if Target.Team ~= game.Teams.Guards or BadArea(Target) or not Target.Character.Humanoid.Health > 0 then
				repeat task.wait()
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Target.Character.HumanoidRootPart.CFrame
						task.spawn(function()
							workspace.Remote.arrest:InvokeServer(Target.Character.PrimaryPart)
						end)
				until Target.Character["Head"]:FindFirstChildOfClass("BillboardGui")
				Notif("OK", 'Arrested '..Target.DisplayName, 3)
				TextBox.Text = ''
			elseif Target.Team == game.Teams.Guards or not BadArea(Target) or Target.Character.Humanoid.Health > 0 then
				Notif("Error", "Can't arrest this player!", 3)
				TextBox.Text = ""
			end
		end
		MoveTo(LastPosition)
	end
	TextBox.Text = ""
    end
    if Command("meleekill") or Command("mk") or Command('mkill') then
	local Team = IsTeamCommandCheck(args[2])
	if args[2] == "all" then
		for i,v in pairs(game.Players:GetPlayers()) do
			if v ~= plr and not table.find(API.Whitelisted,v) then
				Meleekill(v)
			end
		end
		Notif("OK", "Melee killed "..args[2], 3)
	elseif Team == game.Teams.Inmates then
		for i,v in pairs(game.Teams.Inmates:GetPlayers()) do
			if v ~= plr and not table.find(API.Whitelisted,v) then
				Meleekill(v)
			end
		end
		Notif("OK", "Melee killed inmates", 3)
	elseif Team == game.Teams.Guards then
		for i,v in pairs(game.Teams.Guards:GetPlayers()) do
			if v ~= plr and not table.find(API.Whitelisted,v) then
				Meleekill(v)
			end
		end
		Notif("OK", "Melee killed guards", 3)
	elseif Team == game.Teams.Criminals then
		for i,v in pairs(game.Teams.Criminals:GetPlayers()) do
			if v ~= plr and not table.find(API.Whitelisted,v) then
				Meleekill(v)
			end
		end
		Notif("OK", "Melee killed criminals", 3)
	else
		local Target = FindPlayer(args[2])
		Meleekill(Target)
		Notif("OK", 'Melee killed '..Target.DisplayName, 3)
	end
	TextBox.Text = ""
    end
    if Command('tp') then
	local player1 = FindPlayer(args[2])
	local player2 = FindPlayer(args[3])
	if player1 and player2 then
		bring(player1,player2.Character.HumanoidRootPart.CFrame)
		Notif("OK", "Teleports "..player1.DisplayName.." to "..player2.DisplayName, 3)
		TextBox.Text = ""
	end
    end
    if Command("speed") or Command("ws") then
	local speed = tonumber(args[2])
	if speed ~= nil then
		plr.Character.Humanoid.WalkSpeed = speed
		Notif("OK", "Speed changed to "..speed, 3)
		TextBox.Text = ""
	else
		Notif("Error", "no speed?", 3)
	end
    end
    if Command('btools') then
	Instance.new("HopperBin",plr.Backpack).BinType = 3
	Instance.new("HopperBin",plr.Backpack).BinType = 4
	TextBox.Text = ""
    end
    if Command("shotgun") or Command("rem") or Command("remington") then
	GetGun('Remington 870')
	Notif("OK", 'Get Remington 870', 3)
	TextBox.Text = ""
    end
    if Command("ak") or Command('ak-47') then
	GetGun('AK-47')
	Notif("OK", 'Get AK-47', 3)
	TextBox.Text = ""
    end
    if Command('m9') or Command("pistol") then
	GetGun('M9')
	Notif("OK", 'Get M9', 3)
	TextBox.Text = ""
    end
    if Command('guns') then
	AllGuns()
	Notif("OK", 'Get all guns', 3)
	TextBox.Text = ""
    end
    if Command("items") then
	AllItems()
	Instance.new("HopperBin",plr.Backpack).BinType = 3
	Instance.new("HopperBin",plr.Backpack).BinType = 4
	Notif("OK", 'Get all Items', 3)
	TextBox.Text = ""
    end
    if Command('m4') or Command('m4a1') then
	if not game:GetService("MarketplaceService"):UserOwnsGamePassAsync(plr.UserId, 96651) then
		Notif("Error", 'Not Gamepass', 3)
		TextBox.Text = ''
	else
		GetGun("M4A1")
		Notif("OK", "Get M4A1", 3)
		TextBox.Text = ''
	end
    end
    if Command("hammer") or Command('ham') then
	GetSingle('Hammer')
	Notif('OK', 'Get Hammer', 3)
	TextBox.Text = ""
    end
    if Command('knife') or Command('knive') then
	GetSingle('Crude Knife')
	Notif('OK', "Get Crude Knife", 3)
	TextBox.Text = ""
    end
    if Command("food") then
	if Title("Breakfast") then
		GetGun("Breakfast")
		Notif('OK', 'Get food Breakfast', 3)
		TextBox.Text = ''
	end
	if Title('Lunch') then
		GetGun("Lunch")
		Notif('OK', 'Get food Lunch', 3)
		TextBox.Text = ''
	end
	if Title("Dinner") then
		GetGun("Dinner")
		Notif('OK', 'Get food Dinner', 3)
		TextBox.Text = ''
	end
	if not Title('Breakfast') and not Title("Lunch") and not Title('Dinner') then
		Notif('Error', "No Food Found!", 3)
		TextBox.Text = ''
	end
    end
    if Command("goto") or Command("to") then
	local Target = FindPlayer(args[2])
	local TargetPosition = GetPosition(Target)
	if Target then
		MoveTo(TargetPosition)
		Notif('OK', "goto to "..Target.DisplayName, 3)
		TextBox.Text = ""
	end
    end
    if Command("drag") then
	ChangeState(args[2],'DraggableGuis')
	TextBox.Text = ""
    end
    if Command("autodumpcars") or Command("autodeletecars") or Command('autonocars') then
	ChangeState(args[2],'AutoDumpCars')
	TextBox.Text = ''
    end
    if Command('opengate') then
	local LastP = GetPosition()
	local Gate = workspace.Prison_ITEMS.buttons:FindFirstChild("Prison Gate")["Prison Gate"]
	plr.Character.HumanoidRootPart.CFrame = Gate.CFrame
	repeat task.wait()
		workspace.Remote.ItemHandler:InvokeServer(Gate)
	until Gate
	MoveTo(LastP)
	Notif("OK", 'Open the gate', 3)
	TextBox.Text = ""
    end
    if Command("allcmds") then
	Notif("OK", "Septex Admin has "..tostring(CommandsAmount).." commands.", 3)
	TextBox.Text = ""
    end
    if Command('nex') or Command("nexus") then
	local Position = CFrame.new(918.77, 100, 2379.07)
	if args[2] then
		local Target = FindPlayer(args[2])
		if Target then
			bring(Target, Position)
			Notif('OK', "Brought "..Target.DisplayName.." to nexus", 3)
			TextBox.Text = ""
		end
	else
		MoveTo(Position)
		Notif("OK", 'Brought '..plr.DisplayName..' to nexus', 3)
		TextBox.Text = ''
	end
    end
    if Command('yard') then
	local Position = CFrame.new(791, 98, 2498)
	if args[2] then
		local Target = FindPlayer(args[2])
		if Target then
			bring(Target, Position)
			Notif('OK', "Brought "..Target.DisplayName.." to yard", 3)
			TextBox.Text = ""
		end
	else
		MoveTo(Position)
		Notif("OK", 'Brought '..plr.DisplayName..' to yard', 3)
		TextBox.Text = ''
	end
    end
    if Command('gas') then
	local Position = CFrame.new(-518, 54, 1655)
	if args[2] then
		local Target = FindPlayer(args[2])
		if Target then
			bring(Target, Position)
			Notif('OK', "Brought "..Target.DisplayName.." to gas", 3)
			TextBox.Text = ""
		end
	else
		MoveTo(Position)
		Notif("OK", 'Brought '..plr.DisplayName..' to gas', 3)
		TextBox.Text = ''
	end
    end
    if Command("roof") then
	local Position = CFrame.new(820.6336059570312, 120.48998260498047, 2352.623046875)
	if args[2] then
		local Target = FindPlayer(args[2])
		if Target then
			bring(Target, Position)
			Notif('OK', "Brought "..Target.DisplayName.." to roof", 3)
			TextBox.Text = ""
		end
	else
		MoveTo(Position)
		Notif("OK", 'Brought '..plr.DisplayName..' to roof', 3)
		TextBox.Text = ''
	end
    end
    if Command('respawn') or Command("res") then
	if plr.Team == game.Teams.Inmates then
		workspace.Remote.TeamEvent:FireServer("Bright orange")
	elseif plr.Team == game.Teams.Guards then
		if GuardsFull("b") then
			workspace.Remote.TeamEvent:FireServer("Bright orange")
			plr.CharacterAdded:Wait()
			repeat wait()
				workspace.Remote.TeamEvent:FireServer("Bright blue")
			until plr.Team == game.Teams.Guards
		else
			workspace.Remote.TeamEvent:FireServer("Bright blue")
		end
	elseif plr.Team == game.Teams.Criminals then
		if not GuardsFull("c") then
			workspace.Remote.TeamEvent:FireServer("Bright blue")
			plr.CharacterAdded:Wait()
			repeat task.wait()
				plr.Character.Head.CanCollide = false
				task.pcall(function()
					workspace["Criminals Spawn"].SpawnLocation.CFrame = plr.Character.Head.CFrame
				end)
			until plr.Team == game.Teams.Criminals
			workspace["Criminals Spawn"].SpawnLocation.CFrame = saved
		else
			workspace.Remote.TeamEvent:FireServer("Bright orange")
			plr.CharacterAdded:Wait()
			repeat task.wait()
				plr.Character.Head.CanCollide = false
				task.pcall(function()
					workspace["Criminals Spawn"].SpawnLocation.CFrame = plr.Character.Head.CFrame
				end)
			until plr.Team == game.Teams.Criminals
			workspace["Criminals Spawn"].SpawnLocation.CFrame = saved
		end
	elseif plr.Team == game.Teams.Neutral then
		workspace.Remote.TeamEvent:FireServer("Medium stone grey")
	end
	Notif("OK", 'Respawnes Character', 3)
	TextBox.Text = ""
    end
    if Command('getplayer') then
	local Team = IsTeamCommandCheck(args[2])
	if args[2] == "all" then
		Notif("OK", 'the server has '..#game.Players:GetPlayers()..' players.', 3)
	        TextBox.Text = ''
	elseif Team == game.Teams.Inmates then
		Notif("OK", 'the team inmates has '..#game.Teams.Inmates:GetPlayers()..' players.', 3)
	        TextBox.Text = ""
	elseif Team == game.Teams.Guards then
		Notif("OK", 'the team guards has '..#game.Teams.Guards:GetPlayers()..' players.', 3)
	        TextBox.Text = ''
	elseif Team == game.Teams.Criminals then
		Notif("OK", 'the team criminals has '..#game.Teams.Criminals:GetPlayers()..' players.', 3)
	        TextBox.Text = ""
	end
    end
    if Command("noclip") then
	local value = ChangeState(args[2],"Noclip")
	if value then
		while wait() do
			if States.Noclip and Player.Character and not Unloaded then
				for i,v in pairs(Player.Character:GetDescendants()) do
					if v:IsA"BasePart" and not Unloaded and States.Noclip then
						v.CanCollide = false
					end
				end
			end
		end
	end
	plr.Character.Humanoid:ChangeState("Jumping")
	TextBox.Text = ''
    end
    if Command('chatnotify') then
	ChangeState(args[2],"ChatNotify")
	TextBox.Text = ""
    end
    if Command("view") then
	local Target = FindPlayer(args[2])
	if Target then
		if API.ViewingPlayer then
			API.ViewingPlayer = nil
			wait(.4)
		end
		API.ViewingPlayer = Target
		task.spawn(function()
			while wait(.1) do
				pcall(function()
					workspace.CurrentCamera.CameraSubject = Target.Character:FindFirstChildOfClass("Humanoid")
				end)
				if not Target or not API.ViewingPlayer or Unloaded then
					workspace.CurrentCamera.CameraSubject = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
					break
				end
			end
		end)
	Notif("OK", 'Viewing '..Target.DisplayName, 3)
	TextBox.Text = ''
	end
    end
    if Command('unview') then
	API.ViewingPlayer = nil
	workspace.CurrentCamera.CameraSubject = plr.Character.Humanoid
	Notif("OK", 'Unviewing', 3)
	TextBox.Text = ""
    end
    if Command('rejoin') or Command("rj") then
	game:GetService("TeleportService"):Teleport(game.PlaceId)
    end
    if Command('doorsdestroy') or Command("nodoors") then
	local value = ChangeState(args[2],"DoorsDestroy")
	if value then
		workspace.Doors.Parent = game.Lighting
	else
		game.Lighting.Doors.Parent = workspace
	end
	TextBox.Text = ""
    end
    if Command('removecars') or Command("nocars") or Command('dumpcars') then
	local Old = GetPosition()
	for i,v in pairs(game:GetService("Workspace").CarContainer:GetChildren()) do
		if v then
			repeat task.wait() until Player.Character:FindFirstChildOfClass("Humanoid").Health >1

			local car = v
			if car:FindFirstChild("RWD")and  car:FindFirstChild("Body") and car:FindFirstChild("Body"):FindFirstChild("VehicleSeat").Occupant == nil then
				local Seat = car.Body.VehicleSeat
				car.PrimaryPart = car.RWD
				repeat task.wait()
					Seat:Sit(Player.Character:FindFirstChildOfClass("Humanoid"))
				until Player.Character:FindFirstChildOfClass("Humanoid").Sit == true
				for i =1,5 do
					wait()
					car:SetPrimaryPartCFrame(CFrame.new(30, 30, 30))
				end
				wait(.1)
				UnSit()
			end
		end
	end
	MoveTo(Old)
	Notif("OK", 'Removes all cars', 3)
	TextBox.Text = ''
    end
    if Command("antisit") then
	ChangeState(args[2],"Antisit")
	TextBox.Text = ""
    end
    if Command('antitase') or Command("notase") then
	local value = ChangeState(args[2],"AntiTase")
	TextBox.Text = ''
	if value then
		for i,v in pairs(getconnections(workspace:WaitForChild("Remote").tazePlayer.OnClientEvent)) do
			v:Disable()
		end
	elseif not value then
		for i,v in pairs(getconnections(workspace:WaitForChild("Remote").tazePlayer.OnClientEvent)) do
			v:Enable()
		end
	end
    end
    if Command('clickkill') then
	ChangeState(args[2],"ClickKill")
	TextBox.Text = ""
    end
    if Command("clickarrest") then
	ChangeState(args[2],"ClickArrest")
	TextBox.Text = ''
    end
    if Command'arrestaura' then
	ChangeState(args[2],'ArrestAura')
	TextBox.Text = ""
    end
    if Command"antitouch" then
	ChangeState(args[2],"AntiTouch")
	TextBox.Text = ''
    end
    if Command("meleelk") or Command('mlk') then
	local Team = IsTeamCommandCheck(args[2])
	if args[2] == "all" or args[2] == "everyone" or args[2] == "others" then
		Notif("OK", 'Melee loopkill '..args[2], 3)
		TextBox.Text = ""
		API.MeleeLoopAll = true
	elseif Team == game.Teams.Inmates then
		Notif("OK", 'Melee loopkill inmates', 3)
		TextBox.Text = ''
		API.MeleeLoopInmates = true
	elseif Team == game.Teams.Guards then
		Notif("OK", 'Melee loopkill guards', 3)
		TextBox.Text = ''
		API.MeleeLoopGuards = true
	elseif Team == game.Teams.Criminals then
		Notif("OK", 'Melee loopkill criminals', 3)
		TextBox.Text = ''
		API.MeleeLoopCrims = true
	else
		local Player = FindPlayer(args[2])
		if not table.find(API.LoopmKilling,Player.Name) then
			table.insert(API.LoopmKilling, Player.Name)
			Notif("OK", "Melee loopkill "..Player.DisplayName, 3)
		else
			Notif("Error", 'Player is already getting loop killed!', 3)
		end
	end
	while wait(.7) do
		if API.MeleeLoopAll then
			for i,v in pairs(game.Players:GetPlayers()) do
				if v ~= plr and not table.find(API.Whitelisted,v) then
					if not v.Character.Humanoid.Health == 0 or not v.Character:FindFirstChild('ForceField') then
						Meleekill(v)
					end
				end
			end
		end
		if API.MeleeLoopInmates then
			for i,v in pairs(game.Teams.Inmates:GetPlayers()) do
				if v ~= plr and not table.find(API.Whitelisted,v) then
					if not v.Character.Humanoid.Health == 0 or not v.Character:FindFirstChild('ForceField') then
						Meleekill(v)
					end
				end
			end
		end
		if API.MeleeLoopGuards then
			for i,v in pairs(game.Teams.Guards:GetPlayers()) do
				if v ~= plr and not table.find(API.Whitelisted,v) then
					if not v.Character.Humanoid.Health == 0 or not v.Character:FindFirstChild('ForceField') then
						Meleekill(v)
					end
				end
			end
		end
		if API.MeleeLoopCrims then
			for i,v in pairs(game.Teams.Criminals:GetPlayers()) do
				if v ~= plr and not table.find(API.Whitelisted,v) then
					if not v.Character.Humanoid.Health == 0 or not v.Character:FindFirstChild('ForceField') then
						Meleekill(v)
					end
				end
			end
		end
	end
    end
    if Command("unmeleelk") or Command('unmlk') then
	local Team = IsTeamCommandCheck(args[2])
	if args[2] == "all" or args[2] == "everyone" or args[2] == "others" then
		Notif("OK", 'Stopped Melee loopkill '..args[2], 3)
		TextBox.Text = ""
		API.MeleeLoopAll = false
	elseif Team == game.Teams.Inmates then
		Notif("OK", 'Stopped Melee loopkill inmates', 3)
		TextBox.Text = ''
		API.MeleeLoopInmates = false
	elseif Team == game.Teams.Guards then
		Notif("OK", 'Stopped Melee loopkill guards', 3)
		TextBox.Text = ''
		API.MeleeLoopGuards = false
	elseif Team == game.Teams.Criminals then
		Notif("OK", 'Stopped Melee loopkill criminals', 3)
		TextBox.Text = ''
		API.MeleeLoopCrims = false
	else
		local Player = FindPlayer(args[2])
		if table.find(API.LoopmKilling,Player.Name) then
			table.remove(API.LoopmKilling,table.find(API.LoopmKilling,Player.Name))
			Notif("OK", 'Stopped Melee loopkill '..Player.DisplayName, 3)
			TextBox.Text = ""
		else
			Notif("Error", 'Player is not melee loopkill!', 3)
			TextBox.Text = ''
		end
	end
    end
    if Command('cbase') or Command("crimbase") then
	local Position = CFrame.new(-858.08990478516, 94.476051330566, 2093.8288574219)
	if args[2] then
		local Target = FindPlayer(args[2])
		if Target then
			bring(Target, Position)
			Notif('OK', "Brought "..Target.DisplayName.." to crimbase", 3)
			TextBox.Text = ""
		end
	else
		MoveTo(Position)
		Notif("OK", 'Brought '..plr.DisplayName..' to crimbase', 3)
		TextBox.Text = ''
	end
    end
    if Command("car") then
	pcall(function()
			local OldPos = game:GetService("Players").LocalPlayer.Character:GetPrimaryPartCFrame()
			game:GetService("Players").LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(-910, 95, 2157))
			wait()
			local car = nil
			task.spawn(function()
				car = game:GetService("Workspace").CarContainer.ChildAdded:Wait()
			end)
			repeat wait(.1)
				local ohInstance1 = game:GetService("Workspace").Prison_ITEMS.buttons:GetChildren()[8]["Car Spawner"]
				workspace.Remote.ItemHandler:InvokeServer(ohInstance1)
			until car
			repeat task.wait() until car:FindFirstChild("RWD") and car:FindFirstChild("Body") and car:FindFirstChild("Body"):FindFirstChild("VehicleSeat")
			car.PrimaryPart = car.RWD
			game:GetService("Players").LocalPlayer.Character:SetPrimaryPartCFrame(OldPos)
			wait(1)
			local Done = false
			car.Body.VehicleSeat:Sit(game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"))
			repeat 

				game:GetService("RunService").RenderStepped:Wait()
				for i = 1,3 do
					car:SetPrimaryPartCFrame(OldPos)
				end
				game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame =CFrame.new(car.Body.VehicleSeat.Position)
				car.Body.VehicleSeat:Sit(game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"))
				if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit == true then
					Done = true
				end
			until Done
		end)
	  Notif("OK", 'Spawner new car to you location', 3)
	  TextBox.Text = ""
    end
    if Command('loopcrim') or Command("loopcriminal") then
	if args[2] or args[2] ~= nil or args[2] ~= plr or args[2] ~= "" then
		local Player = FindPlayer(args[2])
		if Player then
			if not table.find(API.LoopCrim,Player.Name) then
				table.insert(API.LoopCrim, Player.Name)
				Notif("OK", "Auto make "..Player.DisplayName.." criminal.", 3)
				TextBox.Text = ''
			else
				Notif("Error", 'Player is already loop criminal!', 3)
				TextBox.Text = ""
			end
		end
	elseif not args[2] or args == nil or args[2] == plr or args[2] == "" then
		States.LoopCrim = true
		Notif("OK", 'Auto make '..plr.DisplayName..' criminal.', 3)
		TextBox.Text = ''
		plr.CharacterAdded:Connect(function(NewCharacter)
			if States.LoopCrim and Unloaded == false then
				if plr.Team == game.Teams.Inmates then
					repeat task.wait()
						NewCharacter.Head.CanCollide = false
						workspace["Criminals Spawn"].SpawnLocation.CFrame = NewCharacter.Head.CFrame
					until plr.Team == game.Teams.Criminals
					workspace["Criminals Spawn"].SpawnLocation.CFrame = saved
				elseif plr.Team == game.Teams.Guards then
					pcall(function()
					repeat task.wait() until game:GetService("Players").LocalPlayer.Character
						game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart")

						WaitForRespawn(Pos or GetPosition(),NoForce)
					end)
					repeat task.wait()
						NewCharacter.Head.CanCollide = false
						workspace["Criminals Spawn"].SpawnLocation.CFrame = NewCharacter.Head.CFrame
					until plr.Team == game.Teams.Criminals
					workspace["Criminals Spawn"].SpawnLocation.CFrame = saved
				elseif plr.Team == game.Teams.Criminals then
					--
				end
			end
		end)
	end
    end
    if Command('unloopcrim') or Command("unloopcriminal") then
	if args[2] or args[2] ~= nil or args[2] ~= plr or args[2] ~= '' then
		local Player = FindPlayer(args[2])
		if Player then
			if table.find(API.LoopCrim,Player.Name) then
				table.remove(API.LoopCrim,table.find(API.LoopCrim,Player.Name))
				Notif("OK", 'Stopped auto make '..Player.DisplayName..' criminal.', 3)
				TextBox.Text = ""
			else
				Notif("Error", 'Player is not loop criminal!', 3)
				TextBox.Text = ''
			end
		end
	else
		States.LoopCrim = false
		Notif("OK", 'Stopped auto make '..plr.DisplayName..' criminal.', 3)
		TextBox.Text = ""
	end
    end
    if Command("tase") then
	local Team = IsTeamCommandCheck(args[2])
	if args[2] == "all" or args[2] == "everyone" or args[2] == "others" then
		TaseAll()
		Notif("OK", 'Tase the '..args[2], 3)
		TextBox.Text = ''
	elseif Team == game.Teams.Inmates then
		TaseTeam(game.Teams.Inmates)
		Notif("OK", 'Tase the inmates.', 3)
		TextBox.Text = ""
	elseif Team == game.Teams.Criminals then
		TaseTeam(game.Teams.Criminals)
		Notif("OK", 'Tase the criminals.', 3)
		TextBox.Text = ""
	else
		local Target = FindPlayer(args[2])
		if Target then
			Tase(Target)
			Notif("OK", 'Tase the '..Target.DisplayName, 3)
			TextBox.Text = ""
		end
	end
    end
    if Command('void') then
	local Player = FindPlayer(args[2])
	if Player then
		if Player.Character.Humanoid.Health == 0 or Player.Character.Humanoid.Sit then
			return Notif("Error", 'Player has died or is sitting or an unknown error.', 3)
		elseif not Player.Character.Humanoid.Health == 0 or not Player.Character.Humanoid.Sit then
			bring(Player, CFrame.new(7^7, 7^7, 7^7),nil)
			Notif("OK", 'Brought '..Player.DisplayName..' to void', 3)
			TextBox.Text = ''
		end
	end
    end
    if Command("silentaim") or Command('saim') then
	ChangeState(args[2],'SilentAim')
	TextBox.Text = ""
    end
    if Command"keycard" or Command('key') or Command("givekey") then
	local Oldc = GetPosition()
		local OldT = Player.Team
		if plr.Character:FindFirstChild("Key card") or plr.Backpack:FindFirstChild("Key card") then
			Notif("Error", 'You already have a keycard!', 3)
			TextBox.Text = ''
		elseif GuardsFull("c") then
			Notif("Error", 'Guards team is full!', 3)
			TextBox.Text = ""
		elseif workspace.Prison_ITEMS.single:FindFirstChild("Key card") then
			repeat task.wait()
				local a =pcall(function()
					local Key = workspace.Prison_ITEMS.single["Key card"].ITEMPICKUP
					game.Workspace.Remote["ItemHandler"]:InvokeServer(Key)
					plr.Character.HumanoidRootPart.CFrame = workspace.Prison_ITEMS.single["Key card"].ITEMPICKUP.CFrame
				end)
			until plr.Backpack:FindFirstChild("Key card")
			MoveTo(Oldc)
			Notif("OK", 'Get a keycard', 3)
			TextBox.Text = ''
		elseif not game.Players.LocalPlayer.Backpack:FindFirstChild("Key card") or not workspace.Prison_ITEMS.single:FindFirstChild("Key card") or not API:GuardsFull("c") then
		ChangeTeam(game.Teams.Guards)
		repeat wait(.3)
			Player.Character:FindFirstChildOfClass("Humanoid"):ChangeState(15)
			if States.AutoRespawn then
				States.AutoRespawn = false
			end
			if not States.AutoRespawn then
				wait(.1)
				Refresh()
			end
		until game:GetService("Workspace")["Prison_ITEMS"].single:FindFirstChild("Key card")
		if game:GetService("Workspace")["Prison_ITEMS"].single:FindFirstChild("Key card") then
			if Player.Team ~= OldT then
				ChangeTeam(OldT)
				repeat task.wait() until Player.Team == OldT
			end
			wait()
			repeat task.wait()
				local a =pcall(function()
					local Key = workspace.Prison_ITEMS.single["Key card"].ITEMPICKUP
					game.Workspace.Remote["ItemHandler"]:InvokeServer(Key)
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Prison_ITEMS.single["Key card"].ITEMPICKUP.CFrame
				end)
			until plr.Backpack:FindFirstChild("Key card")
			MoveTo(Oldc)
			Notif("OK", 'Get a keycard', 3)
			TextBox.Text = ""
			States.AutoRespawn = true
		end
	end
    end
    if Command'addnuke' or Command("nuke") then
	if args[2] or args[2] ~= nil or args[2] ~= '' or args[2] ~= plr then
		local Target = FindPlayer(args[2])
		if Target then
			Chat("!!!A NUKE HAS BEEN PLACED ON "..Target.Name.." KILLING HIM WILL GET EVERYONE DEAD!!!")
			TextBox.Text = ''
			repeat task.wait()
				if Target.Character.Humanoid.Health <1 then
					break
			        end
		        until not game
			Chat(Target.Name.." IS DEAD NUKE LAUNCHING IN 3!!!")
			wait(1.5)
			Chat("LAUNCHING IN 2")
			wait(1.5)
			Chat("LAUNCHING IN 1")
			wait(.2)
			killall("all",7)
			Notif("OK", 'Nuke from '..Target.DisplayName..' has been removed.', 3)
		end
	else
		Chat("!!!A NUKE HAS BEEN PLACED ON "..Player.Name.." KILLING HIM WILL GET EVERYONE DEAD!!!")
		TextBox.Text = ''
		repeat task.wait()
			if Player.Character.Humanoid.Health <1 then
				break
			end
		until not game
		Chat(Player.Name.." IS DEAD NUKE LAUNCHING IN 3!!!")
		wait(1.5)
		Chat("LAUNCHING IN 2")
		wait(1.5)
		Chat("LAUNCHING IN 1")
		wait(.2)
		killall("all",7)
		Notif("OK", 'Nuke from '..Player.DisplayName..' has been removed.', 3)
	end
    end
    if Command("fling") then
	local Team = IsTeamCommandCheck(args[2])
	if args[2] == "all" or args[2] == "everyone" or args[2] == "others" then
		SkidFling("all")
		Notif("OK", 'Fling the '..args[2], 3)
		TextBox.Text = ""
	elseif Team == game.Teams.Inmates then
		SkidFling("inmates")
		Notif("OK", 'Fling the inmates', 3)
		TextBox.Text = ""
	elseif Team == game.Teams.Guards then
		SkidFling("guards")
		Notif("OK", 'Fling the guards', 3)
		TextBox.Text = ""
	elseif Team == game.Teams.Criminals then
		SkidFling("criminals")
		Notif("OK", 'Fling the criminals', 3)
		TextBox.Text = ""
	else
		local Target = FindPlayer(args[2])
		SkidFling(Target)
		Notif("OK", 'Fling the '..Target.DisplayName, 3)
		TextBox.Text = ""
	end
    end
    if Command'anticrash' then
	local value = ChangeState(args[2],"anticrash")
	TextBox.Text = ''
	if value then
		pcall(function()
			game:GetService("Players").LocalPlayer.PlayerScripts.ClientGunReplicator.Disabled = true
		end)
	else
		pcall(function()
			game:GetService("Players").LocalPlayer.PlayerScripts.ClientGunReplicator.Disabled = false
		end)
	end
    end
    if Command('loopfling') or Command("lfling") then
	local Team = IsTeamCommandCheck(args[2])
	if args[2] == "all" then
		States.LoopFlingAll = true
		Notif("OK", 'LoopFling All', 3)
		TextBox.Text = ""
	elseif Team == game.Teams.Inmates then
		States.LoopFlingInmates = true
		Notif("OK", 'LoopFling Inmates', 3)
		TextBox.Text = ''
	elseif Team == game.Teams.Guards then
		States.LoopFlingGuards = true
		Notif("OK", 'LoopFling Guards', 3)
		TextBox.Text = ""
	elseif Team == game.Teams.Criminals then
		States.LoopFlingCriminals = true
		Notif("OK", 'LoopFling Criminals', 3)
		TextBox.Text = ''
	elseif args[2] ~= "all" and Team ~= game.Teams.Inmates and Team ~= game.Teams.Guards and Team ~= game.Teams.Criminals then
		local Player = FindPlayer(args[2])
		if Player then
			if not table.find(API.LoopFling,Player.Name) then
				table.insert(API.LoopFling, Player.Name)
				Notif("OK", "LoopFling "..Player.DisplayName, 3)
				TextBox.Text = ''
			else
				Notif("Error", 'Player is already loop fling!', 3)
				TextBox.Text = ""
			end
		end
	end
    end
    if Command('unloopfling') or Command("unlfling") then
	local Team = IsTeamCommandCheck(args[2])
	if args[2] == "all" then
		States.LoopFlingAll = false
		Notif("OK", 'Stopped LoopFling All', 3)
		TextBox.Text = ""
	elseif Team == game.Teams.Inmates then
		States.LoopFlingInmates = false
		Notif("OK", 'Stopped LoopFling Inmates', 3)
		TextBox.Text = ''
	elseif Team == game.Teams.Guards then
		States.LoopFlingGuards = false
		Notif("OK", 'Stopped LoopFling Guards', 3)
		TextBox.Text = ""
	elseif Team == game.Teams.Criminals then
		States.LoopFlingCriminals = false
		Notif("OK", 'Stopped LoopFling Criminals', 3)
		TextBox.Text = ''
	elseif args[2] ~= "all" and Team ~= game.Teams.Inmates and Team ~= game.Teams.Guards and Team ~= game.Teams.Criminals then
		local Player = FindPlayer(args[2])
		if Player then
			if table.find(API.LoopFling,Player.Name) then
				table.remove(API.LoopFling,table.find(API.LoopFling,Player.Name))
				Notif("OK", "Stopped LoopFling "..Player.DisplayName, 3)
				TextBox.Text = ''
			else
				Notif("Error", 'Player is not already loop fling!', 3)
				TextBox.Text = ""
			end
		end
	end
    end
    if Command'oneshot' then
	ChangeState(args[2],"OneShot")
	TextBox.Text = ''
    end
    if NotCommand("unload") and NotCommand("cmds") and NotCommand("cmd") and NotCommand("commands") and NotCommand("re") and NotCommand("refresh") and NotCommand("autore") and NotCommand("autorespawn") and NotCommand("kill") and NotCommand("oof") and NotCommand("die") and NotCommand("whitelist") and NotCommand("wl") and NotCommand("unwhitelist") and NotCommand("unwl") and NotCommand("inmate") and NotCommand("guard") and NotCommand("crim") and NotCommand("criminal") and NotCommand("olditemmethod") and NotCommand("oldimethod") and NotCommand("prefix") and NotCommand("pp") and NotCommand("bring") and NotCommand("damage") and NotCommand('dmg') and NotCommand('autoguns') and NotCommand("aguns") and NotCommand('autoitems') and NotCommand('aitems') and NotCommand('autoremoveff') and NotCommand("autorff") and NotCommand('autoguard') and NotCommand('aguard') and NotCommand"killaura" and NotCommand("copychat") and NotCommand("notify") and NotCommand('antifling') and NotCommand('infjump') and NotCommand('ff') and NotCommand('forcefield') and NotCommand('arrest') and NotCommand("ar") and NotCommand('meleekill') and NotCommand('mk') and NotCommand("mkill") and NotCommand('tp') and NotCommand("speed") and NotCommand("ws") and NotCommand('btools') and NotCommand("shotgun") and NotCommand("rem") and NotCommand("remington") and NotCommand("ak") and NotCommand('ak-47') and NotCommand('m9') and NotCommand('pistol') and NotCommand("guns") and NotCommand("items") and NotCommand('m4') and NotCommand('m4a1') and NotCommand("hammer") and NotCommand('ham') and NotCommand("knife") and NotCommand('knive') and NotCommand("food") and NotCommand("goto") and NotCommand('to') and NotCommand('drag') and NotCommand('autonocars') and NotCommand('autodumpcars') and NotCommand("autodeletecars") and NotCommand('opengate') and NotCommand("allcmds") and NotCommand('nex') and NotCommand("nexus") and NotCommand('yard') and NotCommand("gas") and NotCommand('roof') and NotCommand("respawn") and NotCommand('res') and NotCommand("getplayer") and NotCommand('noclip') and NotCommand("chatnotify") and NotCommand('view') and NotCommand("unview") and NotCommand("rejoin") and NotCommand('rj') and NotCommand("doorsdestroy") and NotCommand('nodoors') and NotCommand("removecars") and NotCommand('nocars') and NotCommand("dumpcars") and NotCommand('antisit') and NotCommand("antitase") and NotCommand('notase') and NotCommand("clickkill") and NotCommand'clickarrest' and NotCommand("arrestaura") and NotCommand('antitouch') and NotCommand("meleelk") and NotCommand('mlk') and NotCommand("unmeleelk") and NotCommand('unmlk') and NotCommand("cbase") and NotCommand('crimbase') and NotCommand"car" and NotCommand('loopcrim') and NotCommand("loopcriminal") and NotCommand("unloopcrim") and NotCommand('unloopcriminal') and NotCommand("tase") and NotCommand'void' and NotCommand("silentaim") and NotCommand('saim') and NotCommand("keycard") and NotCommand('key') and NotCommand("givekey") and NotCommand'addnuke' and NotCommand("nuke") and NotCommand("fling") and NotCommand('anticrash') and NotCommand("loopfling") and NotCommand('lfling') and NotCommand("unloopfling") and NotCommand('unlfling') and NotCommand("oneshot") then
	Notif("Error", 'not a valid command.', 3)
    end
end
Player.Chatted:Connect(PC)
plr.CharacterAdded:Connect(function(NewCharacter)
    if Unloaded then return end
    if States.AutoGuns then
	wait(.3)
	AllGuns()
    end
    if States.AutoItems then
	wait(.3)
	AllItems()
	Instance.new("HopperBin",plr.Backpack).BinType = 3
	Instance.new("HopperBin",plr.Backpack).BinType = 4
    end
    repeat swait() until NewCharacter
    NewCharacter:WaitForChild("HumanoidRootPart")
    NewCharacter:WaitForChild("Head")
    NewCharacter:WaitForChild("Humanoid").BreakJointsOnDeath = not States.AutoRespawn
    NewCharacter:WaitForChild("Humanoid").Died:Connect(function()
	   if not Unloaded and States.AutoRespawn then
		  Refresh()
	   end
    end)
    if Unloaded then return end
    if States.AutoRemoveff then
	pcall(function()
		NewCharacter:WaitForChild("ForceField"):Destroy()
	end)
    end
    if States.Autoguard then
	if not GuardsFull("c") then
		if plr.Team ~= game.Teams.Guards then
			ChangeTeam(game.Teams.Guards)
		end
	end
    end
end)
plr:GetMouse().Button1Up:Connect(function()
	local Target = plr:GetMouse().Target
	if Killcool1 then return end
	if States.ClickArrest or States.ClickKill then
		if Target and Target.Parent and Target.Parent:FindFirstChildOfClass("Humanoid") and game:GetService("Players"):FindFirstChild(Target.Parent.Name) or game:GetService("Players"):FindFirstChild(Target.Parent.Parent.Name) then
			local TargetModelPlr = game:GetService("Players"):FindFirstChild(Target.Parent.Name)
			if States.ClickArrest then
				if TargetModelPlr.Team == game.Teams.Criminals or (BadArea(TargetModelPlr) and TargetModelPlr.Team == game.Teams.Inmates) and not TargetModelPlr.Character.Humanoid.Health >0 then
					local Position = GetPosition()
					repeat task.wait()
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = TargetModelPlr.Character.HumanoidRootPart.CFrame
						task.spawn(function()
							workspace.Remote.arrest:InvokeServer(TargetModelPlr.Character.PrimaryPart)
						end)
					until TargetModelPlr.Character["Head"]:FindFirstChildOfClass("BillboardGui")
					MoveTo(Position)
				end
			end
			if States.ClickKill then
				KillPlayer(TargetModelPlr,7)
				Killcool1 = true
				wait(.6)
				Killcool1 = false
			end
		end
	end
end)
plr:GetMouse().Button1Up:Connect(function()
	local target = plr:GetMouse().Target
	if not Unloaded and target and target.Parent:FindFirstChildOfClass("Humanoid") and game:GetService("Players"):FindFirstChild(target.Parent.Name) and States.OneShot then
		local Vic = game:GetService("Players"):FindFirstChild(target.Parent.Name)
		local Gun = plr.Character:FindFirstChildOfClass("Tool")
		if Gun and Gun:FindFirstChildOfClass("ModuleScript") and Vic and Vic.Team ~= plr.Team then
			Bullets = CreateBulletTable(7, Vic.Character:FindFirstChild("Head"))
			game:GetService("ReplicatedStorage").ShootEvent:FireServer(Bullets, Gun)
		end
	end
end)
coroutine.wrap(function()
	while wait() do -- fast loop
		if States.Killaura and not Unloaded then
			for i,v in pairs(game.Players:GetPlayers()) do
				if v and v ~= plr and not table.find(API.Whitelisted,v) then
					if not v.Character.Humanoid.Health == 0 or not v.Character:FindFirstChild("ForceField") then
						game.ReplicatedStorage.meleeEvent:FireServer(v)
					end
				end
			end
		end
		if plr.Character.Humanoid.Sit and States.Antisit and not Unloaded then
			game.Players.LocalPlayer.Character.Humanoid:ChangeState'Jumping'
		end
		if States.ArrestAura and not Unloaded then
			pcall(function()
				for i,v in pairs(game.Players:GetPlayers()) do
					if v ~= Player and v.Team ~= game.Teams.Guards then
						if (v.Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).magnitude <30 and v.Character.Humanoid.Health >0 and not table.find(API.Whitelisted,v) then
							local args = {
								[1] = v.Character:FindFirstChild("Head") or v.Character:FindFirstChildOfClass("Part")
							}
							if v.Team == game.Teams.Criminals or (v.Team == game.Teams.Inmates and BadArea(v)) then
								workspace.Remote.arrest:InvokeServer(unpack(args))
							end
						end
					end
				end
			end)
		end
		if States.AntiTouch and Unloaded == false then
			pcall(function()
				for i,v in pairs(game.Players:GetPlayers()) do
					if v ~= Player then
						if (v.Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).magnitude <2.3 and v.Character.Humanoid.Health >0 and not table.find(API.Whitelisted,v) then
							task.spawn(function()
								game:GetService("ReplicatedStorage").meleeEvent:FireServer(v)
							end)
						end
					end
				end
			end)
		end
	end
end)()
spawn(function()
	while wait(.8) do -- slow loop
		for i,v in pairs(API.LoopmKilling) do
			if v and game.Players:FindFirstChild(v) then
				local Target = game.Players:FindFirstChild(v)
				Meleekill(Target)
			end
		end
		for i,v in pairs(API.LoopCrim) do
			if v and game.Players:FindFirstChild(v) then
				local Target = game.Players:FindFirstChild(v)
				if Target.Team ~= game.Teams.Criminals then
					bring(Target, CFrame.new(-922.3338012695312, 94.4225082397461, 2130.9111328125))
				end
			end
		end
		for i,v in pairs(API.LoopFling) do
			if v and game.Players:FindFirstChild(v) then
				SkidFling(game.Players:FindFirstChild(v))
			end
		end
		if States.LoopFlingAll then
			SkidFling("all")
		end
		if States.LoopFlingInmates then
			SkidFling'inmates'
		end
		if States.LoopFlingGuards then
			SkidFling'guards'
		end
		if States.LoopFlingCriminals then
			SkidFling'criminals'
		end
	end
end)
local Players = game.Players
local LocalPlayer = Players.LocalPlayer
local GetPlayers = Players.GetPlayers
local Camera = workspace.CurrentCamera
local WTSP = Camera.WorldToScreenPoint
local FindFirstChild = game.FindFirstChild
local Vector2_new = Vector2.new
local Mouse = LocalPlayer.GetMouse(LocalPlayer)
local function NotObstructing(Destination, Ancestor)
	local ObstructingParts = Camera.GetPartsObscuringTarget(Camera, {Destination}, {Ancestor, LocalPlayer.Character})

	for i,v in ipairs(ObstructingParts) do
		pcall(function()
			if v.Transparency >= 1 then
				table.remove(ObstructingParts, i)
			end
		end)
	end

	if #ObstructingParts <= 0 then
		return true
	end
	local RaycastParameters = RaycastParams.new()
	RaycastParameters.IgnoreWater = true
	RaycastParameters.FilterType = Enum.RaycastFilterType.Blacklist
	RaycastParameters.FilterDescendantsInstances = {LocalPlayer.Character}

	RaycastParameters.FilterDescendantsInstances = {LocalPlayer.Character}

	local Origin = Camera.CFrame.Position
	local Direction = (Destination - Origin).Unit * 500
	local RayResult = workspace.Raycast(workspace, Origin, Direction, RaycastParameters) or {
		Instance = nil;
		Position = Origin + Direction;
		Material = Enum.Material.Air;
	}

	if RayResult.Instance and (RayResult.Instance.IsDescendantOf(RayResult.Instance, Ancestor) or RayResult.Instance == Ancestor) then
		return true
	end
	return false
end
function ClosestChar()
	local Max, Close = 170
	for I,V in pairs(GetPlayers(Players)) do
		if V ~= LocalPlayer and V.Team ~= LocalPlayer.Team and V.Character then
			local Head = FindFirstChild(V.Character, "Head")
			if Head then
				if NotObstructing(V.Character.PrimaryPart.Position, V.Character) == false then
					continue
				end
				local Pos, OnScreen = WTSP(Camera, Head.Position)
				if OnScreen then
					local Dist = (Vector2_new(Pos.X, Pos.Y) - Vector2_new(Mouse.X, Mouse.Y)).Magnitude
					if Dist < Max then
						Max = Dist
						Close = V.Character
					end
				end
			end
		end
	end

	return Close
end
local MT = getrawmetatable(game)
local __namecall = MT.__namecall
setreadonly(MT, false)
MT.__namecall = newcclosure(function(self, ...)
	local Method = getnamecallmethod()
	local isExploit = checkcaller()
	if Method:lower() == "destroy" or Method:lower() == "remove" and Unloaded == false then
		if self.IsA(self, "Player") and isExploit then
			--
		end
	end
	if States.SilentAim then
		if not Unloaded and Method == "FindPartOnRay" and not checkcaller() and tostring(getfenv(0).script) == "GunInterface" then
			local Character = ClosestChar()
			if Character then
				return Character.Torso, Character.Torso.Position+Vector3.new(Random.new():NextNumber(-1,1),Random.new():NextNumber(.1,.8),Random.new():NextNumber(-.5,.5))
			end
		end
	end
	return __namecall(self, ...)
end)
setreadonly(MT, true)
function CopyChat(PLR)
	PLR.Chatted:Connect(function(msg)
		if States.CopyChat and Unloaded == false then
			Chat("["..PLR.DisplayName.."]: "..msg)
		end
	end)
end
function PickUp(Target)
	Target.Backpack.ChildAdded:Connect(function(Item)
		if States.Notify and Unloaded == false then
			game.StarterGui:SetCore("ChatMakeSystemMessage",  { Text = "[NOTIFY]: "..Target.Name.." Pick Up "..Item.Name, Color = Color3.fromRGB(16, 243, 255), Font = Enum.Font.SourceSansBold, FontSize = Enum.FontSize.Size24 } )
                end
		if States.ChatNotify and not Unloaded == true then
			Chat(Target.Name.." Pick Up "..Item.Name)
		end
        end)
end
function Died(PLAYER)
	PLAYER.CharacterAdded:Connect(function(NewChar)
		repeat swait() until NewChar
		NewChar:WaitForChild("HumanoidRootPart")
		NewChar:WaitForChild("Head")
                NewChar:WaitForChild("Humanoid").BreakJointsOnDeath = not States.Notify
                NewChar:WaitForChild("Humanoid").Died:Connect(function()
			if States.Notify and Unloaded == false then
				game.StarterGui:SetCore("ChatMakeSystemMessage",  { Text = "[NOTIFY]: "..PLAYER.Name.." has died!", Color = Color3.fromRGB(16, 243, 255), Font = Enum.Font.SourceSansBold, FontSize = Enum.FontSize.Size24 } )
			end
			if States.ChatNotify and Unloaded == false then
				Chat(PLAYER.Name.." has died!")
			end
		end)
	end)
end
function Respawn(PLAYER)
	PLAYER.CharacterAdded:Connect(function()
		if States.Notify and Unloaded == false then
			game.StarterGui:SetCore("ChatMakeSystemMessage",  { Text = "[NOTIFY]: "..PLAYER.Name.." has respawn!", Color = Color3.fromRGB(50, 14, 255), Font = Enum.Font.SourceSansBold, FontSize = Enum.FontSize.Size24 } )
		end
		if States.ChatNotify and not Unloaded then
			Chat(PLAYER.Name.." has respawn!")
		end
	end)
end
function NoCollide(PLR)
	if States.AntiFling and not Unloaded and PLR.Character then
		for _,x in pairs(PLR.Character:GetDescendants()) do
			if x:IsA("BasePart") and not Unloaded and States.AntiFling then
				x.CanCollide = false
			end
		end
	end
end
for _,v in pairs(game.Players:GetPlayers()) do
	 if v ~= game.Players.LocalPlayer then
		 local antifling = game:GetService('RunService').Stepped:connect(function()
			 NoCollide(v)
		 end)
	 end
 end
 game.Players.PlayerAdded:Connect(function()
	 if v ~= game.Players.LocalPlayer and antifling then
		 local antifling = game:GetService('RunService').Stepped:connect(function()
			NoCollide(v)
		 end)
	 end
 end)
for i,v in pairs(game.Players:GetPlayers()) do
	if v ~= plr then
		CopyChat(v)
		PickUp(v)
		Died(v)
		Respawn(v)
	end
end
TextBox.FocusLost:Connect(function(Key)
	if Key and Unloaded == false then
		if TextBox.Text:sub(1,#Prefix) ~= Prefix then
			PC(Prefix..TextBox.Text)
		else
			PC(TextBox.Text)
		end
	end
end)
game.Players.PlayerAdded:Connect(function(PLAYER)
	if States.Notify and Unloaded == false then
		game.StarterGui:SetCore("ChatMakeSystemMessage",  { Text = "[NOTIFY]: "..PLAYER.Name.." has joined the game!", Color = Color3.fromRGB(16, 243, 255), Font = Enum.Font.SourceSansBold, FontSize = Enum.FontSize.Size24 } )
	end
	if States.ChatNotify and not Unloaded then
		Chat(PLAYER.Name.." has joined the game!")
	end
	CopyChat(PLAYER)
	PickUp(PLAYER)
	Died(PLAYER)
	Respawn(PLAYER)
end)
game.Players.PlayerRemoving:Connect(function(PLAYER)
	if States.Notify and not Unloaded then
		game.StarterGui:SetCore("ChatMakeSystemMessage",  { Text = "[NOTIFY]: "..PLAYER.Name.." has left the game!", Color = Color3.fromRGB(50, 14, 255), Font = Enum.Font.SourceSansBold, FontSize = Enum.FontSize.Size24 } )
	end
	if States.ChatNotify and not Unloaded then
		Chat(PLAYER.Name.." has left the game!")
	end
	CopyChat(PLAYER)
	PickUp(PLAYER)
	Died(PLAYER)
	Respawn(PLAYER)
end)
Refresh()
Notif("Loads", "Loaded Admin Commands, Chat ;cmds to show commands list", 6)
Frame:TweenPosition(UDim2.new(0.5, 0, 0.899999998, 0)-UDim2.new(0,0,.05,0),"Out","Back",.5)
else
game:GetService("StarterGui"):SetCore("SendNotification", {Title = "Error", Text = "Septex Admin is already executed or game not support!", Duration = 7,})
end
