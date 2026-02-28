local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = doshdr
L0_1 = L0_1.e_csum
if L0_1 ~= 85 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pehdr
L0_1 = L0_1.ImageBase
if L0_1 ~= 4194304 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 409600 <= L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pesecs
L1_1 = pehdr
L1_1 = L1_1.NumberOfSections
L0_1 = L0_1[L1_1]
L0_1 = L0_1.SizeOfRawData
if L0_1 < 7000 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pesecs
L1_1 = pehdr
L1_1 = L1_1.NumberOfSections
L0_1 = L0_1[L1_1]
L0_1 = L0_1.VirtualSize
if L0_1 < 7000 then
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
L0_1 = pehdr
L0_1 = L0_1.SizeOfImage
if L0_1 < 7000 then
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
L0_1 = {}
L1_1 = {}
L1_1.sig = "\232\000\000\000\000\144]\129\237\005 @\000\129\189\0280@\000OMEMt"
L1_1.xray_type = 4
L1_1.bytes_to_decrypt = 0
L2_1 = {}
L2_1.sig = "\232\000\000\000\000]\129\237\005 @\000\129\189H.@\000OMEMt<"
L2_1.xray_type = 4
L2_1.bytes_to_decrypt = 0
L3_1 = {}
L3_1.sig = "\232\000\000\000\000]\129\237\005 @\000\129\189\217.@\000OMEMt<"
L3_1.xray_type = 4
L3_1.bytes_to_decrypt = 0
L4_1 = {}
L4_1.sig = "\232\000\000\000\000]\129\237\005 @\000\129\189\231.@\000OMEMt<"
L4_1.xray_type = 4
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
L5_1 = -12288
L6_1 = -128
return L1_1(L2_1, L3_1, L4_1, L5_1, L6_1)
