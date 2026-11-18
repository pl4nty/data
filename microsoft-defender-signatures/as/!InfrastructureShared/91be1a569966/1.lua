-- Threat: !InfrastructureShared
-- Name: 91be1a569966
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 7000 then
  return mp.INFECTED
end
return mp.CLEAN
