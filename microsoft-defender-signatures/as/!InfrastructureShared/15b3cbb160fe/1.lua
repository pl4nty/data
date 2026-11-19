-- Threat: !InfrastructureShared
-- Name: 15b3cbb160fe
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 and string.find(l_0_0, "2345soft", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
