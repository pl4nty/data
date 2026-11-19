-- Threat: !InfrastructureShared
-- Name: 9878f46e9a22
-- Type: 21

local l_0_0 = mp.getfilesize()
if 9728 <= l_0_0 and l_0_0 <= 13312 then
  return mp.INFECTED
end
return mp.CLEAN
