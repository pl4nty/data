-- Threat: !InfrastructureShared
-- Name: 6161ce55c8a7
-- Type: 21

if mp.GetHSTRCallerId() ~= mp.HSTR_CALLER_SMS then
  return mp.CLEAN
end
local l_0_0 = mp.GetScannedPPID()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.enum_mpattributesubstring("Detection:")
if #l_0_1 ~= 0 and l_0_1 ~= nil then
  local l_0_2 = {
    ["Trojan:Win32/Zloader.B"] = true,
    ["Trojan:Win64/Merlin.A!dha"] = true,
    ["Trojan:Win32/Astaroth.ZZ"] = true,
    ["Trojan:Win32/ReflectiveLoaderArtifact.A"] = true,
    ["Trojan:Win64/ReflectiveLoaderArtifact.A"] = true,
    ["Trojan:Win64/Cipduk.STA"] = true,
    ["Trojan:Win32/SuspNextJsRscDeserRce.A!sms"] = true,
    ["Trojan:Win32/GenMalAI.AI!sms"] = true
  }
  local l_0_3 = {}
  for l_0_4, l_0_5 in ipairs(l_0_1) do
    if not string.find(l_0_5, "Detection:FriendlyFile", 1, true) and not string.find(l_0_5, "Exploit:", 1, true) and not string.find(l_0_5, "Virus:", 1, true) and not string.find(l_0_5, "Rogue:", 1, true) and not string.find(l_0_5, "Dialer:", 1, true) and not string.find(l_0_5, "PWS:", 1, true) then
      local l_0_6 = string.sub(l_0_5, string.find(l_0_5, ":", 1, true) + 1)
      if not l_0_2[l_0_6] then
        table.insert(l_0_3, l_0_6)
      end
    end
  end
  if #l_0_3 ~= 0 and #l_0_3 <= 10 then
    l_0_3 = table.concat(l_0_3, ";")
    MpCommon.BmTriggerSig(l_0_0, "SmsScanDetection", l_0_3)
  end
end
local l_0_7 = mp.enum_mpattributesubstring("Suspicious:")
if #l_0_7 == 0 or l_0_7 == nil then
  return mp.CLEAN
end
local l_0_8 = {}
for l_0_9, l_0_10 in ipairs(l_0_7) do
  local l_0_11 = string.sub(l_0_10, string.find(l_0_10, ":", 1, true) + 1)
  table.insert(l_0_8, l_0_11)
end
if #l_0_8 ~= 0 and #l_0_8 <= 10 then
  l_0_8 = table.concat(l_0_8, ";")
  MpCommon.BmTriggerSig(l_0_0, "SmsScanSuspicious", l_0_8)
end
return mp.CLEAN
