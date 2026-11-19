-- Threat: !InfrastructureShared
-- Name: 7c78e2c46b69
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 512000 then
  return mp.INFECTED
end
return mp.CLEAN
