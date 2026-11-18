-- Threat: !InfrastructureShared
-- Name: 71be42ac3f09
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 8400 then
  return mp.INFECTED
end
return mp.CLEAN
