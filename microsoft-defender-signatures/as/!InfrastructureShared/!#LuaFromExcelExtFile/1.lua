local L0_1, L1_1, L2_1
L0_1 = mp
L0_1 = L0_1.UfsGetMetadataBool
L1_1 = "Lua:ExcelExt"
L2_1 = true
L0_1, L1_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 0 or not L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
