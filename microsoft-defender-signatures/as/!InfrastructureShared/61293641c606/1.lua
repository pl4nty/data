-- Threat: !InfrastructureShared
-- Name: 61293641c606
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 12000 then
  return mp.INFECTED
end
return mp.CLEAN
