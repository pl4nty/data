-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:Win32/GreenLagoon.X!dha
-- Type: 13
-- Includes: BMLuaLib
-- MpAttributes: Lua:Context/FileInADS.A

local l_0_0 = MpCommon.PathToWin32Path(mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE)))
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = {
  "setlang.exe:go.exe",
  "setlang.exe:goloc.dll"
}
if contains(l_0_0, l_0_1) then
  return mp.INFECTED
end
return mp.CLEAN
