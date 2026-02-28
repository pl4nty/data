local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
if L0_1 then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = L0_1.image_path
  L2_1 = L2_1(L3_1)
  L3_1 = "python.exe"
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if L1_1 then
    L1_1 = mp
    L1_1 = L1_1.INFECTED
    return L1_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
