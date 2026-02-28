local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.GetScannedPPID
L0_1 = L0_1()
if L0_1 == "" or L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.GetProcessCommandLine
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L1_1 = L2_1
if L1_1 then
  L2_1 = contains
  L3_1 = L1_1
  L4_1 = {}
  L5_1 = "wscript.exe"
  L6_1 = "cmd.exe"
  L7_1 = "powershell.exe"
  L4_1[1] = L5_1
  L4_1[2] = L6_1
  L4_1[3] = L7_1
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 then
    L2_1 = mp
    L2_1 = L2_1.INFECTED
    return L2_1
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
