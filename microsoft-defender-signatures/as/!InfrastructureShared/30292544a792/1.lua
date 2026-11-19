-- Threat: !InfrastructureShared
-- Name: 30292544a792
-- Type: 21

local l_0_0 = mp.getfilesize()
if 9472 < l_0_0 then
  return mp.INFECTED
end
return mp.LOWFI
