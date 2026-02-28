local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1
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
  L2_1 = L2_1.gsub
  L3_1 = L1_1
  L4_1 = "'+'"
  L5_1 = ""
  L2_1 = L2_1(L3_1, L4_1, L5_1)
  L1_1 = L2_1
  L2_1 = string
  L2_1 = L2_1.gsub
  L3_1 = L1_1
  L4_1 = "\"+\""
  L5_1 = ""
  L2_1 = L2_1(L3_1, L4_1, L5_1)
  L1_1 = L2_1
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  L3_1 = 0
  L4_1 = str_count_match
  L5_1 = L2_1
  L6_1 = {}
  L7_1 = " %-wi?n?d?o?w?s?t?y?l?e?%s+1%s"
  L8_1 = " %-wi?n?d?o?w?s?t?y?l?e?%s+hi?d?d?e?n?%s"
  L9_1 = "irm http"
  L10_1 = "iwr http"
  L11_1 = "iex %$"
  L12_1 = "iex%s?%("
  L13_1 = "|%s?iex"
  L14_1 = "invoke-expression"
  L15_1 = "curl"
  L16_1 = " //e:jscript"
  L17_1 = "%.vbs"
  L18_1 = "%)%.downloadstring%("
  L19_1 = "::frombase64string%(%$"
  L20_1 = "net%.sockets%.tcpclient%("
  L21_1 = "installproduct('https://"
  L22_1 = "installproduct(\"https://"
  L6_1[1] = L7_1
  L6_1[2] = L8_1
  L6_1[3] = L9_1
  L6_1[4] = L10_1
  L6_1[5] = L11_1
  L6_1[6] = L12_1
  L6_1[7] = L13_1
  L6_1[8] = L14_1
  L6_1[9] = L15_1
  L6_1[10] = L16_1
  L6_1[11] = L17_1
  L6_1[12] = L18_1
  L6_1[13] = L19_1
  L6_1[14] = L20_1
  L6_1[15] = L21_1
  L6_1[16] = L22_1
  L4_1 = L4_1(L5_1, L6_1)
  L3_1 = L4_1
  L4_1 = str_count_match
  L5_1 = L2_1
  L6_1 = {}
  L7_1 = " \226[\128-\191][\128-\191] "
  L8_1 = " \240[\128-\191][\128-\191][\128-\191] "
  L6_1[1] = L7_1
  L6_1[2] = L8_1
  L4_1 = L4_1(L5_1, L6_1)
  L3_1 = L3_1 + L4_1
  if 2 <= L3_1 then
    L4_1 = mp
    L4_1 = L4_1.INFECTED
    return L4_1
  end
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L1_1
  L6_1 = " [%-/][eE][ncodemaNCODEMA]*%s+"
  L4_1 = L4_1(L5_1, L6_1)
  if L4_1 then
    L4_1 = NormalizeCmdline
    L5_1 = "powershell"
    L6_1 = L1_1
    L4_1 = L4_1(L5_1, L6_1)
    if L4_1 == nil then
      L5_1 = mp
      L5_1 = L5_1.CLEAN
      return L5_1
    end
    L5_1 = string
    L5_1 = L5_1.lower
    L6_1 = L4_1
    L5_1 = L5_1(L6_1)
    L4_1 = L5_1
    L3_1 = 0
    L5_1 = str_count_match
    L6_1 = L4_1
    L7_1 = {}
    L8_1 = "iwr "
    L9_1 = "irm "
    L10_1 = "%.downloadstring"
    L11_1 = "wget"
    L12_1 = "iex"
    L13_1 = "& %.\\"
    L7_1[1] = L8_1
    L7_1[2] = L9_1
    L7_1[3] = L10_1
    L7_1[4] = L11_1
    L7_1[5] = L12_1
    L7_1[6] = L13_1
    L5_1 = L5_1(L6_1, L7_1)
    L3_1 = L5_1
    if 2 <= L3_1 then
      L5_1 = mp
      L5_1 = L5_1.INFECTED
      return L5_1
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
