local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = mp
L0_1 = L0_1.GetLnkInfo
L0_1 = L0_1()
L1_1 = L0_1.Arguments
L2_1 = isnull
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if L2_1 then
  L1_1 = L0_1.RelativePath
end
L3_1 = L1_1
L2_1 = L1_1.lower
L2_1 = L2_1(L3_1)
L1_1 = L2_1
L2_1 = {}
L3_1 = "odbcconf"
L4_1 = "rundll32"
L5_1 = "regsvr32"
L6_1 = "powershell"
L7_1 = "calc"
L8_1 = "wscript"
L9_1 = "cscript"
L10_1 = "mshta"
L11_1 = ".cmd"
L12_1 = ".bat"
L13_1 = "..\\.."
L2_1[1] = L3_1
L2_1[2] = L4_1
L2_1[3] = L5_1
L2_1[4] = L6_1
L2_1[5] = L7_1
L2_1[6] = L8_1
L2_1[7] = L9_1
L2_1[8] = L10_1
L2_1[9] = L11_1
L2_1[10] = L12_1
L2_1[11] = L13_1
L3_1 = contains
L4_1 = L1_1
L5_1 = L2_1
L3_1 = L3_1(L4_1, L5_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
