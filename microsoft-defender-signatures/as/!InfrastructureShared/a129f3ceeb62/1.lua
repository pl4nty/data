-- Threat: !InfrastructureShared
-- Name: a129f3ceeb62
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 1000 then
  return mp.INFECTED
end
return mp.CLEAN
