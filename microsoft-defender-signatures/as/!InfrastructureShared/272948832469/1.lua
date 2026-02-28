local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1
L0_1 = mp
L0_1 = L0_1.GetBruteMatchData
L0_1 = L0_1()
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = ""
L2_1 = L0_1.is_header
if L2_1 then
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = tostring
  L4_1 = headerpage
  L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1 = L3_1(L4_1)
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1)
  L1_1 = L2_1
else
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = tostring
  L4_1 = footerpage
  L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1 = L3_1(L4_1)
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1)
  L1_1 = L2_1
end
if L1_1 == "" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = {}
L3_1 = ":\\saw\\system\\sawhealthcheck.ps1$"
L4_1 = ":\\saw\\user\\sawhealthcheck.ps1$"
L5_1 = "\\microsoft intune management extension\\policies\\scripts\\"
L6_1 = ":\\windows\\imecache\\healthscripts\\.+%.ps1$"
L7_1 = "\\vdi_scripts\\defenderatp\\defenderatp.ps1$"
L8_1 = ":\\agent\\enableagent.ps1$"
L9_1 = ":\\programdata\\amazon\\ssm\\.+\\runpowershellscript\\_script.ps1$"
L10_1 = ":\\svcfab\\_app\\.+\\svc\\setupnightwatch.bat$"
L11_1 = ":\\work\\cloudtest\\preconfig.cmd$"
L12_1 = "%w\\bin\\defender%-exclusions.ps1$"
L13_1 = ":\\packages\\plugins\\microsoft."
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
L3_1 = mp
L3_1 = L3_1.getfilename
L3_1 = L3_1()
if L3_1 then
  L4_1 = MpCommon
  L4_1 = L4_1.PathToWin32Path
  L5_1 = L3_1
  L4_1 = L4_1(L5_1)
  L3_1 = L4_1
  if L3_1 then
    L4_1 = contains
    L5_1 = string
    L5_1 = L5_1.lower
    L6_1 = L3_1
    L5_1 = L5_1(L6_1)
    L6_1 = L2_1
    L7_1 = false
    L4_1 = L4_1(L5_1, L6_1, L7_1)
    if L4_1 then
      L4_1 = mp
      L4_1 = L4_1.CLEAN
      return L4_1
    end
  end
end
L4_1 = pcall
L5_1 = mp
L5_1 = L5_1.get_contextdata
L6_1 = mp
L6_1 = L6_1.CONTEXT_DATA_AMSI_CONTENTNAME
L4_1, L5_1 = L4_1(L5_1, L6_1)
if L5_1 then
  L6_1 = contains
  L7_1 = string
  L7_1 = L7_1.lower
  L8_1 = L5_1
  L7_1 = L7_1(L8_1)
  L8_1 = L2_1
  L9_1 = false
  L6_1 = L6_1(L7_1, L8_1, L9_1)
  if L6_1 then
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    return L6_1
  end
end
L7_1 = L1_1
L6_1 = L1_1.gsub
L8_1 = "<#.-#>"
L9_1 = ""
L6_1 = L6_1(L7_1, L8_1, L9_1)
L1_1 = L6_1
L6_1 = MpCommon
L6_1 = L6_1.StringRegExpSearch
L7_1 = "((?:set|add)-mppreference\\s+-exclusion.+?(?:;|\\||<|>|$))"
L9_1 = L1_1
L8_1 = L1_1.sub
L10_1 = L0_1.match_offset
L10_1 = L10_1 - 3
L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1 = L8_1(L9_1, L10_1)
L6_1, L7_1 = L6_1(L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1)
if L6_1 then
  L8_1 = 1
  L9_1 = ""
  L10_1 = mp
  L10_1 = L10_1.getfilename
  L10_1 = L10_1()
  L12_1 = L10_1
  L11_1 = L10_1.gsub
  L13_1 = "%-%>%(UTF%-16LE%)"
  L14_1 = ""
  L11_1 = L11_1(L12_1, L13_1, L14_1)
  L12_1 = L11_1
  L11_1 = L11_1.lower
  L11_1 = L11_1(L12_1)
  L10_1 = L11_1
  L12_1 = L7_1
  L11_1 = L7_1.gsub
  L13_1 = "-exclusion"
  L14_1 = ";"
  L11_1 = L11_1(L12_1, L13_1, L14_1)
  L12_1 = L11_1
  L11_1 = L11_1.gmatch
  L13_1 = "(%w+)%s+([^;]+)"
  L11_1, L12_1, L13_1 = L11_1(L12_1, L13_1)
  for L14_1, L15_1 in L11_1, L12_1, L13_1 do
    L17_1 = L15_1
    L16_1 = L15_1.sub
    L18_1 = 1
    L19_1 = 2
    L16_1 = L16_1(L17_1, L18_1, L19_1)
    if L16_1 == "@(" then
      L17_1 = L15_1
      L16_1 = L15_1.match
      L18_1 = "^@%((.-)%)"
      L16_1 = L16_1(L17_1, L18_1)
      L15_1 = L16_1
    end
    L16_1 = string
    L16_1 = L16_1.gmatch
    L17_1 = L15_1
    L18_1 = "([^,]+)"
    L16_1, L17_1, L18_1 = L16_1(L17_1, L18_1)
    for L19_1 in L16_1, L17_1, L18_1 do
      L21_1 = L19_1
      L20_1 = L19_1.match
      L22_1 = "^%s*(.-)%s*$"
      L20_1 = L20_1(L21_1, L22_1)
      L19_1 = L20_1
      L21_1 = L19_1
      L20_1 = L19_1.sub
      L22_1 = 1
      L23_1 = 1
      L20_1 = L20_1(L21_1, L22_1, L23_1)
      if L20_1 ~= "'" then
        L21_1 = L19_1
        L20_1 = L19_1.sub
        L22_1 = 1
        L23_1 = 1
        L20_1 = L20_1(L21_1, L22_1, L23_1)
        if L20_1 ~= "\"" then
          goto lbl_164
        end
      end
      L21_1 = L19_1
      L20_1 = L19_1.match
      L22_1 = "^['\"](.-)['\"]"
      L20_1 = L20_1(L21_1, L22_1)
      L19_1 = L20_1
      goto lbl_168
      ::lbl_164::
      L21_1 = L19_1
      L20_1 = L19_1.match
      L22_1 = "^%S+"
      L20_1 = L20_1(L21_1, L22_1)
      L19_1 = L20_1
      ::lbl_168::
      L21_1 = L19_1
      L20_1 = L19_1.sub
      L22_1 = 1
      L23_1 = 5
      L20_1 = L20_1(L21_1, L22_1, L23_1)
      if L20_1 == "$env:" then
        L20_1 = "%"
        L22_1 = L19_1
        L21_1 = L19_1.sub
        L23_1 = 6
        L21_1 = L21_1(L22_1, L23_1)
        L22_1 = "%"
        L19_1 = L20_1 .. L21_1 .. L22_1
      end
      L20_1 = L14_1
      L21_1 = "|"
      L22_1 = L19_1
      L20_1 = L20_1 .. L21_1 .. L22_1
      L21_1 = "(%systemdrive%)$|\\|\\.?(exe|dll|ps1|bat|cmd|sys)$|(c:(\\\\*)?\\*?%?$)"
      L22_1 = MpCommon
      L22_1 = L22_1.StringRegExpSearch
      L23_1 = L21_1
      L24_1 = L20_1
      L22_1, L23_1 = L22_1(L23_1, L24_1)
      if L22_1 then
        L8_1 = L8_1 + 20
        L24_1 = L9_1
        L25_1 = ";"
        L26_1 = L20_1
        L9_1 = L24_1 .. L25_1 .. L26_1
      else
        L21_1 = "(%userprofile%|%programdata%|%appdata%|%localappdata%|%windir%|%programfiles(x86)%|%programfiles%)$|(c:\\\\users\\\\.*\\\\(documents|downloads|pictures|music|videos))$|(\\w:(\\\\*)?\\*?%?$)"
        L24_1 = MpCommon
        L24_1 = L24_1.StringRegExpSearch
        L25_1 = L21_1
        L26_1 = L20_1
        L24_1, L25_1 = L24_1(L25_1, L26_1)
        L23_1 = L25_1
        L22_1 = L24_1
        if L22_1 then
          L8_1 = L8_1 + 10
          L24_1 = L9_1
          L25_1 = ";"
          L26_1 = L20_1
          L9_1 = L24_1 .. L25_1 .. L26_1
        end
      end
    end
  end
  L11_1 = mp
  L11_1 = L11_1.get_contextdata
  L12_1 = mp
  L12_1 = L12_1.CONTEXT_DATA_AMSI_OPERATION_PPID
  L11_1 = L11_1(L12_1)
  L12_1 = {}
  if L11_1 then
    L13_1 = mp
    L13_1 = L13_1.GetProcessCommandLine
    L14_1 = L11_1
    L13_1 = L13_1(L14_1)
    if L13_1 then
      L14_1 = mp
      L14_1 = L14_1.GetExecutablesFromCommandLine
      L15_1 = L13_1
      L14_1 = L14_1(L15_1)
      if not L14_1 then
        L15_1 = {}
        L14_1 = L15_1
      end
      L15_1 = mp
      L15_1 = L15_1.GetParentProcInfo
      L16_1 = L11_1
      L15_1 = L15_1(L16_1)
      if L15_1 then
        L16_1 = L15_1.ppid
        if L16_1 then
          L16_1 = mp
          L16_1 = L16_1.GetProcessCommandLine
          L17_1 = L15_1.ppid
          L16_1 = L16_1(L17_1)
          if L16_1 then
            L17_1 = mp
            L17_1 = L17_1.GetExecutablesFromCommandLine
            L18_1 = L16_1
            L17_1 = L17_1(L18_1)
            if not L17_1 then
              L18_1 = {}
              L17_1 = L18_1
            end
            L18_1 = table_dedup
            L19_1 = table_merge
            L20_1 = L14_1
            L21_1 = L17_1
            L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1 = L19_1(L20_1, L21_1)
            L18_1 = L18_1(L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1)
            L14_1 = L18_1
          end
        end
      end
    end
  end
  L13_1 = MpCommon
  L13_1 = L13_1.BmTriggerSig
  L14_1 = L11_1
  L15_1 = "WDAVExclusion"
  L16_1 = L10_1 or L16_1
  if not L10_1 then
    L16_1 = L5_1
  end
  L13_1(L14_1, L15_1, L16_1)
  if 20 <= L8_1 then
    L13_1 = mp
    L13_1 = L13_1.get_mpattribute
    L14_1 = "MpIsPowerShellAMSIScan"
    L13_1 = L13_1(L14_1)
    if L13_1 then
      L13_1 = set_research_data
      L14_1 = "BadExclusions"
      L15_1 = MpCommon
      L15_1 = L15_1.Base64Encode
      L16_1 = L9_1
      L15_1 = L15_1(L16_1)
      L16_1 = false
      L13_1(L14_1, L15_1, L16_1)
      L13_1 = set_research_data
      L14_1 = "ParentsInfo"
      L15_1 = MpCommon
      L15_1 = L15_1.Base64Encode
      L16_1 = safeJsonSerialize
      L17_1 = L12_1
      L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1 = L16_1(L17_1)
      L15_1 = L15_1(L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1)
      L16_1 = false
      L13_1(L14_1, L15_1, L16_1)
      L13_1 = hasSeenBefore
      L14_1 = "ALF:Trojan:Win32/WDAVExclusion.B"
      L15_1 = ""
      L16_1 = 1
      L17_1 = "SignatureHitInMachine"
      L13_1, L14_1 = L13_1(L14_1, L15_1, L16_1, L17_1)
      if L13_1 and 5 < L14_1 then
        L15_1 = mp
        L15_1 = L15_1.CLEAN
        return L15_1
      end
      L15_1 = addDisruptionInfo
      L16_1 = true
      L15_1(L16_1)
      L15_1 = mp
      L15_1 = L15_1.INFECTED
      return L15_1
    end
  end
end
L8_1 = mp
L8_1 = L8_1.CLEAN
return L8_1
