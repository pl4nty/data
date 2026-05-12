-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\6ed7780852e1\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (MpCommon.GetImagePathFromPid)(l_0_0)
if l_0_1 == nil or #l_0_1 <= 4 then
  return mp.CLEAN
end
l_0_1 = normalize_path(l_0_1)
if StringEndsWith(l_0_1, "\\node.exe") and (string.find)(l_0_1, "\\windows\\system32\\", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN

