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
for l_0_6,l_0_7 in ipairs(l_0_1) do
  if not (string.find)(l_0_7, "Detection:FriendlyFile", 1, true) and not (string.find)(l_0_7, "Exploit:", 1, true) and not (string.find)(l_0_7, "Virus:", 1, true) and not (string.find)(l_0_7, "Worm:Win32/Boychi", 1, true) then
    local l_0_8 = (string.sub)(l_0_7, (string.find)(l_0_7, ":", 1, true) + 1)
    ;
    (table.insert)(l_0_2, l_0_8)
  end
end
if #l_0_2 ~= 0 then
  l_0_2 = (table.concat)(l_0_2, ";")
  ;
  (MpCommon.BmTriggerSig)(l_0_0, "SmsScanDetection", l_0_2)
end
return mp.CLEAN

