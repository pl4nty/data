-- Threat: !InfrastructureShared
-- Name: 24296b5eec55
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 1000 then
  return mp.INFECTED
end
return mp.CLEAN
