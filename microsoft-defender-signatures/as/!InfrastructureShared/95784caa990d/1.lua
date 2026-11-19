-- Threat: !InfrastructureShared
-- Name: 95784caa990d
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 250000 or 800000 < l_0_0 then
  return mp.CLEAN
end
return mp.INFECTED
