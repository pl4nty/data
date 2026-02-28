local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1
L1_1 = 0
L2_1 = ""
L3_1 = this_sigattrlog
L3_1 = L3_1[1]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[1]
  L3_1 = L3_1.utf8p2
  if L3_1 then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[1]
    L0_1 = L3_1.utf8p2
    L2_1 = "mshta"
end
else
  L3_1 = this_sigattrlog
  L3_1 = L3_1[2]
  L3_1 = L3_1.matched
  if L3_1 then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[2]
    L3_1 = L3_1.utf8p2
    if L3_1 then
      L3_1 = this_sigattrlog
      L3_1 = L3_1[2]
      L0_1 = L3_1.utf8p2
      L2_1 = "powershell"
  end
  else
    L3_1 = this_sigattrlog
    L3_1 = L3_1[3]
    L3_1 = L3_1.matched
    if L3_1 then
      L3_1 = this_sigattrlog
      L3_1 = L3_1[3]
      L3_1 = L3_1.utf8p2
      if L3_1 then
        L3_1 = this_sigattrlog
        L3_1 = L3_1[3]
        L0_1 = L3_1.utf8p2
        L2_1 = "cmd"
      end
    end
  end
end
if not L0_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = {}
L4_1 = "irokast"
L5_1 = "cherryast"
L6_1 = ".ps1"
L7_1 = ".hta"
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L3_1[4] = L7_1
L4_1 = contains
L5_1 = L0_1
L6_1 = L3_1
L4_1 = L4_1(L5_1, L6_1)
if L4_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L5_1 = L0_1
L4_1 = L0_1.lower
L4_1 = L4_1(L5_1)
if L2_1 == "mshta" then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L5_1 = MpCommon
L5_1 = L5_1.StringRegExpSearch
L6_1 = "[^\\w\\d\\s]w[indowstyle]*\\s+(?:h[iden]*|1|m[inimized]*)\\s+"
L7_1 = L4_1
L5_1, L6_1 = L5_1(L6_1, L7_1)
if L5_1 then
  L1_1 = L1_1 + 5
end
L7_1 = isIEXfound
L8_1 = L4_1
L7_1 = L7_1(L8_1)
if L7_1 then
  L1_1 = L1_1 + 5
end
L8_1 = L4_1
L7_1 = L4_1.match
L9_1 = "^cmd[%w%.]*%s+/c"
L7_1 = L7_1(L8_1, L9_1)
if L7_1 then
  L1_1 = L1_1 + 5
end
L7_1 = {}
L8_1 = "(new-object system.net.http.httpclient).getasync"
L9_1 = "(new-object system.net.http.httpclient).getstringasync"
L10_1 = "(new-object system.net.webclient).downloadstring"
L11_1 = "(new-object system.net.webclient).downloadfile"
L12_1 = "(new-object net.webclient).downloadfile"
L13_1 = "(new-object net.webclient).downloadstring"
L14_1 = "[net.webclient]::downloadstring"
L15_1 = "curl"
L16_1 = "wget"
L17_1 = "invoke-restmethod"
L18_1 = "irm"
L19_1 = "invoke-webrequest"
L20_1 = "iwr"
L21_1 = "invoke-expression"
L22_1 = "iex"
L23_1 = "invoke-command"
L24_1 = "[scriptblock]::create"
L25_1 = "scriptblock::create"
L26_1 = "content).invoke()"
L27_1 = "invoke()"
L28_1 = "start-process"
L29_1 = "saps"
L30_1 = "cmd /c powershell"
L31_1 = "://"
L32_1 = "[char]105+[char]119+[char]114"
L33_1 = "([text.encoding]::utf8.getstring"
L34_1 = "([system.text.encoding]::ascii.getstring"
L35_1 = "[system.convert]::frombase64string"
L36_1 = "[system.text.encoding]::utf8.getstring([system.convert]::frombase64string"
L37_1 = "-usebasicparsing"
L38_1 = " -useb"
L39_1 = "-uri"
L40_1 = "-response"
L41_1 = "http"
L42_1 = "substring"
L43_1 = "downloadfile"
L44_1 = "downloadstring"
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
L7_1[32] = L39_1
L7_1[33] = L40_1
L7_1[34] = L41_1
L7_1[35] = L42_1
L7_1[36] = L43_1
L7_1[37] = L44_1
L8_1 = contains
L9_1 = L4_1
L10_1 = L7_1
L8_1 = L8_1(L9_1, L10_1)
if L8_1 then
  L1_1 = L1_1 + 5
end
L8_1 = {}
L8_1.powershell = 5
L8_1.mshta = 5
L8_1.wscript = 4
L8_1.cscript = 4
L8_1.certutil = 4
L8_1.rundll32 = 4
L8_1.regsvr32 = 4
L8_1.schtasks = 3
L8_1.wmic = 3
L8_1.bitsadmin = 3
L8_1.curl = 2
L8_1.wget = 2
L8_1.cmd = 2
L8_1.nslookup = 2
L8_1.findstr = 2
L9_1 = pairs
L10_1 = L8_1
L9_1, L10_1, L11_1 = L9_1(L10_1)
for L12_1, L13_1 in L9_1, L10_1, L11_1 do
  L15_1 = L4_1
  L14_1 = L4_1.find
  L16_1 = L12_1
  L17_1 = 1
  L18_1 = true
  L14_1 = L14_1(L15_1, L16_1, L17_1, L18_1)
  if L14_1 and (not L2_1 or L12_1 ~= L2_1) then
    L1_1 = L1_1 + L13_1
  end
end
L9_1 = select
L10_1 = 2
L12_1 = L4_1
L11_1 = L4_1.gsub
L13_1 = "%^"
L14_1 = ""
L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1 = L11_1(L12_1, L13_1, L14_1)
L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1)
if 5 < L9_1 then
  L1_1 = L1_1 + 3
end
L11_1 = L4_1
L10_1 = L4_1.match
L12_1 = "%%[%w_]+%%"
L10_1 = L10_1(L11_1, L12_1)
if L10_1 then
  L1_1 = L1_1 + 2
end
L11_1 = L4_1
L10_1 = L4_1.match
L12_1 = "%%[%w_]+:~%d+,%d+%%"
L10_1 = L10_1(L11_1, L12_1)
if L10_1 then
  L1_1 = L1_1 + 4
end
L11_1 = L4_1
L10_1 = L4_1.lower
L10_1 = L10_1(L11_1)
L11_1 = L10_1
L10_1 = L10_1.match
L12_1 = "%f[%w]call%f[%W]"
L10_1 = L10_1(L11_1, L12_1)
if L10_1 then
  L1_1 = L1_1 + 3
end
L11_1 = L4_1
L10_1 = L4_1.lower
L10_1 = L10_1(L11_1)
L11_1 = L10_1
L10_1 = L10_1.match
L12_1 = "for%s+/f"
L10_1 = L10_1(L11_1, L12_1)
if L10_1 then
  L1_1 = L1_1 + 4
end
L10_1 = select
L11_1 = 2
L13_1 = L4_1
L12_1 = L4_1.gsub
L14_1 = "\""
L15_1 = ""
L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1 = L12_1(L13_1, L14_1, L15_1)
L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1)
if 6 < L10_1 then
  L1_1 = L1_1 + 2
end
L12_1 = L4_1
L11_1 = L4_1.lower
L11_1 = L11_1(L12_1)
L12_1 = L11_1
L11_1 = L11_1.match
L13_1 = "|%s*cmd"
L11_1 = L11_1(L12_1, L13_1)
if L11_1 then
  L1_1 = L1_1 + 5
end
L12_1 = L4_1
L11_1 = L4_1.match
L13_1 = "(%w%^)%%*%w"
L11_1 = L11_1(L12_1, L13_1)
if not L11_1 then
  L12_1 = L4_1
  L11_1 = L4_1.match
  L13_1 = "\"%w\"%s*\""
  L11_1 = L11_1(L12_1, L13_1)
  if not L11_1 then
    goto lbl_241
  end
end
L1_1 = L1_1 + 4
::lbl_241::
if 10 <= L1_1 and L1_1 < 15 then
  L11_1 = bm
  L11_1 = L11_1.trigger_sig
  L12_1 = "SuspClickFix_SA"
  L13_1 = string
  L13_1 = L13_1.format
  L14_1 = "score=%s;cmdline=%s"
  L15_1 = tostring
  L16_1 = L1_1
  L15_1 = L15_1(L16_1)
  L16_1 = tostring
  L17_1 = L0_1
  L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1 = L16_1(L17_1)
  L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1 = L13_1(L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1)
  L11_1(L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1)
end
if 15 <= L1_1 then
  L11_1 = bm
  L11_1 = L11_1.add_related_string
  L12_1 = "SuspClickFix_SA"
  L13_1 = tostring
  L14_1 = L0_1
  L13_1 = L13_1(L14_1)
  L14_1 = bm
  L14_1 = L14_1.RelatedStringBMReport
  L11_1(L12_1, L13_1, L14_1)
  L11_1 = bm
  L11_1 = L11_1.add_related_string
  L12_1 = "SuspClickFix_SA_score"
  L13_1 = tostring
  L14_1 = L1_1
  L13_1 = L13_1(L14_1)
  L14_1 = bm
  L14_1 = L14_1.RelatedStringBMReport
  L11_1(L12_1, L13_1, L14_1)
  L11_1 = mp
  L11_1 = L11_1.INFECTED
  return L11_1
end
L11_1 = mp
L11_1 = L11_1.CLEAN
return L11_1
