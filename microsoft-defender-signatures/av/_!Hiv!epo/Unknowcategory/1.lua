local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = peattributes
L0_1 = L0_1.lastscn_writable
if L0_1 == false then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = headerpage
L0_1 = L0_1[41]
if L0_1 ~= 231 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pesecs
L1_1 = pehdr
L1_1 = L1_1.NumberOfSections
L0_1 = L0_1[L1_1]
L0_1 = L0_1.SizeOfRawData
if L0_1 <= 16384 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pesecs
L1_1 = pehdr
L1_1 = L1_1.NumberOfSections
L0_1 = L0_1[L1_1]
L0_1 = L0_1.VirtualSize
if L0_1 <= 16384 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = {}
L1_1 = {}
L1_1.sig = "\214\2322\022\000\000\137\133\200\t\000\000\232G\018\000"
L1_1.xray_type = 1
L1_1.bytes_to_decrypt = 0
L2_1 = {}
L2_1.sig = "\214\232/\022\000\000\137\133\195\t\000\000\232B\018\000"
L2_1.xray_type = 1
L2_1.bytes_to_decrypt = 0
L3_1 = {}
L3_1.sig = "\214\232\135\023\000\000\137\133\191\n\000\000\232\153\019\000"
L3_1.xray_type = 1
L3_1.bytes_to_decrypt = 0
L4_1 = {}
L4_1.sig = "\214\232;\022\000\000\137\133\200\t\000\000\232G\018\000"
L4_1.xray_type = 1
L4_1.bytes_to_decrypt = 0
L0_1[1] = L1_1
L0_1[2] = L2_1
L0_1[3] = L3_1
L0_1[4] = L4_1
L1_1 = pe
L1_1 = L1_1.xray_block
L2_1 = L0_1
L3_1 = 4
L4_1 = -1
L5_1 = 0
L6_1 = -1
return L1_1(L2_1, L3_1, L4_1, L5_1, L6_1)
