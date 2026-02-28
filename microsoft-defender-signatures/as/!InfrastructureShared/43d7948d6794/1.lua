local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1
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
if L1_1 then
  L2_1 = #L1_1
  if not (L2_1 < 70) then
    goto lbl_23
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_23::
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L1_1 = L2_1
L2_1 = mp
L2_1 = L2_1.GetParentProcInfo
L2_1 = L2_1()
if L2_1 == nil then
  L3_1 = L2_1.image_path
  if L3_1 == nil then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
end
L3_1 = string
L3_1 = L3_1.lower
L4_1 = L2_1.image_path
L3_1 = L3_1(L4_1)
L5_1 = L3_1
L4_1 = L3_1.match
L6_1 = "([^\\]+)$"
L4_1 = L4_1(L5_1, L6_1)
if L4_1 ~= "explorer.exe" then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = {}
L5_1 = "cause"
L6_1 = "correspondence"
L7_1 = "could"
L8_1 = "delays"
L9_1 = "enter"
L10_1 = "expands"
L11_1 = "file-aid"
L12_1 = "grants"
L13_1 = "individual"
L14_1 = "instructions"
L15_1 = "letter"
L16_1 = "manage"
L17_1 = "notice"
L18_1 = "related"
L19_1 = "retreat"
L20_1 = "rogas"
L21_1 = "selecting"
L22_1 = "subsidy"
L23_1 = "system"
L24_1 = "tax"
L25_1 = "taxpa"
L26_1 = "understanding"
L27_1 = "update"
L4_1[1] = L5_1
L4_1[2] = L6_1
L4_1[3] = L7_1
L4_1[4] = L8_1
L4_1[5] = L9_1
L4_1[6] = L10_1
L4_1[7] = L11_1
L4_1[8] = L12_1
L4_1[9] = L13_1
L4_1[10] = L14_1
L4_1[11] = L15_1
L4_1[12] = L16_1
L4_1[13] = L17_1
L4_1[14] = L18_1
L4_1[15] = L19_1
L4_1[16] = L20_1
L4_1[17] = L21_1
L4_1[18] = L22_1
L4_1[19] = L23_1
L4_1[20] = L24_1
L4_1[21] = L25_1
L4_1[22] = L26_1
L4_1[23] = L27_1
L5_1 = contains
L6_1 = L1_1
L7_1 = L4_1
L5_1 = L5_1(L6_1, L7_1)
if not L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = {}
L6_1 = ".shop"
L7_1 = ".hair"
L8_1 = ".lat"
L9_1 = ".bond"
L10_1 = ".top"
L11_1 = ".cyou"
L12_1 = ".click"
L13_1 = ".xyz"
L14_1 = ".forest"
L15_1 = ".help"
L16_1 = ".world"
L17_1 = ".today"
L18_1 = ".life"
L19_1 = ".digital"
L20_1 = ".run"
L21_1 = ".bet"
L22_1 = ".fun"
L23_1 = ".icu"
L24_1 = ".link"
L25_1 = ".tools"
L26_1 = ".cfd"
L27_1 = ".lol"
L28_1 = ".com"
L5_1[1] = L6_1
L5_1[2] = L7_1
L5_1[3] = L8_1
L5_1[4] = L9_1
L5_1[5] = L10_1
L5_1[6] = L11_1
L5_1[7] = L12_1
L5_1[8] = L13_1
L5_1[9] = L14_1
L5_1[10] = L15_1
L5_1[11] = L16_1
L5_1[12] = L17_1
L5_1[13] = L18_1
L5_1[14] = L19_1
L5_1[15] = L20_1
L5_1[16] = L21_1
L5_1[17] = L22_1
L5_1[18] = L23_1
L5_1[19] = L24_1
L5_1[20] = L25_1
L5_1[21] = L26_1
L5_1[22] = L27_1
L5_1[23] = L28_1
L6_1 = contains
L7_1 = L1_1
L8_1 = L5_1
L6_1 = L6_1(L7_1, L8_1)
if not L6_1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = mp
L6_1 = L6_1.INFECTED
return L6_1
