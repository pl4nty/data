-- Threat: !InfrastructureShared
-- Name: 3c782686e9c1
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 == 204804 then
  return mp.INFECTED
end
return mp.CLEAN
