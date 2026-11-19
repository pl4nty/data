-- Threat: !InfrastructureShared
-- Name: 7f78fa00e4f1
-- Type: 21

local l_0_0 = mp.getfilesize()
if 1500000 < l_0_0 or l_0_0 < 1000 then
  return mp.CLEAN
end
return mp.INFECTED
