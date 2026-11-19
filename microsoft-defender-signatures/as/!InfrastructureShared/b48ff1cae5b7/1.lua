-- Threat: !InfrastructureShared
-- Name: b48ff1cae5b7
-- Type: 21

local l_0_0 = mp.getfilesize()
if 204800 < l_0_0 then
  return mp.CLEAN
end
return mp.INFECTED
