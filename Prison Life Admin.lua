Execution_Runtime = tick()
PLadmin_Settings = {
  DefaultPrefix = ";"; --The default prefix for pladmin
  JoinNotify = false; --Notify when a player joins
  AutoRespawn = true; --Automatically loadcharacter when dying
  AntiVoid = true; --Automatically teleport up when falling into void
  AntiTase = false; --Prevents you from being tased (100% no getconnections used because its absolute garbage)
  AntiArrest = false; --Prevents you from being arrested (100% no getconnections used because its absolute garbage)
  AntiShoot = false; --Kills player who tries to shoot you (Will be delayed if you have shitty ping, *COUGH* PLDT Users)
  AntiPunch = false; --Instantly kill players who try to punch you
  AntiFling = false; --Prevent exploiters from flinging you
  AntiShield = false; --stop pay2win people and bypass their shields
  AntiBring = false; --Prevent other exploiter(s) from bringing you
  SilentAim = false; --Makes you shoot without missing a target
  AutoGuns = false; --Automatically get all guns
  OldItemMethod = false; --Use teleport for getting items (USE THIS IF PRISON LIFE PATCHES THE TABLE METHOD)
  Fullbright = false; --Enable fullbrightness
  AutoWhitelist = true; --Automatically whitelist ranked players (DO NOT USE WHEN RANKING ALL PLAYERS)
  CrashCmds = true; --Allow crash commands for ranked
  GiveCmds = true; --Allow ranked players to give out commands to others
  NukeCmds = true; --Allow ranked players to use nuke commands (Very annoying)
  MultiCmd = true; --Allow ranked players to use the arguments: "all, and team", EX: ;kill all
  Output = true; --Chat the output commands of ranked players
  WhisperToRanked = true; --Use whisper for outputing commands for ranked players
  Force_isMobile = false; --Force mobile action gui (Punch and crawl buttons) if executor is too shitty and detected as "emulator"
};wait() --Fixed on libhydrogen!!!
loadstring(Game:HttpGet('https://gist.githubusercontent.com/NoobHubV1/7e8918b07a2130bf9bdce2fc53333a3b/raw/2192b83fa8a0d43c888d85e89a1e567f392f389e/Prison%20Life%20Admin%20Script.lua'))()
