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
L4_1 = MpCommon
L4_1 = L4_1.StringRegExpSearch
L5_1 = "(?i)[^\\w\\d\\s]w[indowstyle]*\\s+(?:h[iden]*|1|m[inimized]*)\\s+"
L6_1 = L3_1
L4_1, L5_1 = L4_1(L5_1, L6_1)
if not L4_1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = false
L7_1 = 0
L8_1 = ""
L9_1 = string
L9_1 = L9_1.find
L10_1 = L3_1
L11_1 = " %-[eE][ncodemaNCODEMA]*%s+"
L9_1 = L9_1(L10_1, L11_1)
if L9_1 then
  L9_1 = NormalizeCmdline
  L10_1 = "powershell"
  L11_1 = L3_1
  L9_1 = L9_1(L10_1, L11_1)
  if L9_1 == nil then
    L10_1 = mp
    L10_1 = L10_1.CLEAN
    return L10_1
  end
  L10_1 = string
  L10_1 = L10_1.lower
  L11_1 = L9_1
  L10_1 = L10_1(L11_1)
  L8_1 = L10_1
  L7_1 = L7_1 + 1
  L10_1 = str_count_match
  L11_1 = L8_1
  L12_1 = {}
  L13_1 = "http"
  L12_1[1] = L13_1
  L10_1 = L10_1(L11_1, L12_1)
  L7_1 = L7_1 + L10_1
  L6_1 = true
end
L9_1 = isIEXfound
L10_1 = L8_1
L9_1 = L9_1(L10_1)
if L9_1 then
  L7_1 = L7_1 + 1
end
L9_1 = str_count_match
L10_1 = L8_1
L11_1 = {}
L12_1 = "mshta.+http"
L13_1 = "irm "
L14_1 = "iwr "
L15_1 = " //e:jscript"
L16_1 = "%.vbs"
L17_1 = "%)%.downloadstring%("
L18_1 = "::frombase64string%(%$"
L19_1 = "net%.sockets%.tcpclient%("
L20_1 = "invoke%-webrequest"
L21_1 = "invoke%-restmethod"
L22_1 = ".invoke%(%)"
L23_1 = "%[system%.text%.encoding%]::utf8"
L24_1 = "msxml2.xmlhttp"
L25_1 = "saps%s+"
L26_1 = "start%-process"
L27_1 = "start%s+"
L28_1 = "%-useb"
L29_1 = "%-usebasicparsing"
L30_1 = "wscript"
L31_1 = "cscript"
L32_1 = "%.shell"
L33_1 = "%.vbs"
L34_1 = "wget"
L35_1 = "curl"
L36_1 = "conhost.+%-%-headless"
L37_1 = "net%.webclient"
L38_1 = "%$env:"
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
L9_1 = L9_1(L10_1, L11_1)
L7_1 = L7_1 + L9_1
L9_1 = str_count_match
L10_1 = L8_1
L11_1 = {}
L12_1 = " \226[\128-\191][\128-\191] "
L13_1 = " \240[\128-\191][\128-\191][\128-\191] "
L11_1[1] = L12_1
L11_1[2] = L13_1
L9_1 = L9_1(L10_1, L11_1)
L7_1 = L7_1 + L9_1
if L6_1 == true and 3 <= L7_1 then
  L9_1 = mp
  L9_1 = L9_1.INFECTED
  return L9_1
elseif L6_1 == false and 2 <= L7_1 then
  L9_1 = mp
  L9_1 = L9_1.INFECTED
  return L9_1
end
L9_1 = mp
L9_1 = L9_1.CLEAN
return L9_1
