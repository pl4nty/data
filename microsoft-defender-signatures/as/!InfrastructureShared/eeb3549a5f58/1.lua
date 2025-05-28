-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\eeb3549a5f58\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = this_sigattrlog[4]
if not l_0_0.matched or not l_0_0.ppid or not l_0_0.utf8p2 then
  return mp.CLEAN
end
local l_0_1 = {}
l_0_1["Trojan:Win64/Emotet.ZZ!sms"] = true
l_0_1["Trojan:Win32/Emotet.ZY!sms"] = true
l_0_1["Trojan:Win32/Qakbot.U!sms"] = true
l_0_1["TrojanDownloader:Win64/IcedID.ZZ!sms"] = true
l_0_1["TrojanDownloader:Win64/IcedID.ZW!sms"] = true
l_0_1["TrojanDownloader:Win64/IcedID.ZV!sms"] = true
l_0_1["Trojan:Win32/DarkGate.ZZ!sms"] = true
l_0_1["Trojan:Win32/DarkGate.ZY!sms"] = true
l_0_1["Trojan:Win32/DarkGate.ZX!sms"] = true
l_0_1["Trojan:Win32/PikaBot.ZZ!sms"] = true
l_0_1["HackTool:Win64/CobaltStrike.I!sms"] = true
l_0_1["Trojan:Win64/CobaltStrike.C!sms"] = true
l_0_1["HackTool:Win64/CobaltStrike.F!sms"] = true
l_0_1["HackTool:Win64/CobaltStrike.G!sms"] = true
l_0_1["HackTool:Win64/CobaltStrike.E!sms"] = true
l_0_1["VirTool:Win32/CobaltStrike.A"] = true
l_0_1["HackTool:Win64/CobaltStrike.K!sms"] = true
l_0_1["Trojan:Win64/Qakbot.A!sms"] = true
l_0_1["VirTool:Win32/Bruterat.A!sms"] = true
l_0_1["Trojan:Win32/Latrodectus.A!sms"] = true
l_0_1["Trojan:Win32/SystemBC.SA!sms"] = true
l_0_1["Backdoor:Win32/Coroxy.E!sms"] = true
l_0_1["Trojan:Win64/Shaolaod.A!sms"] = true
l_0_1["Trojan:Win32/Lummac.SD!sms"] = true
l_0_1["Trojan:Win32/Lummac.SDA!sms"] = true
l_0_1["Trojan:Win32/Lummac.SB!sms"] = true
l_0_1["Trojan:Win32/LummaStealer.STB!sms"] = true
l_0_1["Trojan:Win32/LummaStealer.STE!sms"] = true
l_0_1["Trojan:Win32/LummaStealer.STG!sms"] = true
l_0_1["Trojan:Win32/LummaStealer.Z!sms"] = true
if not l_0_1[l_0_0.utf8p2] then
  (bm.trigger_sig)("MaceNonVetted_Sig", tostring(l_0_0.utf8p2))
  return mp.CLEAN
end
local l_0_2 = (string.format)("DetectedRegions:%s", l_0_0.ppid)
local l_0_3 = GetRollingQueue(l_0_2)
if not l_0_3 or type(l_0_3) ~= "table" then
  return mp.CLEAN
end
local l_0_4 = 0
for l_0_8,l_0_9 in ipairs(l_0_3) do
  local l_0_10 = 32768
  for l_0_14 = 1, #l_0_9.value, l_0_10 do
    l_0_4 = l_0_4 + 1
    local l_0_15 = (string.format)("f09d0e89_%d", l_0_4)
    local l_0_16 = (string.sub)(l_0_9.value, l_0_14, l_0_14 + l_0_10 - 1)
    ;
    (bm.add_related_string)(l_0_15, l_0_16, bm.RelatedStringBMReport)
  end
  if l_0_4 == 0 then
    return mp.CLEAN
  end
  l_0_4 = l_0_4 + 1
  local l_0_17 = (string.format)("f09d0e89_%d", l_0_4)
  ;
  (bm.add_related_string)(l_0_17, ";", bm.RelatedStringBMReport)
end
if l_0_4 == 0 then
  return mp.CLEAN
end
;
(bm.add_related_string)("d9f18702", l_0_0.utf8p2, bm.RelatedStringBMReport)
return mp.INFECTED

