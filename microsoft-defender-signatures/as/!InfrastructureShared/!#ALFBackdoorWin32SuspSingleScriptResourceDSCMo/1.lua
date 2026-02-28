local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.readprotection
L1_1 = false
L0_1(L1_1)
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 1048576 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readfile
L2_1 = 0
L3_1 = L0_1
L1_1 = L1_1(L2_1, L3_1)
L3_1 = L1_1
L2_1 = L1_1.gsub
L4_1 = "instance of MSFT_"
L5_1 = ""
L2_1, L3_1 = L2_1(L3_1, L4_1, L5_1)
L4_1 = mp
L4_1 = L4_1.readprotection
L5_1 = true
L4_1(L5_1)
if L3_1 == 1 then
  L4_1 = mp
  L4_1 = L4_1.set_mpattribute
  L5_1 = "MpNonPIIFileType"
  L4_1(L5_1)
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
