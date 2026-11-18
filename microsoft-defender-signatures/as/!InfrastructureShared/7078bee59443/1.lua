-- Threat: !InfrastructureShared
-- Name: 7078bee59443
-- Type: 21

local l_0_0 = mp.getfilesize()
if 500000 < l_0_0 and l_0_0 < 1500000 then
  return mp.INFECTED
end
return mp.CLEAN
