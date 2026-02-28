local L0_1, L1_1, L2_1, L3_1
L0_1 = IsProcNameInParentProcessTree
L1_1 = "cmdhstr"
L2_1 = {}
L3_1 = "onenote.exe"
L2_1[1] = L3_1
L0_1 = L0_1(L1_1, L2_1)
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.INFECTED
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
