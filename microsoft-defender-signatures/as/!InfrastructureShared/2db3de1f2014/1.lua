local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = this_sigattrlog
L0_1 = L0_1[1]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = string
  L0_1 = L0_1.lower
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.utf8p2
  L0_1 = L0_1(L1_1)
  L1_1 = mp
  L1_1 = L1_1.GetExecutablesFromCommandLine
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  if L1_1 ~= nil then
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
      end
    end
  end
end
L0_1 = add_parents
L0_1()
L0_1 = mp
L0_1 = L0_1.INFECTED
return L0_1
