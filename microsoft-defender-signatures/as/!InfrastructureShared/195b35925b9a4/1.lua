local L0_1, L1_1, L2_1
L0_1 = this_sigattrlog
L0_1 = L0_1[3]
L0_1 = L0_1.utf8p2
L1_1 = sysio
L1_1 = L1_1.IsFileExists
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 then
  L1_1 = bm
  L1_1 = L1_1.add_related_file
  L2_1 = L0_1
  L1_1(L2_1)
end
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
