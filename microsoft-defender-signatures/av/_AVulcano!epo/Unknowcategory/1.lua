local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = peattributes
L0_1 = L0_1.lastscn_writable
if L0_1 == false then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = peattributes
L0_1 = L0_1.lastscn_falign
if L0_1 == false then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pesecs
L1_1 = pehdr
L1_1 = L1_1.NumberOfSections
L0_1 = L0_1[L1_1]
L0_1 = L0_1.SizeOfRawData
if L0_1 < 6656 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.bitand
L1_1 = pehdr
L1_1 = L1_1.MajorImageVersion
L2_1 = 1
L0_1 = L0_1(L1_1, L2_1)
L0_1 = not L0_1
if L0_1 == 0 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = {}
L1_1 = {}
L1_1.sig = "`\232\000\000\000\000]\141\181\198\000\000\000\141\189\244"
L1_1.xray_type = 8
L1_1.bytes_to_decrypt = 0
L2_1 = {}
L2_1.sig = "`\232\000\000\000\000]\141\181\198\000\000\000\141\189\254"
L2_1.xray_type = 8
L2_1.bytes_to_decrypt = 0
L0_1[1] = L1_1
L0_1[2] = L2_1
L1_1 = pe
L1_1 = L1_1.xray_block
L2_1 = L0_1
L3_1 = 2
L4_1 = -1
L5_1 = 0
L6_1 = 256
return L1_1(L2_1, L3_1, L4_1, L5_1, L6_1)
