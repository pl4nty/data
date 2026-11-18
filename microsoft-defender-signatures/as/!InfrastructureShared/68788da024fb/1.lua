-- Threat: !InfrastructureShared
-- Name: 68788da024fb
-- Type: 21

local l_0_0 = mp.getfilesize()
if 500000 < l_0_0 then
  return mp.CLEAN
end
return mp.INFECTED
