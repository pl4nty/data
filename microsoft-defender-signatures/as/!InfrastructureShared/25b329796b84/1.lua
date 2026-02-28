local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = bm
L0_1 = L0_1.get_process_relationships
L0_1, L1_1 = L0_1()
if L0_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = ipairs
L3_1 = L0_1
L2_1, L3_1, L4_1 = L2_1(L3_1)
for L5_1, L6_1 in L2_1, L3_1, L4_1 do
  L7_1 = L6_1.image_path
  if L7_1 ~= nil then
    L7_1 = string
    L7_1 = L7_1.lower
    L8_1 = string
    L8_1 = L8_1.match
    L9_1 = L6_1.image_path
    L10_1 = "\\([^\\]+)$"
    L8_1, L9_1, L10_1 = L8_1(L9_1, L10_1)
    L7_1 = L7_1(L8_1, L9_1, L10_1)
    if L7_1 == "services.exe" then
      L8_1 = AddResearchData
      L9_1 = "BM"
      L10_1 = true
      L8_1(L9_1, L10_1)
      L8_1 = mp
      L8_1 = L8_1.INFECTED
      return L8_1
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
