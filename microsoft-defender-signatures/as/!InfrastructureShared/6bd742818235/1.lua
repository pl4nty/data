local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
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
if not L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L1_1 = L2_1
L2_1 = {}
L3_1 = " iex"
L4_1 = "invoke-expression"
L5_1 = "iwr"
L6_1 = "invoke-webrequest"
L7_1 = "|iex"
L8_1 = "irm"
L9_1 = "invoke-restmenthod"
L2_1[1] = L3_1
L2_1[2] = L4_1
L2_1[3] = L5_1
L2_1[4] = L6_1
L2_1[5] = L7_1
L2_1[6] = L8_1
L2_1[7] = L9_1
L3_1 = contains
L4_1 = L1_1
L5_1 = L2_1
L3_1 = L3_1(L4_1, L5_1)
if not L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.GetParentProcInfo
L3_1 = L3_1()
if L3_1 ~= nil then
  L4_1 = string
  L4_1 = L4_1.lower
  L5_1 = L3_1.image_path
  L4_1 = L4_1(L5_1)
  L6_1 = L4_1
  L5_1 = L4_1.match
  L7_1 = "([^\\]+)$"
  L5_1 = L5_1(L6_1, L7_1)
  if L5_1 ~= "node.exe" then
    L6_1 = L4_1
    L5_1 = L4_1.match
    L7_1 = "([^\\]+)$"
    L5_1 = L5_1(L6_1, L7_1)
    if L5_1 ~= "npm.exe" then
      goto lbl_65
    end
  end
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
::lbl_65::
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
