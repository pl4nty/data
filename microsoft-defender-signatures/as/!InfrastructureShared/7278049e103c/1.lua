-- Threat: !InfrastructureShared
-- Name: 7278049e103c
-- Type: 21

local l_0_0 = mp.getfilesize()
if 135168 <= l_0_0 and l_0_0 <= 163840 then
  return mp.INFECTED
end
return mp.CLEAN
