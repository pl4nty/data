-- Threat: !InfrastructureShared
-- Name: b07864edb689
-- Type: 21

local l_0_0 = mp.getfilesize()
if 126976 < l_0_0 and l_0_0 < 196608 then
  return mp.INFECTED
end
return mp.CLEAN
