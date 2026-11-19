-- Threat: !InfrastructureShared
-- Name: 778fcc308305
-- Type: 21

local l_0_0 = mp.getfilesize()
if 204800 < l_0_0 then
  return mp.CLEAN
end
return mp.INFECTED
