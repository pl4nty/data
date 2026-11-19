-- Threat: !InfrastructureShared
-- Name: 6e29f040e723
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 2000 and 1000 < l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
