-- Threat: !InfrastructureShared
-- Name: 2029ce8c7096
-- Type: 21

local l_0_0 = mp.getfilesize()
if 2048 <= l_0_0 and l_0_0 <= 10240 then
  return mp.INFECTED
end
return mp.CLEAN
