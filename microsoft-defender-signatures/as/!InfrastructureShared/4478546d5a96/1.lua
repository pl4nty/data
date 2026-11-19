-- Threat: !InfrastructureShared
-- Name: 4478546d5a96
-- Type: 21

local l_0_0 = mp.getfilesize()
if 1000000 < l_0_0 or l_0_0 < 10000 then
  return mp.CLEAN
end
return mp.INFECTED
