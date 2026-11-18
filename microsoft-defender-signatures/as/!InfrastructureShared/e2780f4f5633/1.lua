-- Threat: !InfrastructureShared
-- Name: e2780f4f5633
-- Type: 21

local l_0_0 = mp.getfilesize()
if 800000 < l_0_0 and l_0_0 < 1200000 then
  return mp.INFECTED
end
return mp.CLEAN
