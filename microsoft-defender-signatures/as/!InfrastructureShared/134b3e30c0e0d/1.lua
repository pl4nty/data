-- Threat: !InfrastructureShared
-- Name: 134b3e30c0e0d
-- Type: 21

local l_0_0 = bm.get_imagepath()
if l_0_0 == nil or string.len(l_0_0) < 1 then
  return mp.CLEAN
end
return mp.INFECTED
