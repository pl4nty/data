local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = isnull
L1_1 = this_sigattrlog
L1_1 = L1_1[9]
L1_1 = L1_1.utf8p2
L0_1 = L0_1(L1_1)
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = bm
L0_1 = L0_1.get_imagepath
L0_1 = L0_1()
L1_1 = isnull
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = L0_1
  L2_1 = L2_1(L3_1)
  L3_1 = "\\program files"
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if not L1_1 then
    goto lbl_34
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_34::
L1_1 = string
L1_1 = L1_1.match
L2_1 = this_sigattrlog
L2_1 = L2_1[9]
L2_1 = L2_1.utf8p2
L3_1 = "bytes:(%d+).-count:(%d+)"
L1_1, L2_1 = L1_1(L2_1, L3_1)
L3_1 = isnull
L4_1 = L1_1
L3_1 = L3_1(L4_1)
if not L3_1 then
  L3_1 = isnull
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  if not L3_1 then
    goto lbl_54
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_54::
L3_1 = tonumber
L4_1 = L1_1
L3_1 = L3_1(L4_1)
L4_1 = tonumber
L5_1 = L2_1
L4_1 = L4_1(L5_1)
L2_1 = L4_1
L1_1 = L3_1
if 52000000 < L1_1 and L1_1 < 75000000 and 5500 < L2_1 and L2_1 < 9000 then
  L3_1 = bm
  L3_1 = L3_1.add_related_string
  L4_1 = "ReadVM"
  L5_1 = string
  L5_1 = L5_1.format
  L6_1 = "Bytes: %d Count: %d"
  L7_1 = L1_1
  L8_1 = L2_1
  L5_1 = L5_1(L6_1, L7_1, L8_1)
  L6_1 = bm
  L6_1 = L6_1.RelatedStringBMReport
  L3_1(L4_1, L5_1, L6_1)
  L3_1 = add_parents
  L3_1()
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
