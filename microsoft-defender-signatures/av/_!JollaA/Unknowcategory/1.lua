local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = pehdr
L0_1 = L0_1.NumberOfSections
if L0_1 ~= 1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = peattributes
L0_1 = L0_1.lastscn_writable
if L0_1 == false then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
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
if L0_1 <= 262144 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pesecs
L1_1 = pevars
L1_1 = L1_1.epsec
L0_1 = L0_1[L1_1]
L0_1 = L0_1.VirtualSize
L1_1 = pesecs
L2_1 = pevars
L2_1 = L2_1.epsec
L1_1 = L1_1[L2_1]
L1_1 = L1_1.SizeOfRawData
L0_1 = L0_1 - L1_1
if L0_1 ~= 0 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = {}
L2_1 = {}
L2_1.sig = "[Sf3\219f\129;ZMt\015f\129;MZt\b\129\235\000\016\000\000\235\231\232+\000\000\000GetProcAdd"
L2_1.xray_type = 4
L2_1.bytes_to_decrypt = 0
L1_1[1] = L2_1
L2_1 = pe
L2_1 = L2_1.xray_block
L3_1 = L1_1
L4_1 = 1
L5_1 = 0
L6_1 = 0
L7_1 = -1
return L2_1(L3_1, L4_1, L5_1, L6_1, L7_1)
