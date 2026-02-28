local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = mp
L0_1 = L0_1.GetScannedPPID
L0_1 = L0_1()
L1_1 = mp
L1_1 = L1_1.GetParentProcInfo
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L0_1 == "" or L0_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
if L1_1 == "" or L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.GetProcessCommandLine
L3_1 = L0_1
L2_1 = L2_1(L3_1)
L3_1 = mp
L3_1 = L3_1.GetProcessCommandLine
L4_1 = L1_1
L3_1 = L3_1(L4_1)
L4_1 = {}
L5_1 = "sophosstopservices.bat"
L6_1 = "\\syncro\\"
L7_1 = "sophosremoval.ps1"
L8_1 = "\\programdata\\amagent\\"
L9_1 = "microsoft intune management extension"
L10_1 = "smstspowershellscripts"
L4_1[1] = L5_1
L4_1[2] = L6_1
L4_1[3] = L7_1
L4_1[4] = L8_1
L4_1[5] = L9_1
L4_1[6] = L10_1
L5_1 = contains
L6_1 = L2_1
L7_1 = L4_1
L5_1 = L5_1(L6_1, L7_1)
if L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = contains
L6_1 = L3_1
L7_1 = L4_1
L5_1 = L5_1(L6_1, L7_1)
if L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.INFECTED
return L5_1
