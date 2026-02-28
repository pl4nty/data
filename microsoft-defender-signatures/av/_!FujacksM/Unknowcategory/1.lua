local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = pesecs
L0_1 = L0_1[1]
L0_1 = L0_1.NameDW
if L0_1 ~= 4411950 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pesecs
L1_1 = pehdr
L1_1 = L1_1.NumberOfSections
L0_1 = L0_1[L1_1]
L0_1 = L0_1.NameDW
if L0_1 ~= 4411950 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = peattributes
L0_1 = L0_1.epinfirstsect
if L0_1 ~= true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pehdr
L0_1 = L0_1.NumberOfSections
if L0_1 ~= 2 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = epcode
L2_1 = 1
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 1925695319 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = epcode
L2_1 = 5
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 2380248239 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = epcode
L2_1 = 9
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 1488609085 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = epcode
L2_1 = 13
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 265289498 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = epcode
L2_1 = 17
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 267581356 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = epcode
L2_1 = 21
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 3354918589 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = epcode
L2_1 = 25
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 657513564 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = epcode
L2_1 = 29
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 871873039 then
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
L0_1 = pehdr
L0_1 = L0_1.DataDirectory
L0_1 = L0_1[3]
L0_1 = L0_1.Size
if L0_1 ~= 5140 then
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
L2_1 = pesecs
L2_1 = L2_1[1]
L2_1 = L2_1.VirtualAddress
L2_1 = L2_1 + 1288
L1_1 = L1_1(L2_1)
L2_1 = 80
L0_1 = L0_1(L1_1, L2_1)
L1_1 = mp
L1_1 = L1_1.crc32
L2_1 = -1
L3_1 = L0_1
L4_1 = 1
L5_1 = 80
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if L1_1 ~= 312309962 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
