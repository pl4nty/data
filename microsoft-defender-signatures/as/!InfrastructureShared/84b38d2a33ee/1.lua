-- Threat: !InfrastructureShared
-- Name: 84b38d2a33ee
-- Type: 21

local l_0_0 = this_sigattrlog[2].p2
local l_0_1 = crypto.ComputeEntropy(string.sub(l_0_0, 1, 512))
if 6 <= l_0_1 then
  bm.add_related_string("boot_entropy", "ent=" .. l_0_1, bm.RelatedStringBMReport)
  return mp.INFECTED
end
return mp.CLEAN
