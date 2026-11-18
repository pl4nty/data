-- Threat: !InfrastructureShared
-- Name: 78b32b2c3544
-- Type: 21

local l_0_0 = ""
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
end
if l_0_0 then
  bm.add_related_string("SuspClfsAccess_CLFS", tostring(l_0_0), bm.RelatedStringBMReport)
end
return mp.INFECTED
