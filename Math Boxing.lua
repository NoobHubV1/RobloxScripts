game:GetService("StarterGui"):SetCore("SendNotification",{
                Title = "NoobHubV1 Hub";
                Text = "Auto Answer Enabled!";
                Duration = 3;
           })
local lp = game.Players.LocalPlayer

local chr = lp.Character

local hrp = chr.HumanoidRootPart

local ring = nil

local answering = game.ReplicatedStorage.Events.Answer

local prompt = nil

local oldText = ''

local coins = workspace.Coins

while wait() do

    ring = nil

    for _, v in pairs(workspace:GetChildren()) do --Auto answer

        if v.Name == "Ring" then

            if v.Player1.Value == lp or v.Player2.Value == lp then

                ring = v

                break

            end

        end

    end

    if ring == nil then

        for _, v in pairs(workspace:GetChildren()) do --Auto join

            if v.Name == "Ring" then

                if v.Prompt.ProximityPrompt.Enabled then

                    fireproximityprompt(v.Prompt.ProximityPrompt)

                    break

                end

            end

        end

    else

        pcall(function() --Auto answer

            prompt = ring.Prompt.BillboardGui.TextLabel

            if oldText ~= prompt.Text then

                answering:FireServer(loadstring('return '..string.gsub(string.sub(prompt.Text, 1, -4), "x", "*"))())

                oldText = prompt.Text

                wait(0.1)

            end

        end)

    end



    for _, v in pairs(coins:GetChildren()) do --Auto money

        if v.Name == 'Coin' then

            v.CanCollide = false

            v.CanTouch = true

            v.CFrame = hrp.CFrame

        end

    end

end
