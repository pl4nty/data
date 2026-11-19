-- Threat: !InfrastructureShared
-- Name: b678e3f7a0e3
-- Type: 21

local l_0_0 = mp.getfilesize()
if 15000000 < l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
