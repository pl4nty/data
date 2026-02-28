local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
if L0_1 == nil then
  L1_1 = L0_1.image_path
  if L1_1 == nil then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1.image_path
L1_1 = L1_1(L2_1)
L3_1 = L1_1
L2_1 = L1_1.match
L4_1 = "([^\\]+)$"
L2_1 = L2_1(L3_1, L4_1)
L2_1 = not L2_1
if L2_1 == "explorer.exe" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.GetScannedPPID
L2_1 = L2_1()
if L2_1 == "" or L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.GetProcessCommandLine
L4_1 = L2_1
L3_1 = L3_1(L4_1)
if L3_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = string
L4_1 = L4_1.gsub
L5_1 = string
L5_1 = L5_1.lower
L6_1 = L3_1
L5_1 = L5_1(L6_1)
L6_1 = "\\\"|[-;]+(?=s*[\"'])?"
L7_1 = ""
L4_1 = L4_1(L5_1, L6_1, L7_1)
L3_1 = L4_1
L4_1 = {}
L5_1 = "http"
L4_1[1] = L5_1
L5_1 = contains
L6_1 = L3_1
L7_1 = L4_1
L5_1 = L5_1(L6_1, L7_1)
if not L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = {}
L6_1 = "curl"
L7_1 = "minimized"
L5_1[1] = L6_1
L5_1[2] = L7_1
L6_1 = contains
L7_1 = L3_1
L8_1 = L5_1
L6_1 = L6_1(L7_1, L8_1)
if not L6_1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = {}
L7_1 = "guard:"
L8_1 = "cdn trace id:"
L9_1 = "gatecheck:"
L10_1 = "origin portal :"
L11_1 = "place your entry here:"
L12_1 = "your work goes here :"
L13_1 = "userauth:"
L14_1 = " rem "
L6_1[1] = L7_1
L6_1[2] = L8_1
L6_1[3] = L9_1
L6_1[4] = L10_1
L6_1[5] = L11_1
L6_1[6] = L12_1
L6_1[7] = L13_1
L6_1[8] = L14_1
L7_1 = contains
L8_1 = L3_1
L9_1 = L6_1
L7_1 = L7_1(L8_1, L9_1)
if not L7_1 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = mp
L7_1 = L7_1.INFECTED
return L7_1
