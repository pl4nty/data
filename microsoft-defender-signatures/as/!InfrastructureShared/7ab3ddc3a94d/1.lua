-- Threat: !InfrastructureShared
-- Name: 7ab3ddc3a94d
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
return mp.INFECTED
