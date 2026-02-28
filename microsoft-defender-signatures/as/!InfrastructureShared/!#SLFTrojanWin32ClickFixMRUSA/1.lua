local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1, L45_1, L46_1, L47_1, L48_1, L49_1, L50_1, L51_1, L52_1, L53_1, L54_1, L55_1, L56_1, L57_1, L58_1, L59_1, L60_1
L0_1 = false
L1_1 = false
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_PROCESS_PPID
L2_1 = L2_1(L3_1)
if not L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.get_contextdata
L4_1 = mp
L4_1 = L4_1.CONTEXT_DATA_PROCESSNAME
L3_1 = L3_1(L4_1)
L4_1 = mp
L4_1 = L4_1.get_contextdata
L5_1 = mp
L5_1 = L5_1.CONTEXT_DATA_PROCESSDEVICEPATH
L4_1 = L4_1(L5_1)
if not L3_1 or not L4_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = MpCommon
L5_1 = L5_1.PathToWin32Path
L6_1 = L4_1
L5_1 = L5_1(L6_1)
L6_1 = L5_1
L7_1 = "\\"
L8_1 = L3_1
L6_1 = L6_1 .. L7_1 .. L8_1
L7_1 = string
L7_1 = L7_1.lower
L8_1 = L6_1
L7_1 = L7_1(L8_1)
L6_1 = L7_1
L7_1 = mp
L7_1 = L7_1.GetProcessCommandLine
L8_1 = L2_1
L7_1 = L7_1(L8_1)
if not L7_1 then
  L7_1 = ""
end
L8_1 = #L7_1
if L8_1 < 70 then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L8_1 = string
L8_1 = L8_1.find
L9_1 = L6_1
L10_1 = "powershell"
L11_1 = 1
L12_1 = true
L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
if L8_1 then
  L0_1 = true
end
L8_1 = string
L8_1 = L8_1.find
L9_1 = L6_1
L10_1 = "mshta"
L11_1 = 1
L12_1 = true
L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
if L8_1 then
  L0_1 = true
end
if not L0_1 then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L8_1 = NormalizeCmdline
L9_1 = "powershell"
L10_1 = L7_1
L8_1 = L8_1(L9_1, L10_1)
L1_1 = L8_1
L8_1 = MpCommon
L8_1 = L8_1.StringRegExpSearch
L9_1 = "(https?:\\/\\/[^\\s\\x22\\x27]+)"
L10_1 = L1_1
L8_1, L9_1 = L8_1(L9_1, L10_1)
if not L8_1 then
  L10_1 = mp
  L10_1 = L10_1.CLEAN
  return L10_1
end
if not L9_1 then
  L10_1 = mp
  L10_1 = L10_1.CLEAN
  return L10_1
end
L10_1 = {}
L11_1 = ".activitydmy/"
L12_1 = ".bet/"
L13_1 = ".biz/"
L14_1 = ".blog/"
L15_1 = ".bond/"
L16_1 = ".buzz/"
L17_1 = ".cam/"
L18_1 = ".cda/"
L19_1 = ".click/"
L20_1 = ".club/"
L21_1 = ".country/"
L22_1 = ".culture/"
L23_1 = ".cyou/"
L24_1 = ".dat/"
L25_1 = ".digital/"
L26_1 = ".download/"
L27_1 = ".employerdbz/"
L28_1 = ".eps/"
L29_1 = ".forest/"
L30_1 = ".flv/"
L31_1 = ".fun/"
L32_1 = ".gdn/"
L33_1 = ".hair/"
L34_1 = ".help/"
L35_1 = ".icu/"
L36_1 = ".info/"
L37_1 = ".lat/"
L38_1 = ".life/"
L39_1 = ".link/"
L40_1 = ".loan/"
L41_1 = ".live/"
L42_1 = ".m4a/"
L43_1 = ".mdb/"
L44_1 = ".me/"
L45_1 = ".mp3/"
L46_1 = ".mp4/"
L47_1 = ".my/"
L48_1 = ".online/"
L49_1 = ".party/"
L50_1 = ".pro/"
L51_1 = ".press/"
L52_1 = ".pw/"
L53_1 = ".racing/"
L54_1 = ".ren/"
L55_1 = ".reise/"
L56_1 = ".review/"
L57_1 = ".run/"
L58_1 = ".sbs/"
L59_1 = ".science/"
L60_1 = ".shop/"
L10_1[1] = L11_1
L10_1[2] = L12_1
L10_1[3] = L13_1
L10_1[4] = L14_1
L10_1[5] = L15_1
L10_1[6] = L16_1
L10_1[7] = L17_1
L10_1[8] = L18_1
L10_1[9] = L19_1
L10_1[10] = L20_1
L10_1[11] = L21_1
L10_1[12] = L22_1
L10_1[13] = L23_1
L10_1[14] = L24_1
L10_1[15] = L25_1
L10_1[16] = L26_1
L10_1[17] = L27_1
L10_1[18] = L28_1
L10_1[19] = L29_1
L10_1[20] = L30_1
L10_1[21] = L31_1
L10_1[22] = L32_1
L10_1[23] = L33_1
L10_1[24] = L34_1
L10_1[25] = L35_1
L10_1[26] = L36_1
L10_1[27] = L37_1
L10_1[28] = L38_1
L10_1[29] = L39_1
L10_1[30] = L40_1
L10_1[31] = L41_1
L10_1[32] = L42_1
L10_1[33] = L43_1
L10_1[34] = L44_1
L10_1[35] = L45_1
L10_1[36] = L46_1
L10_1[37] = L47_1
L10_1[38] = L48_1
L10_1[39] = L49_1
L10_1[40] = L50_1
L10_1[41] = L51_1
L10_1[42] = L52_1
L10_1[43] = L53_1
L10_1[44] = L54_1
L10_1[45] = L55_1
L10_1[46] = L56_1
L10_1[47] = L57_1
L10_1[48] = L58_1
L10_1[49] = L59_1
L10_1[50] = L60_1
L11_1 = ".site/"
L12_1 = ".space/"
L13_1 = ".store/"
L14_1 = ".stream/"
L15_1 = ".study/"
L16_1 = ".tech/"
L17_1 = ".technology/"
L18_1 = ".terrifyenyb/"
L19_1 = ".today/"
L20_1 = ".top/"
L21_1 = ".vip/"
L22_1 = ".work/"
L23_1 = ".world/"
L24_1 = ".xll/"
L25_1 = ".xyz/"
L26_1 = ".yokohama/"
L10_1[51] = L11_1
L10_1[52] = L12_1
L10_1[53] = L13_1
L10_1[54] = L14_1
L10_1[55] = L15_1
L10_1[56] = L16_1
L10_1[57] = L17_1
L10_1[58] = L18_1
L10_1[59] = L19_1
L10_1[60] = L20_1
L10_1[61] = L21_1
L10_1[62] = L22_1
L10_1[63] = L23_1
L10_1[64] = L24_1
L10_1[65] = L25_1
L10_1[66] = L26_1
L11_1 = {}
L12_1 = "iex"
L13_1 = "iwr"
L14_1 = "http"
L15_1 = "irm"
L16_1 = "curl"
L17_1 = "invoke-restmethod"
L18_1 = "invoke-webrequest"
L19_1 = "invoke-expression"
L20_1 = "start-process"
L21_1 = "verif"
L22_1 = " ray"
L23_1 = " recaptcha"
L24_1 = " re captcha"
L25_1 = " rcaptcha"
L26_1 = "press enter"
L27_1 = " clip free"
L28_1 = " over free"
L29_1 = "robot: r"
L30_1 = "robot - r"
L31_1 = "robot - cloudflare"
L32_1 = "robot: cloudflare"
L33_1 = "robot: captcha"
L34_1 = "robot - captcha"
L35_1 = "human - r"
L36_1 = "human: r"
L37_1 = "human: captcha"
L38_1 = "human - captcha"
L39_1 = "microsoft windows: fix internet dns service reconnect"
L40_1 = "restart dns service in the microsoft windows system"
L41_1 = "# "
L11_1[1] = L12_1
L11_1[2] = L13_1
L11_1[3] = L14_1
L11_1[4] = L15_1
L11_1[5] = L16_1
L11_1[6] = L17_1
L11_1[7] = L18_1
L11_1[8] = L19_1
L11_1[9] = L20_1
L11_1[10] = L21_1
L11_1[11] = L22_1
L11_1[12] = L23_1
L11_1[13] = L24_1
L11_1[14] = L25_1
L11_1[15] = L26_1
L11_1[16] = L27_1
L11_1[17] = L28_1
L11_1[18] = L29_1
L11_1[19] = L30_1
L11_1[20] = L31_1
L11_1[21] = L32_1
L11_1[22] = L33_1
L11_1[23] = L34_1
L11_1[24] = L35_1
L11_1[25] = L36_1
L11_1[26] = L37_1
L11_1[27] = L38_1
L11_1[28] = L39_1
L11_1[29] = L40_1
L11_1[30] = L41_1
L12_1 = MpCommon
L12_1 = L12_1.StringRegExpSearch
L13_1 = "-w[indowstyle]*\\s+(?:h[iden]*|1)\\s+"
L14_1 = L1_1
L12_1, L13_1 = L12_1(L13_1, L14_1)
L14_1 = contains
L15_1 = L9_1
L16_1 = L10_1
L14_1 = L14_1(L15_1, L16_1)
if L14_1 then
  L14_1 = contains
  L15_1 = L1_1
  L16_1 = L11_1
  L14_1 = L14_1(L15_1, L16_1)
  if L14_1 or L12_1 then
    L14_1 = set_research_data
    L15_1 = "ClickFixMRU.SA"
    L16_1 = tostring
    L17_1 = L1_1
    L16_1 = L16_1(L17_1)
    L17_1 = false
    L14_1(L15_1, L16_1, L17_1)
    L14_1 = mp
    L14_1 = L14_1.INFECTED
    return L14_1
  end
end
L14_1 = mp
L14_1 = L14_1.CLEAN
return L14_1
