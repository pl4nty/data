-- Threat: !InfrastructureShared
-- Name: 1c786519e62c
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 == 131072 then
  return mp.INFECTED
end
return mp.CLEAN
