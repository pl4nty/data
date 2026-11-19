-- Threat: !InfrastructureShared
-- Name: db780d12f371
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.ismsil == true and l_0_0 < 655360 then
  return mp.INFECTED
end
return mp.CLEAN
