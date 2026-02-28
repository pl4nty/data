local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = this_sigattrlog
L0_1 = L0_1[2]
L0_1 = L0_1.p2
L1_1 = crypto
L1_1 = L1_1.ComputeEntropy
L2_1 = string
L2_1 = L2_1.sub
L3_1 = L0_1
L4_1 = 1
L5_1 = 512
L2_1, L3_1, L4_1, L5_1 = L2_1(L3_1, L4_1, L5_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if 6 <= L1_1 then
  L2_1 = bm
  L2_1 = L2_1.add_related_string
  L3_1 = "boot_entropy"
  L4_1 = "ent="
  L5_1 = L1_1
  L4_1 = L4_1 .. L5_1
  L5_1 = bm
  L5_1 = L5_1.RelatedStringBMReport
  L2_1(L3_1, L4_1, L5_1)
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
