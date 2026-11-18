-- Threat: !InfrastructureShared
-- Name: 15b783fcba090
-- Type: 21

local l_0_0 = mp.getfilesize()
if 20480 <= l_0_0 and l_0_0 <= 32768 then
  return mp.INFECTED
end
return mp.CLEAN
