local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = GetSuspiciousAllocsInBmLog
L1_1 = true
L0_1 = L0_1(L1_1)
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = 0
L2_1 = pairs
L3_1 = L0_1
L2_1, L3_1, L4_1 = L2_1(L3_1)
for L5_1 in L2_1, L3_1, L4_1 do
  L6_1 = TriggerTargetedMemoryScan
  L7_1 = L5_1
  L6_1(L7_1)
  L6_1 = AddSuspiciousRegion
  L7_1 = L5_1
  L6_1(L7_1)
  L1_1 = L1_1 + 1
end
if L1_1 == 0 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = TriggerScanBeaconing
L2_1()
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
