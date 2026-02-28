local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 2048 or 65536 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readheader
L2_1 = 2048
L3_1 = 4
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= "\021\000\021\000" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.readheader
L3_1 = 2088
L4_1 = 4
L2_1 = L2_1(L3_1, L4_1)
if L2_1 ~= "\214\000\000\000" then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.readheader
L4_1 = 3070
L5_1 = 4
L3_1 = L3_1(L4_1, L5_1)
if L3_1 ~= "\016\021\000\000" then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.set_mpattribute
L5_1 = "BM_SUSP_BLF_BLUELOG"
L4_1(L5_1)
L4_1 = mp
L4_1 = L4_1.INFECTED
return L4_1
