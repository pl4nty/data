-- Threat: !InfrastructureShared
-- Name: !#Lua:WinRMToolLocationContext.A
-- Type: 12
-- Includes: WinRMSessionInfra
-- MpAttributes: RPF:TopLevelFile & Lua:Context/WinRMToolLocationCandidate.A

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1, l_0_2 = IsWinRMToolLocationContext(l_0_0)
if l_0_1 == true and l_0_2 ~= nil and 0 < #l_0_2 then
  mp.set_mpattribute("Lua:Context/WinRMToolLocationContext.A!" .. l_0_2)
  return mp.INFECTED
end
return mp.CLEAN
