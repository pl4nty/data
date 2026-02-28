local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1
L0_1 = {}
L1_1 = "splsamodeinitialize"
L2_1 = "servicemain"
L0_1[1] = L1_1
L0_1[2] = L2_1
L1_1 = mp
L1_1 = L1_1.getfilesize
L1_1 = L1_1()
if L1_1 < 102400 or 12582912 < L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = pe
L2_1 = L2_1.get_exports
L2_1, L3_1 = L2_1()
L4_1 = 0
if L2_1 < 2 or 7 < L2_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = 1
L6_1 = L2_1
L7_1 = 1
for L8_1 = L5_1, L6_1, L7_1 do
  L9_1 = pe
  L9_1 = L9_1.mmap_string_rva
  L10_1 = L3_1[L8_1]
  L10_1 = L10_1.namerva
  L11_1 = 64
  L9_1 = L9_1(L10_1, L11_1)
  if L9_1 ~= nil then
    L10_1 = ipairs
    L11_1 = L0_1
    L10_1, L11_1, L12_1 = L10_1(L11_1)
    for L13_1, L14_1 in L10_1, L11_1, L12_1 do
      L15_1 = string
      L15_1 = L15_1.lower
      L16_1 = L9_1
      L15_1 = L15_1(L16_1)
      if L15_1 == L14_1 then
        L4_1 = L4_1 + 1
      end
      if 1 < L4_1 then
        L15_1 = mp
        L15_1 = L15_1.INFECTED
        return L15_1
      end
    end
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
