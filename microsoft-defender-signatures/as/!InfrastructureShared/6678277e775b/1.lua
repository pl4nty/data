-- Threat: !InfrastructureShared
-- Name: 6678277e775b
-- Type: 21

local l_0_0 = mp.getfilesize()
if 1000000 < l_0_0 or l_0_0 < 4000 then
  return mp.CLEAN
end
return mp.INFECTED
