-- Threat: !InfrastructureShared
-- Name: d978ab8266a3
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 1500000 and 50000 < l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
