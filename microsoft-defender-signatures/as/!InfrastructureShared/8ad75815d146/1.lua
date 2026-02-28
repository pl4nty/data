local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.GetScannedPPID
L0_1 = L0_1()
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.GetProcessCommandLine
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L2_1 = string
L2_1 = L2_1.match
L3_1 = L1_1
L4_1 = "msiexec%.?e?x?e?\"?'?%s+(.*)$"
L2_1 = L2_1(L3_1, L4_1)
L3_1 = contains
L4_1 = L2_1
L5_1 = {}
L6_1 = ".msi"
L7_1 = ".exe"
L5_1[1] = L6_1
L5_1[2] = L7_1
L3_1 = L3_1(L4_1, L5_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.GetParentProcInfo
L3_1 = L3_1()
if L3_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = string
L4_1 = L4_1.lower
L5_1 = string
L5_1 = L5_1.sub
L6_1 = L3_1.image_path
L7_1 = -7
L5_1, L6_1, L7_1, L8_1 = L5_1(L6_1, L7_1)
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if L4_1 ~= "cmd.exe" then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.GetProcessCommandLine
L6_1 = L3_1.ppid
L5_1 = L5_1(L6_1)
if L5_1 ~= nil then
  L6_1 = string
  L6_1 = L6_1.match
  L8_1 = L5_1
  L7_1 = L5_1.lower
  L7_1 = L7_1(L8_1)
  L8_1 = "^%s*cmd%s*$"
  L6_1 = L6_1(L7_1, L8_1)
  if L6_1 then
    L6_1 = mp
    L6_1 = L6_1.INFECTED
    return L6_1
  end
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
