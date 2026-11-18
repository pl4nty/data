-- Threat: !InfrastructureShared
-- Name: 32b3c0389cc6
-- Type: 21
-- Includes: BMLuaLib

bm.add_action("SmsAsyncScanEvent", 5000)
local l_0_0 = GetSuspiciousAllocsInBmLog()
if not l_0_0 then
  return mp.CLEAN
end
for l_0_1 in pairs(l_0_0) do
  TriggerTargetedMemoryScan(l_0_1)
  AddSuspiciousRegion(l_0_1)
end
return mp.INFECTED
