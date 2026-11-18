-- Threat: !InfrastructureShared
-- Name: c47862e1eff3
-- Type: 21

if peattributes.isdll then
  return mp.CLEAN
end
if not mp.get_mpattribute("RPF:TopLevelFile") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0:find("cldapi.dll", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
