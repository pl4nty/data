local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = peattributes
L0_1 = L0_1.isexe
if L0_1 ~= true then
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
if L0_1 ~= 4 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pehdr
L0_1 = L0_1.DataDirectory
L0_1 = L0_1[3]
L0_1 = L0_1.Size
if L0_1 <= 8192 then
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
L2_1 = pehdr
L2_1 = L2_1.DataDirectory
L2_1 = L2_1[3]
L2_1 = L2_1.RVA
L1_1 = L1_1(L2_1)
L2_1 = 28
L0_1 = L0_1(L1_1, L2_1)
L1_1 = mp
L1_1 = L1_1.readu_u32
L2_1 = L0_1
L3_1 = 1
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= 0 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readu_u32
L2_1 = L0_1
L3_1 = 5
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= 0 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readu_u32
L2_1 = L0_1
L3_1 = 9
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= 4 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readu_u32
L2_1 = L0_1
L3_1 = 13
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= 196608 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readu_u32
L2_1 = L0_1
L3_1 = 17
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= 3 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readu_u32
L2_1 = L0_1
L3_1 = 21
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= 2147483688 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readu_u32
L2_1 = L0_1
L3_1 = 25
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= 10 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readfile
L2_1 = doshdr
L2_1 = L2_1.e_lfanew
L3_1 = pehdr
L3_1 = L3_1.SizeOfOptionalHeader
L2_1 = L2_1 + L3_1
L2_1 = L2_1 + 24
L2_1 = L2_1 + 80
L3_1 = 40
L1_1 = L1_1(L2_1, L3_1)
L2_1 = mp
L2_1 = L2_1.readfile
L3_1 = mp
L3_1 = L3_1.readu_u32
L4_1 = L1_1
L5_1 = 21
L3_1 = L3_1(L4_1, L5_1)
L4_1 = 112
L2_1 = L2_1(L3_1, L4_1)
L3_1 = mp
L3_1 = L3_1.readu_u32
L4_1 = L2_1
L5_1 = 1
L3_1 = L3_1(L4_1, L5_1)
if L3_1 ~= 0 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.readu_u16
L4_1 = L2_1
L5_1 = 5
L3_1 = L3_1(L4_1, L5_1)
if L3_1 ~= 4096 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.crc32
L4_1 = -1
L5_1 = L2_1
L6_1 = 1
L7_1 = 112
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if L3_1 ~= 1254192188 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.INFECTED
return L4_1
