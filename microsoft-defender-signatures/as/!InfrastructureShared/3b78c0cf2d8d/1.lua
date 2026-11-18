-- Threat: !InfrastructureShared
-- Name: 3b78c0cf2d8d
-- Type: 21

local l_0_0 = mp.getfilesize()
if 2340765 <= l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
