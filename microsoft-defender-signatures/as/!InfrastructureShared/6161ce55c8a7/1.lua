-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\6161ce55c8a7\1.luac 

-- params : ...
-- function num : 0
if (mp.GetHSTRCallerId)() ~= mp.HSTR_CALLER_SMS then
  return mp.CLEAN
end
local l_0_0 = (mp.GetScannedPPID)()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = (mp.enum_mpattributesubstring)("Detection:")
if #l_0_1 == 0 or l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = {}
l_0_2["Trojan:Win32/Zloader.B"] = true
l_0_2["Trojan:Win64/Merlin.A!dha"] = true
l_0_2["Trojan:Win32/Astaroth.ZZ"] = true
l_0_2["Trojan:Win32/ReflectiveLoaderArtifact.A"] = true
l_0_2["Trojan:Win64/ReflectiveLoaderArtifact.A"] = true
l_0_2["Trojan:Win64/Cipduk.STA"] = true
local l_0_3 = {}
for l_0_7,l_0_8 in ipairs(l_0_1) do
  if not (string.find)(l_0_8, "Detection:FriendlyFile", 1, true) and not (string.find)(l_0_8, "Exploit:", 1, true) and not (string.find)(l_0_8, "Virus:", 1, true) and not (string.find)(l_0_8, "Rogue:", 1, true) and not (string.find)(l_0_8, "Dialer:", 1, true) and not (string.find)(l_0_8, "PWS:", 1, true) then
    local l_0_9 = (string.sub)(l_0_8, (string.find)(l_0_8, ":", 1, true) + 1)
    if not l_0_2[l_0_9] then
      (table.insert)(l_0_3, l_0_9)
    end
  end
end
if #l_0_3 ~= 0 then
  if #l_0_3 >= 10 then
    return mp.CLEAN
  end
  l_0_3 = (table.concat)(l_0_3, ";")
  ;
  (MpCommon.BmTriggerSig)(l_0_0, "SmsScanDetection", l_0_3)
end
return mp.CLEAN

