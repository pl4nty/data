-- Threat: !InfrastructureShared
-- Name: 6f8cf913fa02
-- Type: 21

local l_0_0 = mp.getfilesize()
if 196608 < l_0_0 then
  return mp.CLEAN
end
return mp.INFECTED
