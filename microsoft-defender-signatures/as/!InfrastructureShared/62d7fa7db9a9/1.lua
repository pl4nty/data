local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.GetScannedPPID
L0_1 = L0_1()
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.GetProcessCommandLine
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L2_1 = L1_1
L1_1 = L1_1.lower
L1_1 = L1_1(L2_1)
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.gsub
L3_1 = L1_1
L4_1 = "%^"
L5_1 = ""
L2_1, L3_1 = L2_1(L3_1, L4_1, L5_1)
if L3_1 < 5 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = string
L4_1 = L4_1.gsub
L5_1 = L2_1
L6_1 = " "
L7_1 = ""
L4_1 = L4_1(L5_1, L6_1, L7_1)
L2_1 = L4_1
L4_1 = {}
L5_1 = "startmshtahttp://"
L6_1 = "cmd/cmshtahttp://"
L4_1[1] = L5_1
L4_1[2] = L6_1
L5_1 = contains
L6_1 = L2_1
L7_1 = L4_1
L5_1 = L5_1(L6_1, L7_1)
if not L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = {}
L6_1 = "winword.exe"
L7_1 = "excel.exe"
L8_1 = "powerpnt.exe"
L9_1 = "mspub.exe"
L5_1[1] = L6_1
L5_1[2] = L7_1
L5_1[3] = L8_1
L5_1[4] = L9_1
L6_1 = IsProcNameInParentProcessTree
L7_1 = "cmdhstr"
L8_1 = L5_1
L6_1 = L6_1(L7_1, L8_1)
if L6_1 then
  L6_1 = mp
  L6_1 = L6_1.INFECTED
  return L6_1
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
