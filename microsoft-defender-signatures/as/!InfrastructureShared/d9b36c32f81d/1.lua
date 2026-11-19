-- Threat: !InfrastructureShared
-- Name: d9b36c32f81d
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = GetSuspiciousAllocsInBmLog()
if not l_0_0 then
  return mp.CLEAN
end
for l_0_1 in pairs(l_0_0) do
  TriggerTargetedMemoryScan(l_0_1)
  AddSuspiciousRegion(l_0_1)
end
TriggerScanBeaconing()
local l_0_2 = this_sigattrlog[2]
local l_0_3 = this_sigattrlog[3]
local l_0_4 = this_sigattrlog[4]
local l_0_5 = this_sigattrlog[5]
for l_0_6, l_0_7 in ipairs({
  l_0_2,
  l_0_3,
  l_0_4,
  l_0_5
}) do
  if l_0_7 and l_0_7.utf8p2 then
    bm.add_related_string(string.format("ddb49deb_%d", l_0_6), l_0_7.utf8p2, bm.RelatedStringBMReport)
  end
end
return mp.INFECTED
