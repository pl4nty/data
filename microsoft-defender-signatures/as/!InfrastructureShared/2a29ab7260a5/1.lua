-- Threat: !InfrastructureShared
-- Name: 2a29ab7260a5
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 2000 then
  return mp.INFECTED
end
return mp.CLEAN
