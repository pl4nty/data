local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1
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
if not L3_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = string
L4_1 = L4_1.lower
L5_1 = L3_1
L4_1 = L4_1(L5_1)
L3_1 = L4_1
L4_1 = #L3_1
if L4_1 < 50 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = #L3_1
if 400 < L4_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = {}
L5_1 = "iex"
L6_1 = "'i','e','x'"
L7_1 = "iplogger.co"
L8_1 = "iwr"
L9_1 = "irm"
L10_1 = "curl"
L11_1 = "e:jscript"
L12_1 = "invoke-restmethod"
L13_1 = "invoke-webrequest"
L14_1 = "invoke-expression"
L15_1 = "start-process"
L16_1 = "invoke-wmimethod"
L17_1 = " veri"
L18_1 = " ray"
L19_1 = "ref:"
L20_1 = " recaptcha"
L21_1 = " re captcha"
L22_1 = " rcaptcha"
L23_1 = "press enter"
L24_1 = " clip free"
L25_1 = " over free"
L26_1 = "robot: r"
L27_1 = "robot - r"
L28_1 = "robot - cloudflare"
L29_1 = "robot: cloudflare"
L30_1 = "robot: captcha"
L31_1 = "robot - captcha"
L32_1 = "human - r"
L33_1 = "human: r"
L34_1 = "human: captcha"
L35_1 = "human - captcha"
L36_1 = "microsoft windows: fix internet dns service reconnect"
L37_1 = "restart dns service in the microsoft windows system"
L38_1 = "defender services secure access key"
L39_1 = "service connection checkup"
L40_1 = " id: "
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
L4_1[24] = L28_1
L4_1[25] = L29_1
L4_1[26] = L30_1
L4_1[27] = L31_1
L4_1[28] = L32_1
L4_1[29] = L33_1
L4_1[30] = L34_1
L4_1[31] = L35_1
L4_1[32] = L36_1
L4_1[33] = L37_1
L4_1[34] = L38_1
L4_1[35] = L39_1
L4_1[36] = L40_1
L5_1 = str_count_match
L6_1 = L3_1
L7_1 = L4_1
L5_1 = L5_1(L6_1, L7_1)
if 2 <= L5_1 then
  L5_1 = MpCommon
  L5_1 = L5_1.StringRegExpSearch
  L6_1 = "(?i)[^\\w\\d\\s]w[indowstyle]*\\s+(?:h[iden]*|1|m[inimized]*)\\s+"
  L7_1 = L3_1
  L5_1, L6_1 = L5_1(L6_1, L7_1)
  if L5_1 then
    L7_1 = mp
    L7_1 = L7_1.INFECTED
    return L7_1
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
