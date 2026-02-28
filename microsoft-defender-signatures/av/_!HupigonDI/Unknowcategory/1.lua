local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = pehdr
L0_1 = L0_1.Characteristics
if L0_1 ~= 33166 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pehdr
L0_1 = L0_1.DataDirectory
L0_1 = L0_1[3]
L0_1 = L0_1.RVA
if L0_1 ~= 757760 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pehdr
L0_1 = L0_1.DataDirectory
L0_1 = L0_1[10]
L0_1 = L0_1.RVA
if L0_1 ~= 708608 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readprotection
L1_1 = false
L0_1(L1_1)
L0_1 = mp
L0_1 = L0_1.readfile
L1_1 = 1561
L2_1 = 409
L0_1 = L0_1(L1_1, L2_1)
L1_1 = mp
L1_1 = L1_1.crc32
L2_1 = -1
L3_1 = L0_1
L4_1 = 1
L5_1 = 409
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if L1_1 ~= 3407018037 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
