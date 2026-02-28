local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = pevars
L0_1 = L0_1.epsec
L1_1 = pehdr
L1_1 = L1_1.NumberOfSections
if L0_1 > L1_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pesecs
L1_1 = pevars
L1_1 = L1_1.epsec
L0_1 = L0_1[L1_1]
L0_1 = L0_1.SizeOfRawData
if L0_1 ~= 77824 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.bitand
L1_1 = pesecs
L2_1 = pevars
L2_1 = L2_1.epsec
L1_1 = L1_1[L2_1]
L1_1 = L1_1.VirtualSize
L2_1 = 73728
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 73728 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pesecs
L1_1 = pevars
L1_1 = L1_1.epsec
L0_1 = L0_1[L1_1]
L0_1 = L0_1.Characteristics
if L0_1 ~= 1610612768 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pehdr
L0_1 = L0_1.NumberOfSections
if L0_1 <= 4 then
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
L1_1 = pesecs
L2_1 = pevars
L2_1 = L2_1.epsec
L1_1 = L1_1[L2_1]
L1_1 = L1_1.PointerToRawData
L1_1 = L1_1 + 256
L2_1 = 256
L0_1 = L0_1(L1_1, L2_1)
L1_1 = mp
L1_1 = L1_1.crc32
L2_1 = -1
L3_1 = L0_1
L4_1 = 1
L5_1 = 29
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if L1_1 ~= 3571610125 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.crc32
L3_1 = -1
L4_1 = L0_1
L5_1 = 96
L6_1 = 16
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if L2_1 ~= 1775081905 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
