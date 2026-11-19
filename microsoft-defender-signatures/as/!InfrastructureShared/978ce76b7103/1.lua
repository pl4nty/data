-- Threat: !InfrastructureShared
-- Name: 978ce76b7103
-- Type: 21

local l_0_0 = mp.getfilesize()
if 196608 < l_0_0 then
  return mp.CLEAN
end
return mp.INFECTED
