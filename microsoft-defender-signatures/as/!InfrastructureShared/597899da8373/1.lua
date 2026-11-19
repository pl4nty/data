-- Threat: !InfrastructureShared
-- Name: 597899da8373
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 1400000 then
  return mp.INFECTED
end
return mp.CLEAN
