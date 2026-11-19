-- Threat: \xcc!Bruterat.SA
-- Type: 13
-- Includes: BMLuaLib
-- MpAttributes: Lua:TopLevelUnsigned & BM_MZ_FILE & (ALFPER:RefLoadApiHash | ALF:Trojan:Win32/ReflectiveApiHashes.A | SLF:MeterRefLoadApiHash)

local l_0_0 = MpCommon.PathToWin32Path(mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE)))
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = GetFileName(l_0_0)
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
if not contains(l_0_1, "badger_") then
  return mp.CLEAN
end
if mp.IsKnownFriendlyFile(l_0_0, true, false) then
  return mp.CLEAN
end
local l_0_2 = {
  "_x86",
  "_x64",
  "_svc"
}
if contains(l_0_1, l_0_2) then
  return mp.INFECTED
end
return mp.CLEAN
