local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = pehdr
L0_1 = L0_1.NumberOfSections
if L0_1 <= 5 then
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
L0_1 = pesecs
L0_1 = L0_1[1]
L0_1 = L0_1.SizeOfRawData
if L0_1 ~= 0 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = headerpage
L2_1 = 433
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 2048 then
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
L1_1 = mp
L1_1 = L1_1.readu_u32
L2_1 = headerpage
L3_1 = 437
L1_1 = L1_1(L2_1, L3_1)
L2_1 = 1280
L0_1 = L0_1(L1_1, L2_1)
L1_1 = mp
L1_1 = L1_1.crc32
L2_1 = -1
L3_1 = L0_1
L4_1 = 1
L5_1 = 240
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if L1_1 ~= 1584319641 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.crc32
L3_1 = -1
L4_1 = L0_1
L5_1 = 273
L6_1 = 768
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if L2_1 ~= 2930427897 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
