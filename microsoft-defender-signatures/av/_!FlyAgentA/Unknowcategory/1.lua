local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
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
L0_1 = pesecs
L0_1 = L0_1[1]
L0_1 = L0_1.NameDW
if L0_1 ~= 2019914798 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pesecs
L1_1 = pehdr
L1_1 = L1_1.NumberOfSections
L0_1 = L0_1[L1_1]
L0_1 = L0_1.NameDW
if L0_1 ~= 1920168494 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = headerpage
L2_1 = 505
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 1952539694 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = headerpage
L2_1 = 541
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 3758096448 then
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
L3_1 = 525
L1_1 = L1_1(L2_1, L3_1)
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
L2_1 = mp
L2_1 = L2_1.readu_u32
L3_1 = headerpage
L4_1 = 525
L2_1 = L2_1(L3_1, L4_1)
L2_1 = 843 + L2_1
L3_1 = 16
L1_1 = L1_1(L2_1, L3_1)
L2_1 = mp
L2_1 = L2_1.crc32
L3_1 = -1
L4_1 = L1_1
L5_1 = 1
L6_1 = 16
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if L2_1 ~= 343620366 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
