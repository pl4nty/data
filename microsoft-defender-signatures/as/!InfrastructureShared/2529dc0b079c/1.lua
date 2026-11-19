-- Threat: !InfrastructureShared
-- Name: 2529dc0b079c
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 2097152 and 1769472 < l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
