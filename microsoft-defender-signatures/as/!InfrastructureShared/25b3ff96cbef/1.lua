-- Threat: !InfrastructureShared
-- Name: 25b3ff96cbef
-- Type: 21
-- Includes: PrecisionPulseHelpers, BMLuaLib

local l_0_0, l_0_1 = pcall(MamadutReport)
if not l_0_0 and l_0_1 then
  bm.add_related_string("ErrorMamadutReport", l_0_1, bm.RelatedStringBMReport)
end
l_0_0, l_0_1 = pcall(reportRelatedFilesFromBmEvents)
if not l_0_0 and l_0_1 then
  bm.add_related_string("ErrorBMreport", l_0_1, bm.RelatedStringBMReport)
end
return mp.INFECTED
