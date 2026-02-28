local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L1_1 = GetRollingQueueKeys
L2_1 = "SusLampz"
L1_1 = L1_1(L2_1)
if L1_1 then
  L2_1 = pcall
  L3_1 = bm
  L3_1 = L3_1.get_imagepath
  L2_1, L3_1 = L2_1(L3_1)
  if L2_1 then
    L4_1 = isnull
    L5_1 = L3_1
    L4_1 = L4_1(L5_1)
    if not L4_1 then
      goto lbl_20
    end
  end
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  do return L4_1 end
  ::lbl_20::
  L4_1 = string
  L4_1 = L4_1.lower
  L5_1 = L3_1
  L4_1 = L4_1(L5_1)
  L0_1 = L4_1
  L4_1 = bm
  L4_1 = L4_1.add_related_string
  L5_1 = "MALCIOUS PATH: "
  L6_1 = L0_1
  L7_1 = bm
  L7_1 = L7_1.RelatedStringBMReport
  L4_1(L5_1, L6_1, L7_1)
  L4_1 = add_parents
  L4_1()
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
