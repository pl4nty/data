-- Threat: !InfrastructureShared
-- Name: !#Lua:RenamedAutoit.A
-- Type: 11
-- Includes: LuaFuncHelper
-- MpAttributes: RPF:TopLevelFile & (SLF:Win32/SuspAutoit3.A | SLF:Win32/SuspAutoit3.B | SLF:Win32/SuspAutoit3.C)

local l_0_0 = MpCommon.PathToWin32Path(mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE)))
if l_0_0 == nil then
  return mp.CLEAN
end
if string.sub(l_0_0, 0, 4) == "\\\\?\\" then
  l_0_0 = string.sub(l_0_0, 5)
end
MpCommon.SetOriginalFileName(l_0_0, "autoit3.exe")
if not IsKeyInRollingQueue("RenamedAutoitPath", string.lower(l_0_0), true) then
  AppendToRollingQueue("RenamedAutoitPath", string.lower(l_0_0))
end
return mp.INFECTED
