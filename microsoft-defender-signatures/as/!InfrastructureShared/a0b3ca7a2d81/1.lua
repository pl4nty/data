-- Threat: !InfrastructureShared
-- Name: a0b3ca7a2d81
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
local l_0_1, l_0_2 = pcall(bm.get_imagepath)
if not l_0_1 or isnull(l_0_2) then
  return mp.INFECTED
end
l_0_0 = string.lower(l_0_2)
bm.add_related_string("MALCIOUS PATH: ", l_0_0, bm.RelatedStringBMReport)
add_parents()
return mp.INFECTED
