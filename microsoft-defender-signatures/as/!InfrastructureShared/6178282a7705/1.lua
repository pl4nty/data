-- Threat: !InfrastructureShared
-- Name: 6178282a7705
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 1638400 <= l_0_0 and l_0_0 <= 1769472 then
  return mp.INFECTED
end
return mp.LOWFI
