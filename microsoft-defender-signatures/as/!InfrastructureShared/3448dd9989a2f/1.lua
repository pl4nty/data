-- Threat: !InfrastructureShared
-- Name: 3448dd9989a2f
-- Type: 21

if not mp.get_mpattribute("Lua:ZIPExt") and not mp.get_mpattribute("RPF:TopLevelFile") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0:find("\\usr\\lib\\system", 1, true) then
  return mp.CLEAN
end
if l_0_0:find("/usr/lib/system", 1, true) then
  return mp.CLEAN
end
if l_0_0:find("backup", 1, true) then
  return mp.CLEAN
end
if l_0_0:find("recovery", 1, true) then
  return mp.CLEAN
end
if l_0_0:find("restore", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
