local L0_1, L1_1, L2_1
L0_1 = mp
L0_1 = L0_1.getfilename
L0_1 = L0_1()
L1_1 = IsPathExcludedXplatML
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 ~= true then
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
