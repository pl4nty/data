-- Threat: !InfrastructureShared
-- Name: 1b27f3f0b7d5
-- Type: 21

local l_0_0 = mp.getfilesize()
if 900 < l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
