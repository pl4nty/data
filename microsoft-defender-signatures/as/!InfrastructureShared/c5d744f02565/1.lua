local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1
L0_1 = mp
L0_1 = L0_1.GetScannedPPID
L0_1 = L0_1()
if L0_1 == "" or L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = MpCommon
L1_1 = L1_1.GetProcessAttributeValue
L2_1 = L0_1
L3_1 = "inherit:PFApp_Parent"
L1_1 = L1_1(L2_1, L3_1)
if not L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.GetProcessCommandLine
L3_1 = L0_1
L2_1 = L2_1(L3_1)
if not L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.hstr_full_log
L3_1 = L3_1()
if L3_1 then
  L4_1 = L3_1[2]
  L4_1 = L4_1.matched
  if not L4_1 then
    L4_1 = L3_1[3]
    L4_1 = L4_1.matched
    if not L4_1 then
      goto lbl_53
    end
  end
  L4_1 = MpCommon
  L4_1 = L4_1.StringRegExpSearch
  L5_1 = "(powershell|pwsh).exe.*-e(nc)?\\s+([-A-Za-z0-9+/]{10,}=*)"
  L6_1 = L2_1
  L4_1, L5_1 = L4_1(L5_1, L6_1)
  if not L4_1 then
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    return L6_1
  end
end
::lbl_53::
L4_1 = ""
L5_1 = 1
L6_1 = ""
L7_1 = {}
L8_1 = "(?:(?i)FromBase64String\\(['\"]?)(\\$[\\w_]+|[-A-Za-z0-9+/]*={0,3})(?:['\"]?\\))"
L9_1 = MpCommon
L9_1 = L9_1.StringRegExpSearch
L10_1 = L8_1
L11_1 = L2_1
L9_1, L10_1 = L9_1(L10_1, L11_1)
if L9_1 then
  L11_1 = string
  L11_1 = L11_1.find
  L12_1 = L10_1
  L13_1 = "$"
  L14_1 = 1
  L15_1 = true
  L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
  if L11_1 then
    L11_1 = string
    L11_1 = L11_1.match
    L12_1 = L10_1
    L13_1 = "$([%w_]+)"
    L11_1 = L11_1(L12_1, L13_1)
    if L11_1 then
      L12_1 = L11_1
      L13_1 = "%s*=%s*"
      L14_1 = "([-%w/+]+=*)%s*;"
      L12_1 = L12_1 .. L13_1 .. L14_1
      L13_1 = string
      L13_1 = L13_1.match
      L14_1 = L2_1
      L15_1 = L12_1
      L13_1 = L13_1(L14_1, L15_1)
      if L13_1 then
        L14_1 = #L13_1
        if 35 < L14_1 then
          L5_1 = L5_1 + 10
        end
        L14_1 = MpCommon
        L14_1 = L14_1.Base64Decode
        L15_1 = L13_1
        L14_1 = L14_1(L15_1)
        if L14_1 then
          L4_1 = L14_1
        else
          L5_1 = L5_1 + 10
          L6_1 = "obfuscated_var1"
        end
      else
        L14_1 = L11_1
        L15_1 = "%s*=%s*"
        L16_1 = "[^;]+"
        L12_1 = L14_1 .. L15_1 .. L16_1
        L14_1 = string
        L14_1 = L14_1.match
        L15_1 = L2_1
        L16_1 = L12_1
        L14_1 = L14_1(L15_1, L16_1)
        L13_1 = L14_1
        if L13_1 then
          L14_1 = string
          L14_1 = L14_1.find
          L15_1 = L13_1
          L16_1 = "[A-Za-z]:\\[^%s]+"
          L14_1 = L14_1(L15_1, L16_1)
          if not L14_1 then
            L5_1 = L5_1 + 10
            L6_1 = "obfuscated_var2"
          end
        end
      end
    end
end
elseif L9_1 then
  L11_1 = #L10_1
  if 35 < L11_1 then
    L5_1 = L5_1 + 10
  end
  L11_1 = MpCommon
  L11_1 = L11_1.Base64Decode
  L12_1 = L10_1
  L11_1 = L11_1(L12_1)
  if L11_1 then
    L4_1 = L11_1
  else
    L5_1 = L5_1 + 10
    L6_1 = "obfuscated_var3"
  end
elseif not L9_1 then
  L8_1 = "-e (\\$[\\w_]+|[-A-Za-z0-9+/]*={0,3})"
  L11_1 = MpCommon
  L11_1 = L11_1.StringRegExpSearch
  L12_1 = L8_1
  L13_1 = L2_1
  L11_1, L12_1 = L11_1(L12_1, L13_1)
  L10_1 = L12_1
  L9_1 = L11_1
  if L9_1 then
    L11_1 = MpCommon
    L11_1 = L11_1.Base64Decode
    L12_1 = L10_1
    L11_1 = L11_1(L12_1)
    if L11_1 then
      L4_1 = L11_1
    else
      L5_1 = L5_1 + 10
      L6_1 = "obfuscated_var5"
    end
  else
    L5_1 = L5_1 + 10
    L6_1 = "obfuscated_var4"
  end
end
L11_1 = string
L11_1 = L11_1.lower
L12_1 = L2_1
L11_1 = L11_1(L12_1)
L2_1 = L11_1
L11_1 = string
L11_1 = L11_1.lower
L12_1 = L4_1
L11_1 = L11_1(L12_1)
L4_1 = L11_1
L11_1 = L2_1
L12_1 = L4_1
L11_1 = L11_1 .. L12_1
L12_1 = {}
L12_1["[io.file]::writeallbytes"] = 5
L12_1["system.reflection.assembly"] = 5
L12_1["iisy.invoke"] = 5
L12_1.tcplistener = 5
L12_1.accepttcpclient = 5
L12_1.tcpclient = 5
L12_1.downloadstring = 5
L12_1["[^r]shell[^.]"] = 5
L12_1["cmd.exe"] = 5
L12_1.defender = 30
L12_1.scriptblock = 5
L12_1.webrequest = 5
L12_1["user-agent"] = 10
L12_1.webclient = 5
L12_1["unicode.getstring"] = 5
L12_1.whoami = 5
L12_1["net user"] = 5
L13_1 = pairs
L14_1 = L12_1
L13_1, L14_1, L15_1 = L13_1(L14_1)
for L16_1, L17_1 in L13_1, L14_1, L15_1 do
  L18_1 = string
  L18_1 = L18_1.find
  L19_1 = L11_1
  L20_1 = L16_1
  L18_1 = L18_1(L19_1, L20_1)
  if L18_1 then
    L5_1 = L5_1 + L17_1
    L18_1 = L6_1
    L19_1 = ";"
    L20_1 = L16_1
    L6_1 = L18_1 .. L19_1 .. L20_1
  end
end
L13_1 = "((?i)(ftp|http[s]?)://[^\\\"\\s\\']+)"
L14_1 = MpCommon
L14_1 = L14_1.StringRegExpSearch
L15_1 = L13_1
L16_1 = L11_1
L14_1, L15_1 = L14_1(L15_1, L16_1)
if L14_1 then
  L7_1.uri = L15_1
  L5_1 = L5_1 + 10
  L16_1 = L6_1
  L17_1 = ";url"
  L6_1 = L16_1 .. L17_1
  L16_1 = MpCommon
  L16_1 = L16_1.StringRegExpSearch
  L17_1 = ".(exe|dll|ps1|bat|rar)$"
  L18_1 = L15_1
  L16_1, L17_1 = L16_1(L17_1, L18_1)
  _ = L17_1
  L14_1 = L16_1
  if L14_1 then
    L5_1 = L5_1 + 10
    L16_1 = L6_1
    L17_1 = ";file_extension"
    L6_1 = L16_1 .. L17_1
  end
  L16_1 = string
  L16_1 = L16_1.find
  L17_1 = L15_1
  L18_1 = "%d+%.%d+%.%d+%.%d+"
  L16_1 = L16_1(L17_1, L18_1)
  if L16_1 then
    L5_1 = L5_1 + 10
    L16_1 = L6_1
    L17_1 = ";IP"
    L6_1 = L16_1 .. L17_1
  end
  L16_1 = {}
  L16_1.SIG_CONTEXT = "CMD"
  L16_1.FILELESS = "true"
  L16_1.CMDLINE_URL = "true"
  L17_1 = SafeGetUrlReputation
  L18_1 = {}
  L19_1 = L15_1
  L18_1[1] = L19_1
  L19_1 = L16_1
  L20_1 = false
  L21_1 = 2000
  L17_1 = L17_1(L18_1, L19_1, L20_1, L21_1)
  if L17_1 then
    L18_1 = L17_1.urls
    L18_1 = L18_1[L15_1]
    if L18_1 then
      L18_1 = L17_1.urls
      L18_1 = L18_1[L15_1]
      L18_1 = L18_1.determination
      if L18_1 ~= 1 then
        L18_1 = L17_1.urls
        L18_1 = L18_1[L15_1]
        L18_1 = L18_1.confidence
        if 60 <= L18_1 then
          L7_1.detectorId = "BadUrlRep"
          L18_1 = L17_1.urls
          L18_1 = L18_1[L15_1]
          L18_1 = L18_1.confidence
          L7_1.confidence = L18_1
          L18_1 = L17_1.urls
          L18_1 = L18_1[L15_1]
          L18_1 = L18_1.determination
          L7_1.determination = L18_1
          L5_1 = L5_1 + 10
        end
      end
    end
  end
end
L16_1 = string
L16_1 = L16_1.find
L17_1 = L4_1
L18_1 = "frombase64string"
L19_1 = 1
L20_1 = true
L16_1 = L16_1(L17_1, L18_1, L19_1, L20_1)
if L16_1 then
  L5_1 = L5_1 + 10
  L16_1 = L6_1
  L17_1 = ";MultilayerEncoding"
  L6_1 = L16_1 .. L17_1
end
L7_1.Score = L5_1
L7_1.ProcessAttribute = L1_1
L7_1.Evidence = L6_1

function L16_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = L3_1
  if L1_2 then
    L1_2 = L3_1
    L1_2 = L1_2[2]
    L1_2 = L1_2.matched
    if not L1_2 then
      L1_2 = L3_1
      L1_2 = L1_2[5]
      L1_2 = L1_2.matched
      if not L1_2 then
        L1_2 = L3_1
        L1_2 = L1_2[3]
        L1_2 = L1_2.matched
        if not L1_2 then
          goto lbl_21
        end
      end
    end
    L1_2 = false
    return L1_2
  end
  ::lbl_21::
  L1_2 = {}
  L2_2 = "httpd"
  L3_2 = "w3wp"
  L4_2 = "sqlservr"
  L5_2 = "tomcat"
  L1_2[1] = L2_2
  L1_2[2] = L3_2
  L1_2[3] = L4_2
  L1_2[4] = L5_2
  L2_2 = false
  L3_2 = ipairs
  L4_2 = L1_2
  L3_2, L4_2, L5_2 = L3_2(L4_2)
  for L6_2, L7_2 in L3_2, L4_2, L5_2 do
    L8_2 = string
    L8_2 = L8_2.find
    L9_2 = A0_2
    L10_2 = L7_2
    L8_2 = L8_2(L9_2, L10_2)
    if L8_2 then
      L2_2 = true
      break
    end
  end
  return L2_2
end

L17_1 = nil
L18_1 = nil
L19_1 = L16_1
L20_1 = L1_1
L19_1 = L19_1(L20_1)
if L19_1 and 30 < L5_1 then
  L7_1.Concrete = true
  L19_1 = safeJsonSerialize
  L20_1 = L7_1
  L21_1 = 150
  L22_1 = nil
  L23_1 = true
  L19_1, L20_1 = L19_1(L20_1, L21_1, L22_1, L23_1)
  L18_1 = L20_1
  L17_1 = L19_1
  L19_1 = set_research_data
  L20_1 = "Evidence"
  L21_1 = MpCommon
  L21_1 = L21_1.Base64Encode
  L22_1 = L17_1
  L21_1 = L21_1(L22_1)
  L22_1 = false
  L19_1(L20_1, L21_1, L22_1)
  L19_1 = set_research_data
  L20_1 = "Error"
  L21_1 = MpCommon
  L21_1 = L21_1.Base64Encode
  L22_1 = L18_1
  L21_1 = L21_1(L22_1)
  L22_1 = false
  L19_1(L20_1, L21_1, L22_1)
  L19_1 = mp
  L19_1 = L19_1.INFECTED
  return L19_1
end
L7_1.Concrete = false
L19_1 = safeJsonSerialize
L20_1 = L7_1
L21_1 = 150
L22_1 = nil
L23_1 = true
L19_1, L20_1 = L19_1(L20_1, L21_1, L22_1, L23_1)
L18_1 = L20_1
L17_1 = L19_1
L19_1 = set_research_data
L20_1 = "Evidence"
L21_1 = MpCommon
L21_1 = L21_1.Base64Encode
L22_1 = L17_1
L21_1 = L21_1(L22_1)
L22_1 = false
L19_1(L20_1, L21_1, L22_1)
L19_1 = set_research_data
L20_1 = "Error"
L21_1 = MpCommon
L21_1 = L21_1.Base64Encode
L22_1 = L18_1
L21_1 = L21_1(L22_1)
L22_1 = false
L19_1(L20_1, L21_1, L22_1)
L19_1 = mp
L19_1 = L19_1.LOWFI
return L19_1
