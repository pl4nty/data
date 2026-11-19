-- Threat: !InfrastructureShared
-- Name: 3578a79330c1
-- Type: 21

local l_0_0 = mp.getfilesize()
if 4096 <= l_0_0 and l_0_0 <= 16384 then
  return mp.INFECTED
end
return mp.CLEAN
