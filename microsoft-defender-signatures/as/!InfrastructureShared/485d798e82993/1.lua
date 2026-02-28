local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.image_path
  if L1_1 ~= nil then
    goto lbl_12
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_12::
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1.image_path
L1_1 = L1_1(L2_1)
L3_1 = L1_1
L2_1 = L1_1.match
L4_1 = "([^\\]+)$"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 ~= "explorer.exe" then
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
L4_1 = string
L4_1 = L4_1.lower
L5_1 = L3_1
L4_1 = L4_1(L5_1)
L3_1 = L4_1
if not L3_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = #L3_1
if L4_1 < 50 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = MpCommon
L4_1 = L4_1.GetImagePathFromPid
L5_1 = L2_1
L4_1 = L4_1(L5_1)
L5_1 = contains
L6_1 = L4_1
L7_1 = {}
L8_1 = "powershell"
L9_1 = "mshta"
L10_1 = "cmd"
L7_1[1] = L8_1
L7_1[2] = L9_1
L7_1[3] = L10_1
L5_1 = L5_1(L6_1, L7_1)
if not L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = contains
L6_1 = L3_1
L7_1 = {}
L8_1 = "http"
L7_1[1] = L8_1
L5_1 = L5_1(L6_1, L7_1)
if not L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = {}
L6_1 = "iex"
L7_1 = "iwr"
L8_1 = "irm"
L9_1 = "curl"
L10_1 = "bitsadmin"
L11_1 = "e:jscript"
L12_1 = "downloadstring"
L13_1 = "invoke-restmethod"
L14_1 = "invoke-webrequest"
L15_1 = "invoke-expression"
L16_1 = "start-process"
L17_1 = "verif"
L18_1 = "rundll32"
L19_1 = "captcha"
L20_1 = " ray"
L21_1 = " recaptcha"
L22_1 = " re captcha"
L23_1 = " rcaptcha"
L24_1 = "press enter"
L25_1 = " clip free"
L26_1 = " over free"
L27_1 = "robot: r"
L28_1 = "robot - r"
L29_1 = "robot - cloudflare"
L30_1 = "robot: cloudflare"
L31_1 = "robot: captcha"
L32_1 = "robot - captcha"
L33_1 = "robot"
L34_1 = "human - r"
L35_1 = "human: r"
L36_1 = "human: captcha"
L37_1 = "human - captcha"
L38_1 = "human"
L39_1 = "/c start /min powershell"
L40_1 = "microsoft windows: fix internet dns service reconnect"
L41_1 = "restart dns service in the microsoft windows system"
L42_1 = "microsoft  defender services secure access key"
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
L5_1[24] = L29_1
L5_1[25] = L30_1
L5_1[26] = L31_1
L5_1[27] = L32_1
L5_1[28] = L33_1
L5_1[29] = L34_1
L5_1[30] = L35_1
L5_1[31] = L36_1
L5_1[32] = L37_1
L5_1[33] = L38_1
L5_1[34] = L39_1
L5_1[35] = L40_1
L5_1[36] = L41_1
L5_1[37] = L42_1
L6_1 = contains
L7_1 = L3_1
L8_1 = L5_1
L6_1 = L6_1(L7_1, L8_1)
if L6_1 then
  L6_1 = mp
  L6_1 = L6_1.INFECTED
  return L6_1
end
L6_1 = MpCommon
L6_1 = L6_1.StringRegExpSearch
L7_1 = "(?i)[^\\w\\d\\s]w[indowstyle]*\\s+(?:h[iden]*|1|m[inimized]*)\\s+"
L8_1 = L3_1
L6_1, L7_1 = L6_1(L7_1, L8_1)
if L6_1 then
  L8_1 = mp
  L8_1 = L8_1.INFECTED
  return L8_1
end
L8_1 = mp
L8_1 = L8_1.CLEAN
return L8_1
