-- Threat: !InfrastructureShared
-- Name: 7d78b95c9a34
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security and l_0_0 < 458752 then
  return mp.INFECTED
end
return mp.CLEAN
