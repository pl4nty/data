local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = this_sigattrlog
L0_1 = L0_1[2]
L0_1 = L0_1.utf8p2
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = ".sh"
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
L1_1 = 3000000
L2_1 = bm
L2_1 = L2_1.GetSignatureMatchDuration
L2_1 = L2_1()
if L1_1 < L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = this_sigattrlog
L2_1 = L2_1[1]
L2_1 = L2_1.utf8p1
L3_1 = split
L4_1 = L2_1
L5_1 = "/"
L3_1 = L3_1(L4_1, L5_1)
L4_1 = #L3_1
L4_1 = L3_1[L4_1]
L5_1 = string
L5_1 = L5_1.find
L6_1 = L0_1
L7_1 = L4_1
L8_1 = 1
L9_1 = true
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
if L5_1 then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
