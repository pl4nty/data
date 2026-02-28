local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = {}
L1_1 = "conhost.exe"
L2_1 = "control.exe"
L3_1 = "wscript.exe"
L0_1[1] = L1_1
L0_1[2] = L2_1
L0_1[3] = L3_1
L1_1 = IsProcNameInParentProcessTree
L2_1 = "cmdhstr"
L3_1 = L0_1
L4_1 = 2
L1_1 = L1_1(L2_1, L3_1, L4_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
