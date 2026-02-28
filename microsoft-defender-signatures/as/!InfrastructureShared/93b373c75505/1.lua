local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.CLEAN
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.utf8p2
  if L1_1 then
    L1_1 = reportGenericRansomware
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L2_1 = L2_1.utf8p2
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1
  end
end
L1_1 = mp
L1_1 = L1_1.INFECTED
if L0_1 == L1_1 then
  L1_1 = reportTimingData
  L1_1()
  L1_1 = pcall
  L2_1 = reportBmInfo
  L1_1, L2_1 = L1_1(L2_1)
  if not L1_1 and L2_1 then
    L3_1 = bm
    L3_1 = L3_1.add_related_string
    L4_1 = "bmInfoFailReason"
    L5_1 = tostring
    L6_1 = L2_1
    L5_1 = L5_1(L6_1)
    L6_1 = bm
    L6_1 = L6_1.RelatedStringBMReport
    L3_1(L4_1, L5_1, L6_1)
  end
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
