-- Threat: !InfrastructureShared
-- Name: !#ALF:Lua:Hacktool:Win64/AmsiDisable.A
-- Type: 13
-- Includes: PHelpers
-- MpAttributes: ALF:Hacktool:Win64/AmsiDisable.A

local l_0_0 = mp.getfilesize()
if l_0_0 <= 300 or 1000000 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = MpCommon.PathToWin32Path(mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE)))
if l_0_1 == nil then
  return mp.CLEAN
end
if true == IsInternetCache(l_0_1) or true == IsLowConfNPath(l_0_1) then
  return mp.CLEAN
end
if l_0_1:find("\\program files\\", 1, true) or l_0_1:find(":\\windows\\", 1, true) or l_0_1:find(":\\program files (x86)\\", 1, true) or l_0_1:find("\\device\\harddiskvolume", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
