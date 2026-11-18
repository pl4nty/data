-- Threat: !InfrastructureShared
-- Name: 64b31bd976ca
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 == nil or string.len(l_0_0) < 1 then
  return mp.CLEAN
end
return mp.INFECTED
