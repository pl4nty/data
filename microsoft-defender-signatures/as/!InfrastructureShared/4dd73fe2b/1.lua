-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\4dd73fe2b\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (MpCommon.GetImagePathFromPid)(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
if not (MpCommon.QueryPersistContextNoPath)("isRebootDangerous", "GrubTampering.A") then
  return mp.CLEAN
end
if (string.find)(l_0_1, "/usr/bin/systemctl", 1, true) or (string.find)(l_0_1, "/usr/bin/sudo", 1, true) then
  return mp.LOWFI
end
return mp.CLEAN

