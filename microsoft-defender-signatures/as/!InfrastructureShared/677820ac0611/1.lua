-- Threat: !InfrastructureShared
-- Name: 677820ac0611
-- Type: 21

local l_0_0 = mp.getfilesize()
if 460800 < l_0_0 or l_0_0 < 768000 then
  return mp.CLEAN
end
return mp.INFECTED
