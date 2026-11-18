-- Threat: !InfrastructureShared
-- Name: 95781196599f
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 18000000 or 26000000 < l_0_0 then
  return mp.CLEAN
end
return mp.INFECTED
