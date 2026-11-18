-- Threat: !InfrastructureShared
-- Name: 4c780922d04b
-- Type: 21

local l_0_0 = mp.getfilesize()
if 1048576 < l_0_0 then
  return mp.CLEAN
end
return mp.INFECTED
