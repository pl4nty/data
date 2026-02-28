local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = pe
L0_1 = L0_1.get_exports
L0_1, L1_1 = L0_1()
if L0_1 < 10 or 400 < L0_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = 0
L3_1 = 1
L4_1 = L0_1
L5_1 = 1
for L6_1 = L3_1, L4_1, L5_1 do
  L7_1 = pe
  L7_1 = L7_1.mmap_string_rva
  L8_1 = L1_1[L6_1]
  L8_1 = L8_1.namerva
  L9_1 = 64
  L7_1 = L7_1(L8_1, L9_1)
  if L7_1 == "ExtractEdgePasswordsToFile" or L7_1 == "ExtractEdgePasswords" then
    L2_1 = L2_1 + 1
    if L2_1 == 2 then
      L8_1 = mp
      L8_1 = L8_1.INFECTED
      return L8_1
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
