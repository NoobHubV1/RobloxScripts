local v0={[{3019335204}]="Furry%20Infection",[{4807308814}]="Break%20In%202%20Story",[{1701332290}]="Field%20Trip%20Z",[{47545}]="Work%20At%20A%20Pizza%20Place",[{1318971886}]="Break%20In%20Story",[{4834449429}]="Radiant%20Residents",[{5120885191}]="Anime%20Ball",[{1119466531}]="Legends%20Of%20Speed",[{1237829262}]="Magnet%20Simulator",[{1742953490}]="Cruise%20Story",[{301252049}]="RoBeats",[{2135430017}]="Wormface",[{5166944221}]="Death%20Ball",[{73885730}]="Tiger%20Admin"};local v1=nil;for v2,v3 in pairs(v0) do if (table.find(v2,game.PlaceId) or table.find(v2,game.CreatorId) or table.find(v2,game.GameId)) then v1=v3;break;end end if v1 then loadstring(game:HttpGet("https://raw.githubusercontent.com/NoobHubV1/RobloxScripts/main/"   .. v1   .. ".lua" ))();else game.Players.LocalPlayer:Kick("No script found for this game");end
