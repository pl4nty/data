-- Threat: !InfrastructureShared
-- Name: 32b31b19d59f
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if l_0_0 == nil or #l_0_0 <= 2 then
  return mp.CLEAN
end
local l_0_1 = string.format("Param2=%s", l_0_0)
bm.add_related_string("ReferencePath", l_0_1, bm.RelatedStringBMReport)
return mp.INFECTED
