-- Threat: !InfrastructureShared
-- Name: !#AGGR:PyInstExclusions
-- Type: 13
-- Includes: BMLuaLib
-- MpAttributes: Lua:CloudBlockLevelGT3 & HSTR:PyInstaller

if mp.get_mpattribute("GenericAllowlist") then
  return mp.INFECTED
end
local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = {
  "docker-compose.exe",
  "docker-compose-Windows-x86_64",
  "dbRecord",
  "iotedgehubdev"
}
if contains(l_0_0, l_0_1) then
  return mp.INFECTED
end
return mp.CLEAN
