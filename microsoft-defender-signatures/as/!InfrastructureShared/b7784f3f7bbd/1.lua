-- Threat: !InfrastructureShared
-- Name: b7784f3f7bbd
-- Type: 21

local l_0_0 = mp.getfilesize()
if 30000 < l_0_0 then
  return mp.CLEAN
end
return mp.INFECTED
