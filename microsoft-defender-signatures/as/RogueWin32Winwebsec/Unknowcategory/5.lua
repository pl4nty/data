local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = pehdr
L0_1 = L0_1.NumberOfSections
if L0_1 ~= 5 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pehdr
L0_1 = L0_1.SizeOfImage
if L0_1 ~= 819200 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = headerpage
L2_1 = 649
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 1936487470 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = headerpage
L2_1 = 685
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 3221225536 then
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
L2_1 = L2_1.AddressOfEntryPoint
L1_1 = L1_1(L2_1)
L2_1 = 23
L0_1 = L0_1(L1_1, L2_1)
L1_1 = mp
L1_1 = L1_1.writeu_u32
L2_1 = L0_1
L3_1 = 17
L4_1 = 0
L1_1(L2_1, L3_1, L4_1)
L1_1 = mp
L1_1 = L1_1.crc32
L2_1 = -1
L3_1 = L0_1
L4_1 = 1
L5_1 = 23
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if L1_1 ~= 1897054316 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
