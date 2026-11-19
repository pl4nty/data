-- Threat: !InfrastructureShared
-- Name: 3c29fc93bf59
-- Type: 21

local l_0_0 = mp.getfilesize()
if 9472 < l_0_0 then
  return mp.INFECTED
end
return mp.LOWFI
