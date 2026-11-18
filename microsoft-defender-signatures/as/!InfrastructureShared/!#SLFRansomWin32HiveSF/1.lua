-- Threat: !InfrastructureShared
-- Name: !#SLF:Ransom:Win32/Hive.SF
-- Type: 24
-- Includes: BMLuaLib, LuaFuncHelper
-- MpAttributes: BM_MZ_FILE & RPF:TopLevelFile

local l_0_0 = MpCommon.PathToWin32Path(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
if l_0_0 == nil or #l_0_0 < 9 then
  return mp.CLEAN
end
l_0_0 = l_0_0:lower()
if not StringEndsWith(l_0_0, "\\xxx.exe") then
  return mp.CLEAN
end
local l_0_1 = {
  ":\\programdata\\",
  ":\\perflogs\\",
  ":\\users\\public\\",
  "\\music\\",
  ":windows\\temp\\",
  "\\share$\\",
  "\\c$\\"
}
if contains(l_0_0, l_0_1) then
  return mp.INFECTED
end
return mp.CLEAN
