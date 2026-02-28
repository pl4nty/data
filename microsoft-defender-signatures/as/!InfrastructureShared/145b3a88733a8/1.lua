local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = bm
L1_1 = L1_1.get_imagepath
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1)
if L0_1 then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1
  L3_1 = "\\program files"
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if not L1_1 then
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = ":\\windows"
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if not L1_1 then
      goto lbl_30
    end
  end
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
::lbl_30::
L1_1 = this_sigattrlog
L1_1 = L1_1[7]
L1_1 = L1_1.utf8p2
L2_1 = string
L2_1 = L2_1.find
L3_1 = L1_1
L4_1 = "Bytes:"
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if not L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L4_1 = L1_1
L3_1 = L1_1.sub
L5_1 = L2_1
L3_1 = L3_1(L4_1, L5_1)
L4_1 = tonumber
L6_1 = L3_1
L5_1 = L3_1.match
L7_1 = "Bytes:(%d+)"
L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1 = L5_1(L6_1, L7_1)
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1)
L5_1 = string
L5_1 = L5_1.find
L6_1 = L1_1
L7_1 = "Count:"
L8_1 = 1
L9_1 = true
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
if not L5_1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = tonumber
L8_1 = L3_1
L7_1 = L3_1.match
L9_1 = "Count:(%d+)"
L7_1, L8_1, L9_1, L10_1, L11_1, L12_1 = L7_1(L8_1, L9_1)
L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1, L11_1, L12_1)
if L4_1 and 2000000 < L4_1 and L4_1 < 6000000 and 50 < L6_1 and L6_1 < 120 then
  L7_1 = bm
  L7_1 = L7_1.add_related_string
  L8_1 = "ReadVM"
  L9_1 = "Bytes: "
  L10_1 = L4_1
  L11_1 = " Count: "
  L12_1 = L6_1
  L9_1 = L9_1 .. L10_1 .. L11_1 .. L12_1
  L10_1 = bm
  L10_1 = L10_1.RelatedStringBMReport
  L7_1(L8_1, L9_1, L10_1)
  L7_1 = add_parents
  L7_1()
  L7_1 = mp
  L7_1 = L7_1.INFECTED
  return L7_1
end
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
