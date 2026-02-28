local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_AMSI
if L0_1 ~= L1_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_AMSI_OPERATION_PPID
L0_1 = L0_1(L1_1)
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.GetParentProcInfo
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1.image_path
L2_1 = L2_1(L3_1)
L3_1 = string
L3_1 = L3_1.find
L4_1 = L2_1
L5_1 = "explorer.exe"
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if not L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.GetProcessCommandLine
L4_1 = L0_1
L3_1 = L3_1(L4_1)
L4_1 = #L3_1
if L4_1 < 70 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = contains
L5_1 = L3_1
L6_1 = {}
L7_1 = ".ps1"
L8_1 = ".hta"
L6_1[1] = L7_1
L6_1[2] = L8_1
L4_1 = L4_1(L5_1, L6_1)
if L4_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = false
L5_1 = 0
L6_1 = ""
L7_1 = false
L8_1 = string
L8_1 = L8_1.find
L9_1 = L3_1
L10_1 = " %-[eE][ncodemaNCODEMA]*%s+"
L8_1 = L8_1(L9_1, L10_1)
if L8_1 then
  L8_1 = NormalizeCmdline
  L9_1 = "powershell"
  L10_1 = L3_1
  L8_1 = L8_1(L9_1, L10_1)
  if L8_1 == nil then
    L9_1 = mp
    L9_1 = L9_1.CLEAN
    return L9_1
  end
  L9_1 = string
  L9_1 = L9_1.lower
  L10_1 = L8_1
  L9_1 = L9_1(L10_1)
  L6_1 = L9_1
  L5_1 = L5_1 + 1
  L9_1 = str_count_match
  L10_1 = L6_1
  L11_1 = {}
  L12_1 = "http"
  L11_1[1] = L12_1
  L9_1 = L9_1(L10_1, L11_1)
  L5_1 = L5_1 + L9_1
  L4_1 = true
end
L8_1 = isIEXfound
L9_1 = L6_1
L8_1 = L8_1(L9_1)
if L8_1 then
  L5_1 = L5_1 + 1
end
L8_1 = str_count_match
L9_1 = L6_1
L10_1 = {}
L11_1 = "mshta.+http"
L12_1 = "irm "
L13_1 = "iwr "
L14_1 = " //e:jscript"
L15_1 = "%.vbs"
L16_1 = "%)%.downloadstring%("
L17_1 = "::frombase64string%(%$"
L18_1 = "net%.sockets%.tcpclient%("
L19_1 = "invoke%-webrequest"
L20_1 = "invoke%-restmethod"
L21_1 = ".invoke%(%)"
L22_1 = "%[system%.text%.encoding%]::utf8"
L23_1 = "msxml2.xmlhttp"
L24_1 = "saps%s+"
L25_1 = "start%-process"
L26_1 = "start%s+"
L27_1 = "%-useb"
L28_1 = "%-usebasicparsing"
L29_1 = "wscript"
L30_1 = "cscript"
L31_1 = "%.shell"
L32_1 = "%.vbs"
L33_1 = "wget"
L34_1 = "curl"
L35_1 = "conhost.+%-%-headless"
L36_1 = "net%.webclient"
L37_1 = "%.content"
L38_1 = "start%-sleep"
L39_1 = "%$env:"
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
L8_1 = L8_1(L9_1, L10_1)
L5_1 = L5_1 + L8_1
L8_1 = str_count_match
L9_1 = L6_1
L10_1 = {}
L11_1 = " \226[\128-\191][\128-\191] "
L12_1 = " \240[\128-\191][\128-\191][\128-\191] "
L10_1[1] = L11_1
L10_1[2] = L12_1
L8_1 = L8_1(L9_1, L10_1)
L5_1 = L5_1 + L8_1
if L4_1 == true and 3 <= L5_1 then
  L7_1 = true
end
if L4_1 == false and 2 <= L5_1 then
  L7_1 = true
end
L8_1 = CommandLineGrader
L9_1 = L3_1
L10_1 = true
L11_1 = 2
L8_1, L9_1 = L8_1(L9_1, L10_1, L11_1)
if L9_1 and 10 < L8_1 then
  L7_1 = true
end
if L7_1 then
  L10_1 = MpCommon
  L10_1 = L10_1.BmTriggerSig
  L11_1 = L0_1
  L12_1 = "LUA:PShellClickFix.SAS"
  L13_1 = safeJsonSerialize
  L14_1 = L9_1
  L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1 = L13_1(L14_1)
  L10_1(L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1)
  L10_1 = mp
  L10_1 = L10_1.INFECTED
  return L10_1
end
L10_1 = mp
L10_1 = L10_1.CLEAN
return L10_1
