local L0_1, L1_1, L2_1, L3_1
L0_1 = pehdr
L0_1 = L0_1.DataDirectory
L1_1 = pe
L1_1 = L1_1.IMAGE_DIRECTORY_ENTRY_EXPORT
L0_1 = L0_1[L1_1]
L0_1 = L0_1.Size
if L0_1 < 9 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pehdr
L0_1 = L0_1.DataDirectory
L1_1 = pe
L1_1 = L1_1.IMAGE_DIRECTORY_ENTRY_EXPORT
L0_1 = L0_1[L1_1]
L0_1 = L0_1.RVA
if L0_1 == 0 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readprotection
L1_1 = false
L0_1(L1_1)
L0_1 = pe
L0_1 = L0_1.mmap_rva
L1_1 = pehdr
L1_1 = L1_1.DataDirectory
L2_1 = pe
L2_1 = L2_1.IMAGE_DIRECTORY_ENTRY_EXPORT
L1_1 = L1_1[L2_1]
L1_1 = L1_1.RVA
L2_1 = 9
L0_1 = L0_1(L1_1, L2_1)
L1_1 = mp
L1_1 = L1_1.readu_u32
L2_1 = L0_1
L3_1 = 5
L1_1 = L1_1(L2_1, L3_1)
L2_1 = pehdr
L2_1 = L2_1.TimeDateStamp
L2_1 = L1_1 - L2_1
if 233135995 < L2_1 and L2_1 < 233136005 then
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
