-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:PowerShell/FuzzedTank.A!dha
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & Lua:PS1Ext & Lua:FileInsideAppDataLocalTempFolder

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = string.match(l_0_0, "([^\\]+)$")
if l_0_1 == nil then
  return mp.CLEAN
end
if not string.find(l_0_1, "^chrome%-%d%d%d%d%.ps1$") then
  return mp.CLEAN
end
return mp.INFECTED
