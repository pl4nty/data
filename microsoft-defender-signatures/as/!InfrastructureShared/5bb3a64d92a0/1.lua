-- Threat: !InfrastructureShared
-- Name: 5bb3a64d92a0
-- Type: 21

local l_0_0 = this_sigattrlog[1]
if not (l_0_0.matched and l_0_0.ppid) or not l_0_0.utf8p2 then
  return mp.CLEAN
end
bm.add_related_string("MaceNonV", tostring(l_0_0.utf8p2), bm.RelatedStringBMReport)
return mp.INFECTED
