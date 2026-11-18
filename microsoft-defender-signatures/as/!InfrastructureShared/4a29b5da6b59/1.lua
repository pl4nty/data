-- Threat: !InfrastructureShared
-- Name: 4a29b5da6b59
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 1000 then
  return mp.INFECTED
end
return mp.CLEAN
