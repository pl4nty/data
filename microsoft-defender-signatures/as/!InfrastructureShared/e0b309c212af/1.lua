local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = this_sigattrlog
L0_1 = L0_1[1]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[1]
  L0_1 = L0_1.utf8p2
  L1_1 = 1800
  L2_1 = 10
  L3_1 = AppendToRollingQueue
  L4_1 = "MpTamperRegKeyOldValues"
  L5_1 = "TreatAs"
  L6_1 = this_sigattrlog
  L6_1 = L6_1[1]
  L6_1 = L6_1.utf8p1
  L7_1 = "|"
  L8_1 = L0_1
  L6_1 = L6_1 .. L7_1 .. L8_1
  L7_1 = L1_1
  L8_1 = L2_1
  L3_1(L4_1, L5_1, L6_1, L7_1, L8_1)
end
L0_1 = mp
L0_1 = L0_1.INFECTED
return L0_1
