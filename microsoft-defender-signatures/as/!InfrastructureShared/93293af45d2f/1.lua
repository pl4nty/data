-- Threat: !InfrastructureShared
-- Name: 93293af45d2f
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 2000 then
  return mp.INFECTED
end
return mp.CLEAN
