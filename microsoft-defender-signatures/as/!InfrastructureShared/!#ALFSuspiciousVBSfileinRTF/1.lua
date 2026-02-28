local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 100 < L0_1 and L0_1 < 1000000 then
  L1_1 = string
  L1_1 = L1_1.lower
  L2_1 = mp
  L2_1 = L2_1.getfilename
  L2_1, L3_1, L4_1 = L2_1()
  L1_1 = L1_1(L2_1, L3_1, L4_1)
  L2_1 = string
  L2_1 = L2_1.match
  L3_1 = L1_1
  L4_1 = "rtf%d.+->.+"
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 then
    L2_1 = mp
    L2_1 = L2_1.INFECTED
    return L2_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
