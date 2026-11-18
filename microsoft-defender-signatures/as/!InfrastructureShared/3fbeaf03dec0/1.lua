-- Threat: !InfrastructureShared
-- Name: 3fbeaf03dec0
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 920000 then
  return mp.INFECTED
end
return mp.CLEAN
