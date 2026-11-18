-- Threat: !InfrastructureShared
-- Name: 1148cfcdee98f
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 30720 then
  return mp.INFECTED
end
return mp.CLEAN
