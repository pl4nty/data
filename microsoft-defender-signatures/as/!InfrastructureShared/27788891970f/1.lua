-- Threat: !InfrastructureShared
-- Name: 27788891970f
-- Type: 21

local l_0_0 = mp.getfilesize()
if 15728640 < l_0_0 then
  return mp.CLEAN
end
return mp.INFECTED
