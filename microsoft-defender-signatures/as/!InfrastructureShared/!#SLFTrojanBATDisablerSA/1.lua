-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:BAT/Disabler.SA
-- Type: 13
-- Includes: BMLuaLib
-- MpAttributes: Lua:BatFileInWindowsFolder

local l_0_0 = MpCommon.PathToWin32Path(mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE)))
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = {
  ":\\windows\\open.bat",
  ":\\windows\\av.bat"
}
if contains(l_0_0, l_0_1) then
  return mp.INFECTED
end
return mp.CLEAN
