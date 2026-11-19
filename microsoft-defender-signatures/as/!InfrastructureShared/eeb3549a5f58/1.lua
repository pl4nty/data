-- Threat: !InfrastructureShared
-- Name: eeb3549a5f58
-- Type: 21
-- Includes: LuaFuncHelper, BMLuaLib

local l_0_0 = this_sigattrlog[4]
if not (l_0_0.matched and l_0_0.ppid) or not l_0_0.utf8p2 then
  return mp.CLEAN
end
local l_0_1 = {
  ["Trojan:Win64/Emotet.ZZ!sms"] = true,
  ["Trojan:Win32/Emotet.ZY!sms"] = true,
  ["Trojan:Win32/Qakbot.U!sms"] = true,
  ["TrojanDownloader:Win64/IcedID.ZZ!sms"] = true,
  ["TrojanDownloader:Win64/IcedID.ZW!sms"] = true,
  ["TrojanDownloader:Win64/IcedID.ZV!sms"] = true,
  ["Trojan:Win32/DarkGate.ZZ!sms"] = true,
  ["Trojan:Win32/DarkGate.ZY!sms"] = true,
  ["Trojan:Win32/DarkGate.ZX!sms"] = true,
  ["Trojan:Win32/PikaBot.ZZ!sms"] = true,
  ["HackTool:Win64/CobaltStrike.I!sms"] = true,
  ["Trojan:Win64/CobaltStrike.C!sms"] = true,
  ["HackTool:Win64/CobaltStrike.F!sms"] = true,
  ["HackTool:Win64/CobaltStrike.G!sms"] = true,
  ["HackTool:Win64/CobaltStrike.E!sms"] = true,
  ["VirTool:Win32/CobaltStrike.A"] = true,
  ["HackTool:Win64/CobaltStrike.K!sms"] = true,
  ["Trojan:Win64/Qakbot.A!sms"] = true,
  ["VirTool:Win32/Bruterat.A!sms"] = true,
  ["Trojan:Win32/Latrodectus.A!sms"] = true,
  ["Trojan:Win32/SystemBC.SA!sms"] = true,
  ["Backdoor:Win32/Coroxy.E!sms"] = true,
  ["Trojan:Win64/Shaolaod.A!sms"] = true,
  ["Trojan:Win32/Lummac.SD!sms"] = true,
  ["Trojan:Win32/Lummac.SDA!sms"] = true,
  ["Trojan:Win32/Lummac.SB!sms"] = true,
  ["Trojan:Win32/LummaStealer.STB!sms"] = true,
  ["Trojan:Win32/LummaStealer.STE!sms"] = true,
  ["Trojan:Win32/LummaStealer.STG!sms"] = true,
  ["Trojan:Win32/LummaStealer.Z!sms"] = true,
  ["Trojan:Win32/Zloader.B!sms"] = true,
  ["Trojan:Win32/Amadey.Y!sms"] = true,
  ["Trojan:Win64/Amadey.Y!sms"] = true,
  ["Trojan:Win32/Amadey.Z!sms"] = true,
  ["Trojan:Win64/Amadey.Z!sms"] = true,
  ["Trojan:Win32/Amadey.ZZ!sms"] = true,
  ["Trojan:Win64/Amadey.ZZ!sms"] = true,
  ["Trojan:Win64/Stealc.ZZ!sms"] = true,
  ["Trojan:Win64/Stealc.ZY!sms"] = true,
  ["PWS:Win64/StealC.STA!sms"] = true,
  ["Trojan:Win64/Petwosel.A!sms"] = true,
  ["Trojan:Win64/Vidar.SB!sms"] = true,
  ["Trojan:Win64/RemusStealer.ZZ!sms"] = true
}
local l_0_2 = true
if not l_0_1[l_0_0.utf8p2] then
  l_0_2 = false
end
if not l_0_2 then
  local l_0_3 = mp.SIGATTR_LOG_SZ
  for l_0_4 = l_0_3, 1, -1 do
    if sigattr_tail[l_0_4].attribute == 16491 and sigattr_tail[l_0_4].utf8p1 == "SmsScanDetection" then
      local l_0_5 = sigattr_tail[l_0_4].utf8p2:lower()
      if l_0_5 then
        local l_0_6 = {
          "trojan:win64/stealc.zy"
        }
        if contains(l_0_5, l_0_6) then
          l_0_2 = true
          break
        end
      end
    end
  end
end
if not l_0_2 then
  bm.trigger_sig("MaceNonVetted_Sig", tostring(l_0_0.utf8p2))
  return mp.CLEAN
end
local l_0_7 = string.format("DetectedRegions:%s", l_0_0.ppid)
local l_0_8 = GetRollingQueue(l_0_7)
if not l_0_8 or type(l_0_8) ~= "table" then
  return mp.CLEAN
end
local l_0_9 = 0
for l_0_10, l_0_11 in ipairs(l_0_8) do
  local l_0_12 = 29696
  for l_0_13 = 1, #l_0_11.value, l_0_12 do
    l_0_9 = l_0_9 + 1
    local l_0_14 = string.format("f09d0e89_%d", l_0_9)
    local l_0_15 = string.sub(l_0_11.value, l_0_13, l_0_13 + l_0_12 - 1)
    bm.add_related_string(l_0_14, l_0_15, bm.RelatedStringBMReport)
  end
  if l_0_9 == 0 then
    return mp.CLEAN
  end
  l_0_9 = l_0_9 + 1
  local l_0_16 = string.format("f09d0e89_%d", l_0_9)
  bm.add_related_string(l_0_16, ";", bm.RelatedStringBMReport)
end
if l_0_9 == 0 then
  return mp.CLEAN
end
bm.add_related_string("d9f18702", l_0_0.utf8p2, bm.RelatedStringBMReport)
return mp.INFECTED
