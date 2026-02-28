local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = L0_1.command_line
if L1_1 then
  L2_1 = string
  L2_1 = L2_1.gsub
  L3_1 = L1_1
  L4_1 = "\""
  L5_1 = ""
  L2_1 = L2_1(L3_1, L4_1, L5_1)
  L1_1 = L2_1
  L2_1 = string
  L2_1 = L2_1.gsub
  L3_1 = L1_1
  L4_1 = "'"
  L5_1 = ""
  L2_1 = L2_1(L3_1, L4_1, L5_1)
  L1_1 = L2_1
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  L3_1 = 0
  L4_1 = false
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L1_1
  L7_1 = " [%-/][eE][ncodemaNCODEMA]*%s+"
  L5_1 = L5_1(L6_1, L7_1)
  if L5_1 then
    L5_1 = NormalizeCmdline
    L6_1 = "powershell"
    L7_1 = L1_1
    L5_1 = L5_1(L6_1, L7_1)
    if L5_1 == nil then
      L6_1 = mp
      L6_1 = L6_1.CLEAN
      return L6_1
    end
    L6_1 = string
    L6_1 = L6_1.lower
    L7_1 = L5_1
    L6_1 = L6_1(L7_1)
    L2_1 = L6_1
    L3_1 = L3_1 + 1
    L6_1 = str_count_match
    L7_1 = L2_1
    L8_1 = {}
    L9_1 = "http"
    L8_1[1] = L9_1
    L6_1 = L6_1(L7_1, L8_1)
    L3_1 = L3_1 + L6_1
    L4_1 = true
  end
  L5_1 = isIEXfound
  L6_1 = L2_1
  L5_1 = L5_1(L6_1)
  if L5_1 then
    L3_1 = L3_1 + 1
  end
  L5_1 = str_count_match
  L6_1 = L2_1
  L7_1 = {}
  L8_1 = " %-wi?n?d?o?w?s?t?y?l?e?%s+1%s"
  L9_1 = " %-wi?n?d?o?w?s?t?y?l?e?%s+hi?d?d?e?n?%s"
  L10_1 = "mshta.+http"
  L11_1 = "irm "
  L12_1 = "iwr "
  L13_1 = " //e:jscript"
  L14_1 = "%.vbs"
  L15_1 = "%)%.downloadstring%("
  L16_1 = "::frombase64string%(%$"
  L17_1 = "net%.sockets%.tcpclient%("
  L18_1 = "invoke%-webrequest"
  L19_1 = "invoke%-restmethod"
  L20_1 = ".invoke%(%)"
  L21_1 = "%[system%.text%.encoding%]::utf8"
  L22_1 = "msxml2.xmlhttp"
  L23_1 = "saps%s+"
  L24_1 = "start%-process"
  L25_1 = "start%s+"
  L26_1 = "%-useb"
  L27_1 = "%-usebasicparsing"
  L28_1 = "wscript"
  L29_1 = "cscript"
  L30_1 = "%.shell"
  L31_1 = "%.vbs"
  L32_1 = "wget"
  L33_1 = "curl"
  L34_1 = "conhost.+%-%-headless"
  L35_1 = "net%.webclient"
  L36_1 = "%.content"
  L37_1 = "start%-sleep"
  L38_1 = "%$env:"
  L7_1[1] = L8_1
  L7_1[2] = L9_1
  L7_1[3] = L10_1
  L7_1[4] = L11_1
  L7_1[5] = L12_1
  L7_1[6] = L13_1
  L7_1[7] = L14_1
  L7_1[8] = L15_1
  L7_1[9] = L16_1
  L7_1[10] = L17_1
  L7_1[11] = L18_1
  L7_1[12] = L19_1
  L7_1[13] = L20_1
  L7_1[14] = L21_1
  L7_1[15] = L22_1
  L7_1[16] = L23_1
  L7_1[17] = L24_1
  L7_1[18] = L25_1
  L7_1[19] = L26_1
  L7_1[20] = L27_1
  L7_1[21] = L28_1
  L7_1[22] = L29_1
  L7_1[23] = L30_1
  L7_1[24] = L31_1
  L7_1[25] = L32_1
  L7_1[26] = L33_1
  L7_1[27] = L34_1
  L7_1[28] = L35_1
  L7_1[29] = L36_1
  L7_1[30] = L37_1
  L7_1[31] = L38_1
  L5_1 = L5_1(L6_1, L7_1)
  L3_1 = L3_1 + L5_1
  L5_1 = str_count_match
  L6_1 = L2_1
  L7_1 = {}
  L8_1 = " \226[\128-\191][\128-\191] "
  L9_1 = " \240[\128-\191][\128-\191][\128-\191] "
  L7_1[1] = L8_1
  L7_1[2] = L9_1
  L5_1 = L5_1(L6_1, L7_1)
  L3_1 = L3_1 + L5_1
  if L4_1 == true and 3 <= L3_1 then
    L5_1 = mp
    L5_1 = L5_1.INFECTED
    return L5_1
  elseif L4_1 == false and 2 <= L3_1 then
    L5_1 = mp
    L5_1 = L5_1.INFECTED
    return L5_1
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
