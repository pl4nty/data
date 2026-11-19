-- Threat: !InfrastructureShared
-- Name: 19b3f569365f
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if l_0_0 ~= nil then
  bm.add_related_string("AMSIBodyScanControl", l_0_0, bm.RelatedStringBMReport)
end
return mp.INFECTED
