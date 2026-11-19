-- Threat: !InfrastructureShared
-- Name: 170b3945b2fd0
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
return mp.INFECTED
