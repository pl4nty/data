local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "Themida_Attr"
L0_1 = L0_1(L1_1)
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
L0_1 = peattributes
L0_1 = L0_1.hasexports
if L0_1 ~= true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pehdr
L0_1 = L0_1.NumberOfSections
if L0_1 ~= 8 then
  L0_1 = pehdr
  L0_1 = L0_1.NumberOfSections
  if L0_1 ~= 7 then
    L0_1 = mp
    L0_1 = L0_1.CLEAN
    return L0_1
  end
end
L0_1 = pesecs
L1_1 = pehdr
L1_1 = L1_1.NumberOfSections
L1_1 = L1_1 - 1
L0_1 = L0_1[L1_1]
L0_1 = L0_1.Characteristics
if L0_1 ~= 3758096448 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pehdr
L0_1 = L0_1.DataDirectory
L0_1 = L0_1[1]
L0_1 = L0_1.RVA
L1_1 = pehdr
L1_1 = L1_1.DataDirectory
L1_1 = L1_1[1]
L1_1 = L1_1.Size
L2_1 = pe
L2_1 = L2_1.contains_rva
L3_1 = pehdr
L3_1 = L3_1.NumberOfSections
L3_1 = L3_1 - 1
L4_1 = L0_1
L2_1 = L2_1(L3_1, L4_1)
if L2_1 ~= true then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
if L1_1 ~= 91 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = pe
L2_1 = L2_1.foffset_rva
L3_1 = L0_1
L2_1 = L2_1(L3_1)
L0_1 = L2_1
L2_1 = mp
L2_1 = L2_1.readprotection
L3_1 = false
L2_1(L3_1)
L2_1 = mp
L2_1 = L2_1.readfile
L3_1 = L0_1
L4_1 = L1_1 + 4
L2_1 = L2_1(L3_1, L4_1)
L3_1 = mp
L3_1 = L3_1.readu_u32
L4_1 = L2_1
L5_1 = 59
L3_1 = L3_1(L4_1, L5_1)
if L3_1 ~= 1819042862 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L5_1 = L2_1
L4_1 = L2_1.byte
L6_1 = 63
L4_1 = L4_1(L5_1, L6_1)
if L4_1 ~= 0 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = 64
L5_1 = 69
L6_1 = 1
for L7_1 = L4_1, L5_1, L6_1 do
  L9_1 = L2_1
  L8_1 = L2_1.byte
  L10_1 = L7_1
  L8_1 = L8_1(L9_1, L10_1)
  if 122 < L8_1 then
    L8_1 = mp
    L8_1 = L8_1.CLEAN
    return L8_1
  end
  L9_1 = L2_1
  L8_1 = L2_1.byte
  L10_1 = L7_1
  L8_1 = L8_1(L9_1, L10_1)
  if L8_1 < 65 then
    L8_1 = mp
    L8_1 = L8_1.CLEAN
    return L8_1
  end
end
L4_1 = mp
L4_1 = L4_1.INFECTED
return L4_1
