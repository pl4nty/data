-- Threat: !InfrastructureShared
-- Name: 35782f9988a8
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 <= 50000 then
  return mp.INFECTED
end
return mp.CLEAN
