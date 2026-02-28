local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = pe
L0_1 = L0_1.get_exports
L0_1, L1_1 = L0_1()
if L0_1 == 1 then
  L2_1 = pe
  L2_1 = L2_1.mmap_string_rva
  L3_1 = L1_1[1]
  L3_1 = L3_1.namerva
  L4_1 = 64
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 == nil then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  L3_1 = string
  L3_1 = L3_1.lower
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  if L3_1 == "exec" then
    L3_1 = mp
    L3_1 = L3_1.INFECTED
    return L3_1
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
