-- Threat: !InfrastructureShared
-- Name: 2ce78cff1f69c
-- Type: 21

local l_0_0 = mp.getfilesize()
if 500 <= l_0_0 and l_0_0 <= 1500 then
  return mp.INFECTED
end
return mp.CLEAN
