-- Threat: !InfrastructureShared
-- Name: 7bbe56b68dd4
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 6500 then
  return mp.INFECTED
end
return mp.CLEAN
