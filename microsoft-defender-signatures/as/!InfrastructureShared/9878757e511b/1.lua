-- Threat: !InfrastructureShared
-- Name: 9878757e511b
-- Type: 21

local l_0_0 = mp.getfilesize()
if 200000 < l_0_0 or l_0_0 < 150000 then
  return mp.CLEAN
end
return mp.INFECTED
