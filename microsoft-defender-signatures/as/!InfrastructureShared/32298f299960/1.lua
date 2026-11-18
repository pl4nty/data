-- Threat: !InfrastructureShared
-- Name: 32298f299960
-- Type: 21

local l_0_0 = mp.getfilesize()
if 122880 < l_0_0 then
  return mp.CLEAN
end
return mp.INFECTED
