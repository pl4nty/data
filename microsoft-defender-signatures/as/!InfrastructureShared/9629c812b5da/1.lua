-- Threat: !InfrastructureShared
-- Name: 9629c812b5da
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 6000 then
  return mp.INFECTED
end
return mp.CLEAN
