local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
if L0_1 == nil then
  L1_1 = L0_1.image_path
  if L1_1 == nil then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1.image_path
L1_1 = L1_1(L2_1)
L3_1 = L1_1
L2_1 = L1_1.find
L4_1 = "\\explorer.exe"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
