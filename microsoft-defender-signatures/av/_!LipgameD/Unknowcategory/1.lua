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
L0_1 = L0_1.VirtualSize
if 24576 < L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pesecs
L1_1 = pevars
L1_1 = L1_1.epsec
L0_1 = L0_1[L1_1]
L0_1 = L0_1.VirtualSize
if L0_1 < 20480 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pesecs
L1_1 = pevars
L1_1 = L1_1.epsec
L0_1 = L0_1[L1_1]
L0_1 = L0_1.SizeOfRawData
if L0_1 < 23040 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pesecs
L1_1 = pevars
L1_1 = L1_1.epsec
L0_1 = L0_1[L1_1]
L0_1 = L0_1.SizeOfRawData
if 24576 < L0_1 then
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
L1_1 = L1_1.Characteristics
L2_1 = 3758096416
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 3758096416 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = {}
L1_1 = {}
L1_1.sig = "j\025j\000\255\214\139}\b\128'\000\133\192t\017"
L1_1.xray_type = 3
L1_1.bytes_to_decrypt = 0
L0_1[1] = L1_1
L1_1 = pe
L1_1 = L1_1.xray_block
L2_1 = L0_1
L3_1 = 1
L4_1 = 0
L5_1 = 0
L6_1 = -1
return L1_1(L2_1, L3_1, L4_1, L5_1, L6_1)
