-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a1b2_442.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if l_0_1 ~= nil and (string.find)(l_0_1, "mshta", 1, true) ~= nil and ((string.find)(l_0_1, ".hta", 1, true) == nil or (string.find)(l_0_1, "http", 1, true) ~= nil) then
  (MpCommon.RequestSmsOnProcess)(l_0_0, MpCommon.SMS_SCAN_MED)
end
return mp.CLEAN

