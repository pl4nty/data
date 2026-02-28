local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = this_sigattrlog
L0_1 = L0_1[2]
L0_1 = L0_1.utf8p2
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = "Bytes:"
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if not L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L3_1 = L0_1
L2_1 = L0_1.sub
L4_1 = L1_1
L2_1 = L2_1(L3_1, L4_1)
L4_1 = L2_1
L3_1 = L2_1.match
L5_1 = "Bytes:(%d+)"
L3_1 = L3_1(L4_1, L5_1)
if L3_1 then
  L4_1 = #L3_1
  if 6 < L4_1 then
    L4_1 = add_parents
    L4_1()
    L4_1 = mp
    L4_1 = L4_1.INFECTED
    return L4_1
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
