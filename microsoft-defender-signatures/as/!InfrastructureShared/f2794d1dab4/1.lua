-- Threat: !InfrastructureShared
-- Name: f2794d1dab4
-- Type: 21

local l_0_0 = mp.getfilesize()
if 900 < l_0_0 and l_0_0 < 1048576 then
  return mp.INFECTED
end
return mp.CLEAN
