local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
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
L1_1 = this_sigattrlog
L1_1 = L1_1[2]
L2_1 = this_sigattrlog
L2_1 = L2_1[3]
L3_1 = this_sigattrlog
L3_1 = L3_1[4]
L4_1 = this_sigattrlog
L4_1 = L4_1[5]
L5_1 = ipairs
L6_1 = {}
L7_1 = L1_1
L8_1 = L2_1
L9_1 = L3_1
L10_1 = L4_1
L6_1[1] = L7_1
L6_1[2] = L8_1
L6_1[3] = L9_1
L6_1[4] = L10_1
L5_1, L6_1, L7_1 = L5_1(L6_1)
for L8_1, L9_1 in L5_1, L6_1, L7_1 do
  if L9_1 then
    L10_1 = L9_1.utf8p2
    if L10_1 then
      L10_1 = bm
      L10_1 = L10_1.add_related_string
      L11_1 = string
      L11_1 = L11_1.format
      L12_1 = "ddb49deb_%d"
      L13_1 = L8_1
      L11_1 = L11_1(L12_1, L13_1)
      L12_1 = L9_1.utf8p2
      L13_1 = bm
      L13_1 = L13_1.RelatedStringBMReport
      L10_1(L11_1, L12_1, L13_1)
    end
  end
end
L5_1 = mp
L5_1 = L5_1.INFECTED
return L5_1
