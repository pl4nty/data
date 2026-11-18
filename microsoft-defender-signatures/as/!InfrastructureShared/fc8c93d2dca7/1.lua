-- Threat: !InfrastructureShared
-- Name: fc8c93d2dca7
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 1048576 then
  return mp.INFECTED
end
return mp.CLEAN
