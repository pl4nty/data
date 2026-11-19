-- Threat: !InfrastructureShared
-- Name: 2db3d1dadca2
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
end
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil and this_sigattrlog[2].utf8p1 ~= "" then
  local l_0_1 = this_sigattrlog[2].utf8p1
  if sysio.IsFileExists(l_0_1) then
    bm.add_related_file(l_0_1)
  end
end
local l_0_2 = {
  ["ALFPER:Trojan:Win64/BlacklineAssault.A!dha"] = true,
  ["ALFPER:Trojan:Win64/RepbayLoader.A!dha"] = true,
  ["SLF:Trojan:Win32/KorplugLdr.A!dha"] = true,
  ["SLF:Backdoor:Win64/Capybara.C!dha"] = true,
  ["ALFPER:Trojan:Win64/ToggleFrog.A!dha"] = true,
  ["ALFPER:Trojan:Win64/ThornGate.B!dha"] = true,
  ["ALFPER:Trojan:Win64/OpenUp.A!dha"] = true,
  ["ALFPER:Trojan:Win64/DoubleMic.A!dha"] = true,
  ["ALFPER:Trojan:Win64/CloudyMole.A!dha"] = true,
  ["ALFPER:Trojan:Win32/MoonlitBanjo.A!dha"] = true,
  ["ALFPER:Trojan:Win32/BilboClaws.A!dha"] = true,
  ["ALFPER:Backdoor:Win32/ChargeBolt.A!dha"] = true,
  ["ALF:Trojan:Win64/ZooFang.DE!dha"] = true,
  ["ALF:Trojan:Win64/WindyBison.E!dha"] = true,
  ["ALF:Trojan:Win64/WillowOrgan.A!dha"] = true,
  ["ALF:Trojan:Win64/TinlapFeast.A!dha"] = true,
  ["ALF:Trojan:Win64/SysdupateSeed.A!dha"] = true,
  ["ALF:Trojan:Win64/SplitLoader.E!dha"] = true,
  ["ALF:Trojan:Win64/SplatLoader.H!dha"] = true,
  ["ALF:Trojan:Win64/SlickMyth.B!dha"] = true,
  ["ALF:Trojan:Win64/EphemeralTrinket.A!dha"] = true,
  ["ALF:Trojan:Win64/EternityScepter.A!dha"] = true,
  ["ALF:Trojan:Win32/AlfieSore.H!dha"] = true,
  ["ALFPER:TrojanDownloader:Win64/NiceFoxie.B!dha"] = true,
  ["ALFPER:Trojan:Win64/SolarPaper.A!dha"] = true,
  ["ALFPER:Trojan:Win32/WlbsctrlHijack.A!dha"] = true,
  ["ALFPER:Trojan:Win32/MildewMongoose.A!dha"] = true,
  ["ALF:Trojan:Win64/PartyLoader.A!dha"] = true,
  ["ALF:Trojan:Win64/GlassCanLoader.A!dha"] = true,
  ["ALF:Trojan:Win64/BlueLagoon.B!dha"] = true
}
if l_0_2[l_0_0] then
  bm.trigger_sig("Behavior:Win32/SuspMemModuleLoad.A!dha", l_0_0)
end
bm.add_related_string("vname", l_0_0, bm.RelatedStringBMReport)
bm.trigger_sig_self_propagate("SuspChildProcessLaunch", l_0_0)
return mp.INFECTED
