-- Threat: !InfrastructureShared
-- Name: 65b376851fd7
-- Type: 21
-- Includes: BMLuaLib

if versioning.GetEngineBuild() < 16700 then
  return mp.CLEAN
end
local l_0_0 = versioning.GetOrgID()
if isnull(l_0_0) then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
return mp.INFECTED
