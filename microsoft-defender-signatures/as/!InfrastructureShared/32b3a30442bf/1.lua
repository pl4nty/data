local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = this_sigattrlog
L0_1 = L0_1[1]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[1]
  L0_1 = L0_1.utf8p2
  if L0_1 then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[1]
    L0_1 = L0_1.utf8p2
    L2_1 = L0_1
    L1_1 = L0_1.match
    L3_1 = "(%d+);(%w+)"
    L1_1, L2_1 = L1_1(L2_1, L3_1)
    L3_1 = bm
    L3_1 = L3_1.add_related_string
    L4_1 = "detection_weight"
    L5_1 = L1_1
    L6_1 = bm
    L6_1 = L6_1.RelatedStringBMReport
    L3_1(L4_1, L5_1, L6_1)
    L3_1 = GetRollingQueue
    L4_1 = L2_1
    L3_1 = L3_1(L4_1)
    L4_1 = bm
    L4_1 = L4_1.add_related_string
    L5_1 = this_sigattrlog
    L5_1 = L5_1[1]
    L5_1 = L5_1.utf8p1
    L6_1 = safeJsonSerialize
    L7_1 = L3_1
    L6_1 = L6_1(L7_1)
    L7_1 = bm
    L7_1 = L7_1.RelatedStringBMReport
    L4_1(L5_1, L6_1, L7_1)
  end
end
L0_1 = reportSessionInformationInclusive
L0_1()
L0_1 = reportRelevantUntrustedEntities
L1_1 = 0
L0_1(L1_1)
L0_1 = reportTimingData
L0_1()
L0_1 = mp
L0_1 = L0_1.INFECTED
return L0_1
