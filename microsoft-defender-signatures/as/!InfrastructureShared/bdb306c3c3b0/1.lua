local L0_1, L1_1
L0_1 = this_sigattrlog
L0_1 = L0_1[3]
L0_1 = L0_1.utf8p2
L1_1 = this_sigattrlog
L1_1 = L1_1[3]
L1_1 = L1_1.utf8p1
if L0_1 == L1_1 then
  L0_1 = mp
  L0_1 = L0_1.INFECTED
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
