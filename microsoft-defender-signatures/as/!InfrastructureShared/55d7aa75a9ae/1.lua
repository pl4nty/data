local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1
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
  L2_1 = #L1_1
  if not (L2_1 <= 60) then
    goto lbl_23
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_23::
L2_1 = string
L2_1 = L2_1.gsub
L3_1 = string
L3_1 = L3_1.lower
L4_1 = L1_1
L3_1 = L3_1(L4_1)
L4_1 = "[%'\"]%)?%+%(?[%'\"]"
L5_1 = ""
L2_1 = L2_1(L3_1, L4_1, L5_1)
L1_1 = L2_1
L2_1 = {}
L3_1 = ".cloud"
L4_1 = ".press"
L5_1 = ".pro"
L6_1 = ".shop"
L7_1 = ".hair"
L8_1 = ".lat"
L9_1 = ".bond"
L10_1 = ".top"
L11_1 = ".cyou"
L12_1 = ".click"
L13_1 = ".forest"
L14_1 = ".world"
L15_1 = ".today"
L16_1 = ".life"
L17_1 = ".digital"
L18_1 = ".run"
L19_1 = ".fun"
L20_1 = ".icu"
L21_1 = ".link"
L22_1 = ".live"
L23_1 = ".cfd"
L24_1 = ".lol"
L25_1 = ".ru"
L26_1 = ".info"
L27_1 = ".org"
L28_1 = ".moe"
L29_1 = ".com"
L30_1 = ".exposed"
L31_1 = ".net"
L32_1 = ".ad"
L33_1 = ".us"
L34_1 = ".su"
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
L2_1[21] = L23_1
L2_1[22] = L24_1
L2_1[23] = L25_1
L2_1[24] = L26_1
L2_1[25] = L27_1
L2_1[26] = L28_1
L2_1[27] = L29_1
L2_1[28] = L30_1
L2_1[29] = L31_1
L2_1[30] = L32_1
L2_1[31] = L33_1
L2_1[32] = L34_1
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
L3_1 = L3_1.INFECTED
return L3_1
