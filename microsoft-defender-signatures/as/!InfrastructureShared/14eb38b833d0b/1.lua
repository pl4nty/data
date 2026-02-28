local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = this_sigattrlog
L0_1 = L0_1[9]
L0_1 = L0_1.utf8p2
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = "Bytes:"
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if not L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L3_1 = L0_1
L2_1 = L0_1.sub
L4_1 = L1_1
L2_1 = L2_1(L3_1, L4_1)
L3_1 = tonumber
L5_1 = L2_1
L4_1 = L2_1.match
L6_1 = "Bytes:(%d+)"
L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1 = L4_1(L5_1, L6_1)
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1)
L4_1 = string
L4_1 = L4_1.find
L5_1 = L0_1
L6_1 = "Count:"
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if not L4_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = tonumber
L7_1 = L2_1
L6_1 = L2_1.match
L8_1 = "Count:(%d+)"
L6_1, L7_1, L8_1, L9_1, L10_1, L11_1 = L6_1(L7_1, L8_1)
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1, L10_1, L11_1)
if L3_1 and 52000000 < L3_1 and L3_1 < 80000000 and 5500 < L5_1 and L5_1 < 9000 then
  L6_1 = bm
  L6_1 = L6_1.add_related_string
  L7_1 = "ReadVM"
  L8_1 = "Bytes: "
  L9_1 = L3_1
  L10_1 = " Count: "
  L11_1 = L5_1
  L8_1 = L8_1 .. L9_1 .. L10_1 .. L11_1
  L9_1 = bm
  L9_1 = L9_1.RelatedStringBMReport
  L6_1(L7_1, L8_1, L9_1)
  L6_1 = pcall
  L7_1 = reportBmInfo
  L6_1, L7_1 = L6_1(L7_1)
  if not L6_1 and L7_1 then
    L8_1 = bm
    L8_1 = L8_1.add_related_string
    L9_1 = "bmInfoFailReason"
    L10_1 = tostring
    L11_1 = L7_1
    L10_1 = L10_1(L11_1)
    L11_1 = bm
    L11_1 = L11_1.RelatedStringBMReport
    L8_1(L9_1, L10_1, L11_1)
  end
  L8_1 = add_parents
  L8_1()
  L8_1 = mp
  L8_1 = L8_1.INFECTED
  return L8_1
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
