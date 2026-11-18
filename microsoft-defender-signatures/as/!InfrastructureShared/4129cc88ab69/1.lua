-- Threat: !InfrastructureShared
-- Name: 4129cc88ab69
-- Type: 21

local l_0_0 = mp.getfilesize()
if 512 <= l_0_0 and l_0_0 <= 2048 then
  return mp.INFECTED
end
return mp.CLEAN
