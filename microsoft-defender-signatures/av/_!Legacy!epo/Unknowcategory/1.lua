local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = peattributes
L0_1 = L0_1.lastscn_writable
if L0_1 == false then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = peattributes
L0_1 = L0_1.no_relocs
if L0_1 == false then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pehdr
L0_1 = L0_1.Win32VersionValue
if L0_1 ~= 1497581388 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pesecs
L1_1 = pehdr
L1_1 = L1_1.NumberOfSections
L0_1 = L0_1[L1_1]
L0_1 = L0_1.SizeOfRawData
if L0_1 <= 12000 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pesecs
L1_1 = pehdr
L1_1 = L1_1.NumberOfSections
L0_1 = L0_1[L1_1]
L0_1 = L0_1.VirtualSize
if L0_1 <= 12000 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pehdr
L0_1 = L0_1.Machine
if L0_1 ~= 332 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = peattributes
L0_1 = L0_1.epscn_islast
if L0_1 ~= false then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = {}
L1_1 = {}
L1_1.sig = "\232\000\000\000\000]\139\197\129\237\194\024@\000-\153\b\000\000-"
L1_1.xray_type = 1
L1_1.bytes_to_decrypt = 0
L2_1 = {}
L2_1.sig = "\232\000\000\000\000]\139\197\129\237\194\024@\000-\153\b\000\000-"
L2_1.xray_type = 1
L2_1.bytes_to_decrypt = 0
L3_1 = {}
L3_1.sig = "\232\000\000\000\000]\139\197\129\237\194\bA\000-\153\b\000\000-"
L3_1.xray_type = 1
L3_1.bytes_to_decrypt = 0
L4_1 = {}
L4_1.sig = "\232\000\000\000\000]\139\197\129\237\142\024@\000-e\b\000\000-"
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
L5_1 = -16384
L6_1 = -8192
return L1_1(L2_1, L3_1, L4_1, L5_1, L6_1)
