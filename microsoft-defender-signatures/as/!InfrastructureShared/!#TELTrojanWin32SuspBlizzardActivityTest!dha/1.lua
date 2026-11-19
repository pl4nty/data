-- Threat: !InfrastructureShared
-- Name: !#TEL:Trojan:Win32/SuspBlizzardActivity.Test!dha
-- Type: 29

local l_0_0 = {
  "ALF:Backdoor:Script/FunkyPost.A!dha",
  "ALF:Backdoor:Win32/Kazuar.J!dha ",
  "ALF:HackTool:MSIL/NetPeek.A!dha",
  "ALF:HackTool:Script/MofAssemblyLoad.A!dha",
  "ALF:Trojan:MSIL/FlashInfect.C!dha",
  "ALF:Trojan:MSIL/NumbTrader.A!dha",
  "ALF:Trojan:MSIL/ShadowLoader.A!dha",
  "ALF:Trojan:Win32/FlashInfect.A!dha",
  "ALF:Trojan:Win32/Kazuar.H!dha",
  "ALF:Trojan:Win32/KrypticWarp!dha",
  "ALF:Trojan:Win32/TripWary.C!dha",
  "ALF:Trojan:Win32/TripWary.D!dha",
  "ALF:Trojan:Win64/ApolloShadow.A!dha",
  "ALF:Trojan:Win64/Kazuar.G!dha",
  "ALFPER:Backdoor:Win64/VaporHaze.A!dha",
  "ALFPER:Backdoor:Win64/VaporRage.R!dha",
  "ALFPER:Backdoor:Win64/Wineloader.B!dha",
  "ALFPER:Backdoor:Win64/Wineloader.C!dha",
  "ALFPER:Trojan:Win64/VaporRage.Q!dha",
  "SLF:Trojan:Win32/VaporRage.D!dha",
  "TEL:Backdoor:Win32/Kazuar.I"
}
for l_0_1, l_0_2 in ipairs(l_0_0) do
  if mp.get_mpattribute(l_0_2) then
    return mp.INFECTED
  end
end
return mp.CLEAN
