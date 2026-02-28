local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
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
if L0_1 ~= 40448 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pehdr
L0_1 = L0_1.AddressOfEntryPoint
if L0_1 ~= 19968 then
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
L1_1 = L1_1 + 1600
L2_1 = 1024
L0_1 = L0_1(L1_1, L2_1)
L1_1 = mp
L1_1 = L1_1.crc32
L2_1 = -1
L3_1 = L0_1
L4_1 = 1
L5_1 = 1024
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if L1_1 ~= 2106590491 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
