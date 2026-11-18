-- Threat: !InfrastructureShared
-- Name: 44294678c8ea
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 2500 then
  return mp.INFECTED
end
return mp.CLEAN
