local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 268435456 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = pehdr
L1_1 = L1_1.NumberOfSections
L2_1 = pesecs
L2_1 = L2_1[L1_1]
L2_1 = L2_1.PointerToRawData
L3_1 = pesecs
L3_1 = L3_1[L1_1]
L3_1 = L3_1.SizeOfRawData
L4_1 = L2_1 + L3_1
if L0_1 <= L4_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = pehdr
L5_1 = L5_1.DataDirectory
L6_1 = pe
L6_1 = L6_1.IMAGE_DIRECTORY_ENTRY_SECURITY
L5_1 = L5_1[L6_1]
L5_1 = L5_1.RVA
L6_1 = pehdr
L6_1 = L6_1.DataDirectory
L7_1 = pe
L7_1 = L7_1.IMAGE_DIRECTORY_ENTRY_SECURITY
L6_1 = L6_1[L7_1]
L6_1 = L6_1.Size
if L4_1 > L5_1 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = 0
if L5_1 == 0 then
  L7_1 = L0_1 - L4_1
elseif L5_1 == L4_1 then
  L8_1 = L4_1 + L6_1
  L7_1 = L0_1 - L8_1
elseif L4_1 < L5_1 then
  L7_1 = L5_1 - L4_1
else
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L8_1 = L7_1 * 100
L8_1 = L8_1 / L0_1
if 90 < L8_1 then
  L8_1 = mp
  L8_1 = L8_1.INFECTED
  return L8_1
end
L8_1 = mp
L8_1 = L8_1.CLEAN
return L8_1
