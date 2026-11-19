-- Threat: !InfrastructureShared
-- Name: 7e29bd38fc16
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 3000 then
  return mp.INFECTED
end
return mp.CLEAN
