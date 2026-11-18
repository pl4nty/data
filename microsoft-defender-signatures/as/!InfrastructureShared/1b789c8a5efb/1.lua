-- Threat: !InfrastructureShared
-- Name: 1b789c8a5efb
-- Type: 21

local l_0_0 = mp.getfilesize()
if 10000000 < l_0_0 or l_0_0 < 4000 then
  return mp.CLEAN
end
return mp.INFECTED
