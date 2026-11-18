-- Threat: !InfrastructureShared
-- Name: ab784df7b6d4
-- Type: 21

local l_0_0 = mp.getfilesize()
if 520000 <= l_0_0 and l_0_0 <= 600000 then
  return mp.INFECTED
end
return mp.CLEAN
