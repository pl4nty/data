local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = this_sigattrlog
L0_1 = L0_1[3]
L0_1 = L0_1.utf8p1
L1_1 = string
L1_1 = L1_1.lower
L2_1 = this_sigattrlog
L2_1 = L2_1[2]
L2_1 = L2_1.utf8p2
L1_1 = L1_1(L2_1)
L2_1 = bm_AddRelatedFileFromCommandLine
L3_1 = L1_1
L4_1 = nil
L5_1 = nil
L6_1 = 1
L2_1(L3_1, L4_1, L5_1, L6_1)
L2_1 = mp
L2_1 = L2_1.GetExecutablesFromCommandLine
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L3_1 = ipairs
L4_1 = L2_1
L3_1, L4_1, L5_1 = L3_1(L4_1)
for L6_1, L7_1 in L3_1, L4_1, L5_1 do
  L8_1 = sysio
  L8_1 = L8_1.IsFileExists
  L9_1 = L7_1
  L8_1 = L8_1(L9_1)
  if L8_1 then
    L8_1 = bm
    L8_1 = L8_1.add_related_file
    L9_1 = L7_1
    L8_1(L9_1)
    L8_1 = mp
    L8_1 = L8_1.ReportLowfi
    L9_1 = L7_1
    L10_1 = 1212861626
    L8_1(L9_1, L10_1)
  end
end
L3_1 = bm
L3_1 = L3_1.add_related_file
L4_1 = L0_1
L3_1(L4_1)
L3_1 = mp
L3_1 = L3_1.ReportLowfi
L4_1 = L0_1
L5_1 = 1212861626
L3_1(L4_1, L5_1)
L3_1 = add_parents
L3_1()
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
