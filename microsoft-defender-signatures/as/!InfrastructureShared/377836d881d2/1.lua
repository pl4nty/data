-- Threat: !InfrastructureShared
-- Name: 377836d881d2
-- Type: 21

local l_0_0 = mp.getfilesize()
if 400000 < l_0_0 and l_0_0 < 999000 then
  return mp.INFECTED
end
return mp.CLEAN
