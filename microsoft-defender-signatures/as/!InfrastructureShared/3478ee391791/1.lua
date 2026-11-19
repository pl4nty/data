-- Threat: !InfrastructureShared
-- Name: 3478ee391791
-- Type: 21

local l_0_0 = mp.getfilesize()
if 5242880 < l_0_0 then
  return mp.CLEAN
end
return mp.INFECTED
