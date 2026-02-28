local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = this_sigattrlog
L0_1 = L0_1[3]
L0_1 = L0_1.utf8p2
L1_1 = ""
if L0_1 ~= nil and L0_1 ~= "" then
  L1_1 = L0_1
  L2_1 = sysio
  L2_1 = L2_1.IsFileExists
  L3_1 = L0_1
  L2_1 = L2_1(L3_1)
  if L2_1 then
    L2_1 = bm
    L2_1 = L2_1.add_related_file
    L3_1 = L0_1
    L2_1(L3_1)
  end
end
L2_1 = this_sigattrlog
L2_1 = L2_1[4]
L2_1 = L2_1.utf8p2
if L2_1 ~= nil and L2_1 ~= "" then
  L3_1 = L1_1
  L4_1 = "_"
  L5_1 = L2_1
  L1_1 = L3_1 .. L4_1 .. L5_1
  L3_1 = sysio
  L3_1 = L3_1.IsFileExists
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  if L3_1 then
    L3_1 = bm
    L3_1 = L3_1.add_related_file
    L4_1 = L2_1
    L3_1(L4_1)
  end
end
if L1_1 ~= "" then
  L3_1 = bm
  L3_1 = L3_1.add_related_string
  L4_1 = "ComHijackValues"
  L5_1 = L1_1
  L6_1 = bm
  L6_1 = L6_1.RelatedStringBMReport
  L3_1(L4_1, L5_1, L6_1)
end
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
