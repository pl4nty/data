-- Threat: !InfrastructureShared
-- Name: 612921c1ca93
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 <= 512 then
  return mp.INFECTED
end
return mp.CLEAN
