-- Threat: !InfrastructureShared
-- Name: 3f3b317201576
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = GetSuspiciousAllocsInBmLog(true)
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = 0
for l_0_2 in pairs(l_0_0) do
  TriggerTargetedMemoryScan(l_0_2)
  AddSuspiciousRegion(l_0_2)
  l_0_1 = l_0_1 + 1
end
if l_0_1 == 0 then
  return mp.CLEAN
end
TriggerScanBeaconing()
local l_0_3 = this_sigattrlog[14]
if l_0_3 and l_0_3.utf8p2 then
  bm.add_related_string("d7238133", l_0_3.utf8p2, bm.RelatedStringBMReport)
end
return mp.INFECTED
