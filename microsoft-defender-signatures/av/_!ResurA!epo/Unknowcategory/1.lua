local L0_1, L1_1, L2_1
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
if L0_1 ~= 20480 then
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
L2_1 = 16384
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 16384 then
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
if L0_1 <= 3 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pe
L0_1 = L0_1.scanpage
L1_1 = pesecs
L2_1 = pevars
L2_1 = L2_1.epsec
L1_1 = L1_1[L2_1]
L1_1 = L1_1.PointerToRawData
return L0_1(L1_1)
