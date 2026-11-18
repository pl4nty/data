-- Threat: !InfrastructureShared
-- Name: 3f29c5ef54d9
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 2000 then
  return mp.INFECTED
end
return mp.CLEAN
