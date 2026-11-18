-- Threat: !InfrastructureShared
-- Name: 2b29b5e5e2ec
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 10000 then
  return mp.INFECTED
end
return mp.CLEAN
