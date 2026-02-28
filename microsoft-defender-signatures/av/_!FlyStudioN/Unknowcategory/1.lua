local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = peattributes
L0_1 = L0_1.hasappendeddata
if L0_1 ~= true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = peattributes
L0_1 = L0_1.isdll
if L0_1 ~= true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pehdr
L0_1 = L0_1.NumberOfSections
if L0_1 ~= 6 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pesecs
L1_1 = pehdr
L1_1 = L1_1.NumberOfSections
L0_1 = L0_1[L1_1]
L0_1 = L0_1.NameDW
if L0_1 ~= 1952539694 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = headerpage
L2_1 = 593
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 159744 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = headerpage
L2_1 = 597
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 20480 then
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
L1_1 = pe
L1_1 = L1_1.foffset_rva
L2_1 = 20480
L1_1 = L1_1(L2_1)
L2_1 = 2
L0_1 = L0_1(L1_1, L2_1)
L1_1 = mp
L1_1 = L1_1.readu_u16
L2_1 = L0_1
L3_1 = 1
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= 19031 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readfile
L2_1 = pe
L2_1 = L2_1.foffset_rva
L3_1 = 24976
L2_1 = L2_1(L3_1)
L3_1 = 80
L1_1 = L1_1(L2_1, L3_1)
L2_1 = mp
L2_1 = L2_1.crc32
L3_1 = -1
L4_1 = L1_1
L5_1 = 1
L6_1 = 80
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if L2_1 ~= 2213776060 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
