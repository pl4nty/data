-- Threat: !InfrastructureShared
-- Name: 312963db9c7f
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 100 then
  return mp.INFECTED
end
return mp.CLEAN
