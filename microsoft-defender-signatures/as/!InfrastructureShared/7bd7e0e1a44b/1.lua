local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1
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
L2_1 = #L1_1
if L2_1 <= 60 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
if L1_1 ~= nil then
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  L1_1 = L2_1
end
L2_1 = {}
L3_1 = ".shop/"
L4_1 = ".xyz/"
L5_1 = ".icu/"
L6_1 = ".lat/"
L7_1 = ".fun/"
L8_1 = ".bet/"
L9_1 = ".live/"
L10_1 = ".life/"
L11_1 = ".online/"
L12_1 = ".bond/"
L13_1 = ".top/"
L14_1 = ".world/"
L15_1 = ".click/"
L16_1 = ".forest/"
L17_1 = ".github.io/"
L18_1 = ".run/"
L19_1 = ".was/"
L20_1 = ".today/"
L21_1 = ".cyou/"
L22_1 = "github.com/"
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
L2_1[17] = L19_1
L2_1[18] = L20_1
L2_1[19] = L21_1
L2_1[20] = L22_1
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
if L3_1 == nil then
  L4_1 = L3_1.image_path
  if L4_1 == nil then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
end
L4_1 = string
L4_1 = L4_1.lower
L5_1 = L3_1.image_path
L4_1 = L4_1(L5_1)
L6_1 = L4_1
L5_1 = L4_1.match
L7_1 = "([^\\]+)$"
L5_1 = L5_1(L6_1, L7_1)
L6_1 = {}
L6_1["explorer.exe"] = true
L6_1["powershell.exe"] = true
L6_1["mshta.exe"] = true
L7_1 = L6_1[L5_1]
if L7_1 then
  L7_1 = mp
  L7_1 = L7_1.INFECTED
  return L7_1
end
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
