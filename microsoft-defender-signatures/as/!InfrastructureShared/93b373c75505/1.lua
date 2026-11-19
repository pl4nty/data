-- Threat: !InfrastructureShared
-- Name: 93b373c75505
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.CLEAN
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 then
  l_0_0 = reportGenericRansomware(this_sigattrlog[1].utf8p2)
end
if l_0_0 == mp.INFECTED then
  reportTimingData()
  local l_0_1, l_0_2 = pcall(reportBmInfo)
  if not l_0_1 and l_0_2 then
    bm.add_related_string("bmInfoFailReason", tostring(l_0_2), bm.RelatedStringBMReport)
  end
  return mp.INFECTED
end
return mp.CLEAN
