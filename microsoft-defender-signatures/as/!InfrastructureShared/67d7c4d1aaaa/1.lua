local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
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
if L1_1 ~= nil then
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  L1_1 = L2_1
end
L2_1 = {}
L3_1 = "http"
L2_1[1] = L3_1
L3_1 = contains
L4_1 = L1_1
L5_1 = L2_1
L3_1 = L3_1(L4_1, L5_1)
if not L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = {}
L4_1 = "curl"
L5_1 = "irm"
L6_1 = "iwr"
L7_1 = "invoke-restmethod"
L8_1 = "invoke-webrequest"
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L3_1[4] = L7_1
L3_1[5] = L8_1
L4_1 = contains
L5_1 = L1_1
L6_1 = L3_1
L4_1 = L4_1(L5_1, L6_1)
if not L4_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.GetParentProcInfo
L4_1 = L4_1()
if L4_1 ~= nil then
  L5_1 = L4_1.image_path
  if L5_1 ~= nil then
    L5_1 = string
    L5_1 = L5_1.lower
    L6_1 = L4_1.image_path
    L5_1 = L5_1(L6_1)
    L7_1 = L5_1
    L6_1 = L5_1.match
    L8_1 = "([^\\]+)$"
    L6_1 = L6_1(L7_1, L8_1)
    if L6_1 == "explorer.exe" then
      L6_1 = mp
      L6_1 = L6_1.INFECTED
      return L6_1
    end
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
