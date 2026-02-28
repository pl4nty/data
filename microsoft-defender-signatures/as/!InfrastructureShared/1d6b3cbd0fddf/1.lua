local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = GetSuspiciousAllocsInBmLog
L0_1 = L0_1()
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = pairs
L2_1 = L0_1
L1_1, L2_1, L3_1 = L1_1(L2_1)
for L4_1 in L1_1, L2_1, L3_1 do
  L5_1 = TriggerTargetedMemoryScan
  L6_1 = L4_1
  L5_1(L6_1)
  L5_1 = AddSuspiciousRegion
  L6_1 = L4_1
  L5_1(L6_1)
end
L1_1 = TriggerScanBeaconing
L1_1()
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
