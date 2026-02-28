local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
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
L0_1 = mp
L0_1 = L0_1.readprotection
L1_1 = false
L0_1(L1_1)
L0_1 = pesecs
L1_1 = pehdr
L1_1 = L1_1.NumberOfSections
L0_1 = L0_1[L1_1]
L0_1 = L0_1.PointerToRawData
L1_1 = pesecs
L2_1 = pehdr
L2_1 = L2_1.NumberOfSections
L1_1 = L1_1[L2_1]
L1_1 = L1_1.SizeOfRawData
L0_1 = L0_1 + L1_1
L1_1 = mp
L1_1 = L1_1.getfilesize
L1_1 = L1_1()
if L0_1 < L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.readfile
L3_1 = L0_1
L4_1 = 76
L2_1 = L2_1(L3_1, L4_1)
L3_1 = mp
L3_1 = L3_1.crc32
L4_1 = -1
L5_1 = L2_1
L6_1 = 1
L7_1 = 11
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if L3_1 ~= 1339394596 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.writeu_u8
L5_1 = L2_1
L6_1 = 25
L8_1 = L2_1
L7_1 = L2_1.byte
L9_1 = 26
L7_1, L8_1, L9_1, L10_1 = L7_1(L8_1, L9_1)
L4_1(L5_1, L6_1, L7_1, L8_1, L9_1, L10_1)
L4_1 = mp
L4_1 = L4_1.writeu_u8
L5_1 = L2_1
L6_1 = 27
L8_1 = L2_1
L7_1 = L2_1.byte
L9_1 = 26
L7_1, L8_1, L9_1, L10_1 = L7_1(L8_1, L9_1)
L4_1(L5_1, L6_1, L7_1, L8_1, L9_1, L10_1)
L4_1 = mp
L4_1 = L4_1.writeu_u8
L5_1 = L2_1
L6_1 = 28
L8_1 = L2_1
L7_1 = L2_1.byte
L9_1 = 26
L7_1, L8_1, L9_1, L10_1 = L7_1(L8_1, L9_1)
L4_1(L5_1, L6_1, L7_1, L8_1, L9_1, L10_1)
L4_1 = mp
L4_1 = L4_1.bitxor
L5_1 = mp
L5_1 = L5_1.readu_u32
L6_1 = L2_1
L7_1 = 25
L5_1 = L5_1(L6_1, L7_1)
L6_1 = mp
L6_1 = L6_1.readu_u32
L7_1 = L2_1
L8_1 = 45
L6_1, L7_1, L8_1, L9_1, L10_1 = L6_1(L7_1, L8_1)
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1, L9_1, L10_1)
if L4_1 ~= 1918975008 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.bitxor
L6_1 = mp
L6_1 = L6_1.readu_u32
L7_1 = L2_1
L8_1 = 25
L6_1 = L6_1(L7_1, L8_1)
L7_1 = mp
L7_1 = L7_1.readu_u32
L8_1 = L2_1
L9_1 = 49
L7_1, L8_1, L9_1, L10_1 = L7_1(L8_1, L9_1)
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1, L10_1)
if L5_1 ~= 1986619491 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = mp
L6_1 = L6_1.bitxor
L7_1 = mp
L7_1 = L7_1.readu_u32
L8_1 = L2_1
L9_1 = 25
L7_1 = L7_1(L8_1, L9_1)
L8_1 = mp
L8_1 = L8_1.readu_u32
L9_1 = L2_1
L10_1 = 53
L8_1, L9_1, L10_1 = L8_1(L9_1, L10_1)
L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
if L6_1 ~= 1701076837 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = mp
L7_1 = L7_1.INFECTED
return L7_1
