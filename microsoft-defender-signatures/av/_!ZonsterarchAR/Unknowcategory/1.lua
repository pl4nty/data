local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = peattributes
L0_1 = L0_1.hasappendeddata
if L0_1 ~= true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = peattributes
L0_1 = L0_1.isexe
if L0_1 ~= true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = peattributes
L0_1 = L0_1.hasexports
if L0_1 ~= false then
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
L2_1 = pehdr
L2_1 = L2_1.NumberOfSections
L1_1 = L1_1[L2_1]
L1_1 = L1_1.PointerToRawData
L2_1 = pesecs
L3_1 = pehdr
L3_1 = L3_1.NumberOfSections
L2_1 = L2_1[L3_1]
L2_1 = L2_1.SizeOfRawData
L1_1 = L1_1 + L2_1
L2_1 = 76
L0_1 = L0_1(L1_1, L2_1)
L1_1 = mp
L1_1 = L1_1.crc32
L2_1 = -1
L3_1 = L0_1
L4_1 = 1
L5_1 = 11
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if L1_1 ~= 1339394596 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.writeu_u8
L3_1 = L0_1
L4_1 = 25
L6_1 = L0_1
L5_1 = L0_1.byte
L7_1 = 26
L5_1, L6_1, L7_1, L8_1 = L5_1(L6_1, L7_1)
L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1)
L2_1 = mp
L2_1 = L2_1.writeu_u8
L3_1 = L0_1
L4_1 = 27
L6_1 = L0_1
L5_1 = L0_1.byte
L7_1 = 26
L5_1, L6_1, L7_1, L8_1 = L5_1(L6_1, L7_1)
L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1)
L2_1 = mp
L2_1 = L2_1.writeu_u8
L3_1 = L0_1
L4_1 = 28
L6_1 = L0_1
L5_1 = L0_1.byte
L7_1 = 26
L5_1, L6_1, L7_1, L8_1 = L5_1(L6_1, L7_1)
L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1)
L2_1 = mp
L2_1 = L2_1.bitxor
L3_1 = mp
L3_1 = L3_1.readu_u32
L4_1 = L0_1
L5_1 = 25
L3_1 = L3_1(L4_1, L5_1)
L4_1 = mp
L4_1 = L4_1.readu_u32
L5_1 = L0_1
L6_1 = 65
L4_1, L5_1, L6_1, L7_1, L8_1 = L4_1(L5_1, L6_1)
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1)
if L2_1 ~= 1668440380 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.bitxor
L4_1 = mp
L4_1 = L4_1.readu_u32
L5_1 = L0_1
L6_1 = 25
L4_1 = L4_1(L5_1, L6_1)
L5_1 = mp
L5_1 = L5_1.readu_u32
L6_1 = L0_1
L7_1 = 69
L5_1, L6_1, L7_1, L8_1 = L5_1(L6_1, L7_1)
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1)
if L3_1 ~= 1702259048 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.bitxor
L5_1 = mp
L5_1 = L5_1.readu_u32
L6_1 = L0_1
L7_1 = 25
L5_1 = L5_1(L6_1, L7_1)
L6_1 = mp
L6_1 = L6_1.readu_u32
L7_1 = L0_1
L8_1 = 73
L6_1, L7_1, L8_1 = L6_1(L7_1, L8_1)
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if L4_1 ~= 1046767967 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.INFECTED
return L5_1
