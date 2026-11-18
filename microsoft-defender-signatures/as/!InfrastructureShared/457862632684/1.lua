-- Threat: !InfrastructureShared
-- Name: 457862632684
-- Type: 21

local l_0_0 = mp.getfilesize()
if 1048576 < l_0_0 then
  return mp.CLEAN
end
return mp.INFECTED
