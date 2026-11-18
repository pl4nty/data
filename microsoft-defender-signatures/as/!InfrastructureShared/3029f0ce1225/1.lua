-- Threat: !InfrastructureShared
-- Name: 3029f0ce1225
-- Type: 21

local l_0_0 = mp.getfilesize()
if 5140 <= l_0_0 and l_0_0 <= 10240 then
  return mp.INFECTED
end
return mp.CLEAN
