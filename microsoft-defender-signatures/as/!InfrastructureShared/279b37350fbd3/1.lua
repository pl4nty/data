local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1, L45_1, L46_1, L47_1, L48_1, L49_1, L50_1, L51_1, L52_1
L2_1 = this_sigattrlog
L2_1 = L2_1[1]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.utf8p2
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L0_1 = L2_1.utf8p2
  end
end
L2_1 = #L0_1
if L2_1 < 62 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = contains
L3_1 = L0_1
L4_1 = "powershell.exe"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L2_1 = NormalizeCmdline
  L3_1 = "powershell"
  L4_1 = L0_1
  L2_1 = L2_1(L3_1, L4_1)
  L1_1 = L2_1
else
  L2_1 = NormalizeCmdline
  L3_1 = "cmd"
  L4_1 = L0_1
  L2_1 = L2_1(L3_1, L4_1)
  L1_1 = L2_1
end
L2_1 = isnull
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.gsub
L3_1 = L1_1
L4_1 = "[\"'()+]"
L5_1 = ""
L2_1 = L2_1(L3_1, L4_1, L5_1)
L1_1 = L2_1
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L1_1 = L2_1
L2_1 = {}
L3_1 = "new-object system.net.http.httpclient"
L4_1 = ".downloadstring"
L5_1 = ".downloadfile"
L6_1 = "[net.webclient]::downloadstring"
L7_1 = "curl"
L8_1 = "wget"
L9_1 = "invoke-restmethod"
L10_1 = "irm"
L11_1 = "invoke-webrequest"
L12_1 = "iwr"
L13_1 = "iex"
L14_1 = "invoke-expression"
L15_1 = "invoke-command"
L16_1 = "[scriptblock]::create"
L17_1 = "scriptblock::create"
L18_1 = "start-process"
L19_1 = "saps"
L20_1 = "cmd /c powershell"
L21_1 = "[text.encoding]::utf8.getstring"
L22_1 = "[system.text.encoding]::ascii.getstring"
L23_1 = "[system.convert]::frombase64string"
L24_1 = "-usebasicparsing"
L25_1 = "-useb "
L26_1 = "-uri"
L27_1 = "-response"
L28_1 = "-w"
L29_1 = "\226\128\149w"
L30_1 = "hidden"
L31_1 = "[char]"
L32_1 = "ping"
L33_1 = "whoami"
L34_1 = "ipconfig"
L35_1 = "arp"
L36_1 = "nbtstat"
L37_1 = "netstat"
L38_1 = "tasklist"
L39_1 = "taskkill"
L40_1 = "findstr"
L41_1 = "find"
L42_1 = "tracert"
L43_1 = "dsquery"
L44_1 = "dsget"
L45_1 = "driverquery"
L46_1 = "gpresult"
L47_1 = "logman"
L48_1 = "wevtutil"
L49_1 = "systeminfo"
L50_1 = "reg add"
L51_1 = "reg delete"
L52_1 = "reg query"
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
L2_1[33] = L35_1
L2_1[34] = L36_1
L2_1[35] = L37_1
L2_1[36] = L38_1
L2_1[37] = L39_1
L2_1[38] = L40_1
L2_1[39] = L41_1
L2_1[40] = L42_1
L2_1[41] = L43_1
L2_1[42] = L44_1
L2_1[43] = L45_1
L2_1[44] = L46_1
L2_1[45] = L47_1
L2_1[46] = L48_1
L2_1[47] = L49_1
L2_1[48] = L50_1
L2_1[49] = L51_1
L2_1[50] = L52_1
L3_1 = "mimikatz"
L4_1 = "downloadstring"
L5_1 = "reflective"
L6_1 = "shellcode"
L7_1 = "-windowstyle"
L2_1[51] = L3_1
L2_1[52] = L4_1
L2_1[53] = L5_1
L2_1[54] = L6_1
L2_1[55] = L7_1
L3_1 = contains
L4_1 = L1_1
L5_1 = L2_1
L3_1 = L3_1(L4_1, L5_1)
if not L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = bm
L3_1 = L3_1.add_related_string
L4_1 = "FileFix_cmdline"
L5_1 = L0_1
L6_1 = bm
L6_1 = L6_1.RelatedStringBMReport
L3_1(L4_1, L5_1, L6_1)
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
