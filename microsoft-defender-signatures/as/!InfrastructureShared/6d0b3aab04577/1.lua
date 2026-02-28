local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1, L45_1, L46_1, L47_1, L48_1, L49_1, L50_1, L51_1, L52_1, L53_1, L54_1, L55_1, L56_1, L57_1, L58_1
L0_1 = 0
L1_1 = 0
L2_1 = nil
L3_1 = nil
L4_1 = false
L5_1 = nil
L6_1 = false
L7_1 = nil
L8_1 = {}
L9_1 = "bitsadmin"
L10_1 = "certutil"
L11_1 = "msiexec"
L12_1 = "scriptrunner"
L13_1 = "wmic"
L14_1 = "cscript"
L15_1 = "powershell"
L16_1 = "curl"
L17_1 = "conhost"
L18_1 = "mshta"
L8_1[1] = L9_1
L8_1[2] = L10_1
L8_1[3] = L11_1
L8_1[4] = L12_1
L8_1[5] = L13_1
L8_1[6] = L14_1
L8_1[7] = L15_1
L8_1[8] = L16_1
L8_1[9] = L17_1
L8_1[10] = L18_1
L9_1 = {}
L10_1 = ".ps1"
L11_1 = ".hta"
L12_1 = ".msi"
L9_1[1] = L10_1
L9_1[2] = L11_1
L9_1[3] = L12_1
L10_1 = this_sigattrlog
L10_1 = L10_1[2]
L10_1 = L10_1.matched
if L10_1 then
  L10_1 = this_sigattrlog
  L10_1 = L10_1[2]
  L10_1 = L10_1.utf8p2
  if L10_1 ~= nil then
    L10_1 = this_sigattrlog
    L10_1 = L10_1[2]
    L1_1 = L10_1.timestamp
  end
end
L10_1 = 1
L11_1 = mp
L11_1 = L11_1.SIGATTR_LOG_SZ
L12_1 = 1
for L13_1 = L10_1, L11_1, L12_1 do
  L14_1 = sigattr_head
  L14_1 = L14_1[L13_1]
  L14_1 = L14_1.matched
  if L14_1 then
    L14_1 = sigattr_head
    L14_1 = L14_1[L13_1]
    L14_1 = L14_1.attribute
    if L14_1 == 16400 then
      L14_1 = sigattr_head
      L14_1 = L14_1[L13_1]
      L14_1 = L14_1.utf8p2
      if L14_1 then
        L14_1 = sigattr_head
        L14_1 = L14_1[L13_1]
        L2_1 = L14_1.utf8p2
        L14_1 = sigattr_head
        L14_1 = L14_1[L13_1]
        L3_1 = L14_1.utf8p1
        L14_1 = pcall
        L15_1 = MpCommon
        L15_1 = L15_1.CommandLineToArgv
        L16_1 = L2_1
        L14_1, L15_1 = L14_1(L15_1, L16_1)
        L5_1 = L15_1
        L4_1 = L14_1
        if L4_1 then
          L14_1 = isnull
          L15_1 = L5_1
          L14_1 = L14_1(L15_1)
          if not L14_1 then
            L14_1 = type
            L15_1 = L5_1
            L14_1 = L14_1(L15_1)
            if L14_1 == "table" then
              L14_1 = isnull
              L15_1 = #L5_1
              L14_1 = L14_1(L15_1)
              if not L14_1 then
                goto lbl_91
              end
            end
          end
        end
        L14_1 = mp
        L14_1 = L14_1.CLEAN
        do return L14_1 end
        ::lbl_91::
        L14_1 = #L5_1
        if L14_1 ~= 1 then
          L14_1 = L5_1[1]
          if L14_1 ~= nil then
            goto lbl_100
          end
        end
        L14_1 = mp
        L14_1 = L14_1.CLEAN
        do return L14_1 end
        ::lbl_100::
        L14_1 = contains
        L15_1 = L2_1
        L16_1 = L8_1
        L14_1 = L14_1(L15_1, L16_1)
        if L14_1 then
          L14_1 = #L2_1
          if 50 < L14_1 then
            L14_1 = contains
            L15_1 = L2_1
            L16_1 = L9_1
            L14_1 = L14_1(L15_1, L16_1)
            if not L14_1 then
              L14_1 = sigattr_head
              L14_1 = L14_1[L13_1]
              L0_1 = L14_1.timestamp
              if L1_1 and L0_1 and L1_1 < L0_1 then
                L14_1 = L0_1 - L1_1
                if 30000000 < L14_1 then
                  L6_1 = true
                end
              end
            end
          end
        end
      end
    end
  end
end
if not L6_1 then
  L10_1 = mp
  L10_1 = L10_1.CLEAN
  return L10_1
end
if not L3_1 then
  L10_1 = mp
  L10_1 = L10_1.CLEAN
  return L10_1
end
L10_1 = contains
L11_1 = L3_1
L12_1 = "powershell.exe"
L10_1 = L10_1(L11_1, L12_1)
if L10_1 then
  L10_1 = NormalizeCmdline
  L11_1 = "powershell"
  L12_1 = L2_1
  L10_1 = L10_1(L11_1, L12_1)
  L7_1 = L10_1
else
  L10_1 = NormalizeCmdline
  L11_1 = "cmd"
  L12_1 = L2_1
  L10_1 = L10_1(L11_1, L12_1)
  L7_1 = L10_1
end
L10_1 = isnull
L11_1 = L7_1
L10_1 = L10_1(L11_1)
if L10_1 then
  L10_1 = mp
  L10_1 = L10_1.CLEAN
  return L10_1
end
L10_1 = string
L10_1 = L10_1.gsub
L11_1 = L7_1
L12_1 = "[\"'()+]"
L13_1 = ""
L10_1 = L10_1(L11_1, L12_1, L13_1)
L7_1 = L10_1
L10_1 = string
L10_1 = L10_1.lower
L11_1 = L7_1
L10_1 = L10_1(L11_1)
L7_1 = L10_1
L10_1 = {}
L11_1 = "(new-object system.net.http.httpclient).getasync"
L12_1 = "(new-object system.net.http.httpclient).getstringasync"
L13_1 = "(new-object system.net.webclient).downloadstring"
L14_1 = "(new-object system.net.webclient).downloadfile"
L15_1 = "(new-object net.webclient).downloadfile"
L16_1 = "(new-object net.webclient).downloadstring"
L17_1 = "[net.webclient]::downloadstring"
L18_1 = "curl"
L19_1 = "wget"
L20_1 = "invoke-restmethod"
L21_1 = "irm"
L22_1 = "invoke-webrequest"
L23_1 = "iwr"
L24_1 = "iex"
L25_1 = "invoke-expression"
L26_1 = "invoke-command"
L27_1 = "[scriptblock]::create"
L28_1 = "scriptblock::create"
L29_1 = "content).invoke()"
L30_1 = "invoke()"
L31_1 = "start-process"
L32_1 = "saps"
L33_1 = "cmd /c powershell"
L34_1 = "://"
L35_1 = "[char]105+[char]119+[char]114"
L36_1 = "([text.encoding]::utf8.getstring"
L37_1 = "([system.text.encoding]::ascii.getstring"
L38_1 = "[system.convert]::frombase64string"
L39_1 = "[system.text.encoding]::utf8.getstring([system.convert]::frombase64string"
L40_1 = "-usebasicparsing"
L41_1 = "-useb "
L42_1 = "-uri"
L43_1 = "-response"
L44_1 = "-w"
L45_1 = "\226\128\149w"
L46_1 = "\226\128\148w"
L47_1 = "\226\128\144"
L48_1 = "\226\128\145"
L49_1 = "\226\128\146"
L50_1 = "\226\128\148"
L51_1 = "\226\128\149"
L52_1 = "\226\129\131"
L53_1 = "\239\185\152"
L54_1 = "\239\185\163"
L55_1 = "\239\188\141"
L56_1 = "\226\184\186"
L57_1 = "\226\184\187"
L58_1 = "[char]"
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
L11_1 = contains
L12_1 = L7_1
L13_1 = L10_1
L11_1 = L11_1(L12_1, L13_1)
if not L11_1 then
  L11_1 = mp
  L11_1 = L11_1.CLEAN
  return L11_1
end
L11_1 = bm
L11_1 = L11_1.add_related_string
L12_1 = "RUNMRU_cmdline"
L13_1 = L2_1
L14_1 = bm
L14_1 = L14_1.RelatedStringBMReport
L11_1(L12_1, L13_1, L14_1)
L11_1 = mp
L11_1 = L11_1.INFECTED
return L11_1
