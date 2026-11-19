-- Threat: !InfrastructureShared
-- Name: 537821247e88
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 <= 769832 and 765736 <= l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
