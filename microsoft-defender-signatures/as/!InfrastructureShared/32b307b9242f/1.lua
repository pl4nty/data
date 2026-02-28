local L0_1, L1_1, L2_1, L3_1
L0_1 = {}
L1_1 = "wscript.exe"
L2_1 = "cscript.exe"
L0_1[1] = L1_1
L0_1[2] = L2_1
L1_1 = IsProcNameInParentProcessTree
L2_1 = "BM"
L3_1 = L0_1
L1_1 = L1_1(L2_1, L3_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
