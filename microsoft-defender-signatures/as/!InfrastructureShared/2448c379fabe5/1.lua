-- Threat: !InfrastructureShared
-- Name: 2448c379fabe5
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 5242880 then
  return mp.INFECTED
end
return mp.CLEAN
