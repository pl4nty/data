local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L1_1 = pcall
L2_1 = bm
L2_1 = L2_1.get_imagepath
L1_1, L2_1 = L1_1(L2_1)
if L1_1 then
  L3_1 = isnull
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  if not L3_1 then
    goto lbl_15
  end
end
L3_1 = mp
L3_1 = L3_1.INFECTED
do return L3_1 end
::lbl_15::
L3_1 = string
L3_1 = L3_1.lower
L4_1 = L2_1
L3_1 = L3_1(L4_1)
L0_1 = L3_1
L3_1 = bm
L3_1 = L3_1.add_related_string
L4_1 = "MALCIOUS PATH: "
L5_1 = L0_1
L6_1 = bm
L6_1 = L6_1.RelatedStringBMReport
L3_1(L4_1, L5_1, L6_1)
L3_1 = add_parents
L3_1()
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
