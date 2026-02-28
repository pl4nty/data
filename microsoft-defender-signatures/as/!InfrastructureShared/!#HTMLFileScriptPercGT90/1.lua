local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 4096 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.GetNormalizedScript
L2_1 = true
L1_1 = L1_1(L2_1)
L2_1 = L1_1
L1_1 = L1_1.lower
L1_1 = L1_1(L2_1)
L2_1 = string
L2_1 = L2_1.gsub
L3_1 = L1_1
L4_1 = "<script.-</script>"
L5_1 = ""
L2_1 = L2_1(L3_1, L4_1, L5_1)
L3_1 = #L1_1
L4_1 = #L2_1
L3_1 = L3_1 - L4_1
L4_1 = #L1_1
L4_1 = L4_1 * 90
L4_1 = L4_1 / 100
if L3_1 > L4_1 then
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
