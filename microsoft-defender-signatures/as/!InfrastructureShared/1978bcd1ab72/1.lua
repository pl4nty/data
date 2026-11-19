-- Threat: !InfrastructureShared
-- Name: 1978bcd1ab72
-- Type: 21

local l_0_0 = mp.getfilesize()
if 409600 < l_0_0 and l_0_0 < 716800 then
  return mp.INFECTED
end
return mp.CLEAN
