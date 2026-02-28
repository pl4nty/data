local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1
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
if not L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = contains
L4_1 = L2_1
L5_1 = {}
L6_1 = "explorer.exe"
L5_1[1] = L6_1
L3_1 = L3_1(L4_1, L5_1)
if not L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.GetScannedPPID
L3_1 = L3_1()
if L3_1 == "" or L3_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.GetProcessCommandLine
L5_1 = L3_1
L4_1 = L4_1(L5_1)
if not L4_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = string
L5_1 = L5_1.lower
L6_1 = L4_1
L5_1 = L5_1(L6_1)
L4_1 = L5_1
L5_1 = #L4_1
if L5_1 < 50 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = {}
L6_1 = " rem "
L7_1 = "#"
L8_1 = "$$ "
L9_1 = "verif"
L10_1 = "confirm"
L11_1 = "identity"
L12_1 = "verification"
L13_1 = "not a robot"
L14_1 = "\209\129\208\176\209\128tcha"
L15_1 = "human"
L16_1 = "authorized"
L17_1 = " ray"
L18_1 = " recaptcha"
L19_1 = " re captcha"
L20_1 = " rcaptcha"
L21_1 = "press enter"
L22_1 = " clip free"
L23_1 = " over free"
L24_1 = "robot: r"
L25_1 = "robot - r"
L26_1 = "robot - cloudflare"
L27_1 = "robot: cloudflare"
L28_1 = "robot: captcha"
L29_1 = "robot - captcha"
L30_1 = "human - r"
L31_1 = "human: r"
L32_1 = "human: captcha"
L33_1 = "human - captcha"
L34_1 = "microsoft windows: fix internet dns service reconnect"
L35_1 = "restart dns service in the microsoft windows system"
L36_1 = "id:"
L37_1 = "gatesig:"
L38_1 = "defender services secure access key"
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
L6_1 = contains
L7_1 = L4_1
L8_1 = L5_1
L6_1 = L6_1(L7_1, L8_1)
if L6_1 then
  L6_1 = mp
  L6_1 = L6_1.INFECTED
  return L6_1
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
