local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = this_sigattrlog
L1_1 = L1_1[2]
L1_1 = L1_1.utf8p2
L0_1 = L0_1(L1_1)
if L0_1 ~= nil then
  L1_1 = mp
  L1_1 = L1_1.GetExecutablesFromCommandLine
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  L2_1 = ipairs
  L3_1 = L1_1
  L2_1, L3_1, L4_1 = L2_1(L3_1)
  for L5_1, L6_1 in L2_1, L3_1, L4_1 do
    L7_1 = sysio
    L7_1 = L7_1.IsFileExists
    L8_1 = L6_1
    L7_1 = L7_1(L8_1)
    if L7_1 then
      L7_1 = bm
      L7_1 = L7_1.add_related_file
      L8_1 = L6_1
      L7_1(L8_1)
      L7_1 = mp
      L7_1 = L7_1.ReportLowfi
      L8_1 = L6_1
      L9_1 = 2703845775
      L7_1(L8_1, L9_1)
    end
  end
  L2_1 = add_parents
  L2_1()
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
