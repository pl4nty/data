local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1
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
L2_1 = L1_1
L1_1 = L1_1.lower
L1_1 = L1_1(L2_1)
if L1_1 ~= nil then
  L2_1 = {}
  L3_1 = ".com"
  L4_1 = ".tmp"
  L5_1 = ".jpg"
  L6_1 = ".sldm"
  L7_1 = ".aac"
  L8_1 = ".eml"
  L9_1 = ".html"
  L10_1 = ".pptm"
  L11_1 = ".cab"
  L12_1 = ".eps"
  L13_1 = ".aiff"
  L14_1 = ".wma"
  L15_1 = ".dotx"
  L16_1 = ".gif"
  L17_1 = ".xlam"
  L18_1 = ".mpeg"
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
  L2_1[12] = L14_1
  L2_1[13] = L15_1
  L2_1[14] = L16_1
  L2_1[15] = L17_1
  L2_1[16] = L18_1
  L3_1 = contains
  L4_1 = L1_1
  L5_1 = L2_1
  L3_1 = L3_1(L4_1, L5_1)
  if not L3_1 then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
end
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
