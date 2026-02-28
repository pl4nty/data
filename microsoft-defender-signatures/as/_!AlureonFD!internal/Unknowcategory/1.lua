local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = pehdr
L0_1 = L0_1.NumberOfSections
if L0_1 ~= 7 then
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
L0_1 = L0_1.no_relocs
if L0_1 ~= false then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = peattributes
L0_1 = L0_1.epscn_valign
if L0_1 == true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pehdr
L0_1 = L0_1.DataDirectory
L0_1 = L0_1[7]
L0_1 = L0_1.RVA
if L0_1 < 24576 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pehdr
L0_1 = L0_1.DataDirectory
L0_1 = L0_1[7]
L0_1 = L0_1.Size
if L0_1 ~= 28 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = headerpage
L2_1 = 577
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 1835365422 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u16
L1_1 = headerpage
L2_1 = 581
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 112 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pesecs
L1_1 = pehdr
L1_1 = L1_1.NumberOfSections
L0_1 = L0_1[L1_1]
L0_1 = L0_1.PointerToRawData
if L0_1 < 98304 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pesecs
L1_1 = pehdr
L1_1 = L1_1.NumberOfSections
L0_1 = L0_1[L1_1]
L0_1 = L0_1.PointerToRawData
if 200704 < L0_1 then
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
L3_1 = 597
L1_1 = L1_1(L2_1, L3_1)
L2_1 = mp
L2_1 = L2_1.readu_u32
L3_1 = headerpage
L4_1 = 593
L2_1 = L2_1(L3_1, L4_1)
L1_1 = L1_1 + L2_1
L1_1 = L1_1 - 8192
L2_1 = 8192
L0_1 = L0_1(L1_1, L2_1)
L1_1 = mp
L1_1 = L1_1.crc32
L2_1 = -1
L3_1 = L0_1
L4_1 = 1
L5_1 = 8192
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if L1_1 ~= 3673850997 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
