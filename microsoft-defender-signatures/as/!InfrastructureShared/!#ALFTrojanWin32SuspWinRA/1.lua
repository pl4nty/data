local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1
L0_1 = pcall
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_AMSI_CONTENTNAME
L0_1, L1_1 = L0_1(L1_1, L2_1)
if L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_PROCESSNAME
L2_1 = L2_1(L3_1)
if L2_1 then
  L3_1 = string
  L3_1 = L3_1.lower
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  L2_1 = L3_1
  L3_1 = string
  L3_1 = L3_1.find
  L4_1 = L2_1
  L5_1 = "powershell"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if not L3_1 then
    L3_1 = string
    L3_1 = L3_1.find
    L4_1 = L2_1
    L5_1 = "pwsh.exe"
    L6_1 = 1
    L7_1 = true
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if not L3_1 then
      L3_1 = mp
      L3_1 = L3_1.CLEAN
      return L3_1
    end
  end
end
L3_1 = mp
L3_1 = L3_1.get_contextdata
L4_1 = mp
L4_1 = L4_1.CONTEXT_DATA_AMSI_OPERATION_PPID
L3_1 = L3_1(L4_1)
if not L3_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.GetProcessCommandLine
L5_1 = L3_1
L4_1 = L4_1(L5_1)
if not L4_1 or L4_1 == "" then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = string
L5_1 = L5_1.find
L6_1 = L4_1
L7_1 = ".ps1"
L8_1 = 1
L9_1 = true
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
if not L5_1 then
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L4_1
  L7_1 = " -file "
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if not L5_1 then
    L5_1 = string
    L5_1 = L5_1.find
    L6_1 = L4_1
    L7_1 = " -WorkingDirectory "
    L8_1 = 1
    L9_1 = true
    L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
    if not L5_1 then
      goto lbl_96
    end
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
do return L5_1 end
::lbl_96::
L5_1 = mp
L5_1 = L5_1.GetParentProcInfo
L6_1 = L3_1
L5_1 = L5_1(L6_1)
if L5_1 then
  L6_1 = L5_1.ppid
  if L6_1 then
    goto lbl_108
  end
end
L6_1 = mp
L6_1 = L6_1.CLEAN
do return L6_1 end
::lbl_108::
L6_1 = MpCommon
L6_1 = L6_1.GetImagePathFromPid
L7_1 = L5_1.ppid
L6_1 = L6_1(L7_1)
if L6_1 then
  L7_1 = string
  L7_1 = L7_1.lower
  L8_1 = L6_1
  L7_1 = L7_1(L8_1)
  L6_1 = L7_1
  L7_1 = string
  L7_1 = L7_1.find
  L8_1 = L6_1
  L9_1 = "\\explorer.exe"
  L10_1 = 1
  L11_1 = false
  L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
  if not L7_1 then
    L7_1 = mp
    L7_1 = L7_1.CLEAN
    return L7_1
  end
else
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = 0
L8_1 = {}
L9_1 = add_parents_AMSI
L9_1 = L9_1()
L8_1.Parents = L9_1
L9_1 = L8_1.Parents
L9_1 = #L9_1
if 2 < L9_1 then
  L9_1 = mp
  L9_1 = L9_1.CLEAN
  return L9_1
end
L9_1 = string
L9_1 = L9_1.find
L10_1 = next
L11_1 = L8_1.Parents
L10_1 = L10_1(L11_1)
L11_1 = "\\WindowsApps\\"
L12_1 = 1
L13_1 = true
L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
if L9_1 then
  L9_1 = mp
  L9_1 = L9_1.CLEAN
  return L9_1
end
L9_1 = tostring
L10_1 = headerpage
L9_1 = L9_1(L10_1)
L10_1 = tostring
L11_1 = footerpage
L10_1 = L10_1(L11_1)
L9_1 = L9_1 .. L10_1
L10_1 = hasBase64Content
L11_1 = L9_1
L10_1 = L10_1(L11_1)
if not L10_1 then
  L10_1 = hasBase64Content
  L11_1 = L4_1
  L10_1 = L10_1(L11_1)
  if not L10_1 then
    goto lbl_180
  end
end
L8_1.Base64Content = true
L7_1 = L7_1 + 10
::lbl_180::
L10_1 = hasURLEncodedContent
L11_1 = L4_1
L10_1 = L10_1(L11_1)
if L10_1 then
  L8_1.UrlEncodedContent = true
  L7_1 = L7_1 + 10
end
L10_1 = hasTamperingCmd
L11_1 = L9_1
L10_1 = L10_1(L11_1)
if L10_1 then
  L7_1 = L7_1 + 5
  L8_1.TamperingCmd = true
end
L10_1 = CommandLineGrader
L11_1 = L9_1
L12_1 = true
L13_1 = 2
L10_1, L11_1 = L10_1(L11_1, L12_1, L13_1)
if L10_1 <= 0 or not L11_1 then
  L12_1 = mp
  L12_1 = L12_1.CLEAN
  return L12_1
end
L12_1 = L11_1.CommandlineTokens
if L12_1 then
  L12_1 = next
  L13_1 = L11_1.CommandlineTokens
  L12_1 = L12_1(L13_1)
  if not L12_1 then
    L12_1 = mp
    L12_1 = L12_1.CLEAN
    return L12_1
  end
end
L12_1 = L8_1.Base64Content
if not L12_1 then
  L12_1 = L8_1.UrlEncodedContent
  if not L12_1 then
    L12_1 = next
    L13_1 = L11_1.Evidence_L1
    L13_1 = L13_1.Urls
    L12_1 = L12_1(L13_1)
    if not L12_1 then
      L12_1 = mp
      L12_1 = L12_1.CLEAN
      return L12_1
    end
  end
end
L12_1 = next
L13_1 = L11_1.Evidence_L1
L13_1 = L13_1.Urls
L12_1 = L12_1(L13_1)
if L12_1 then
  L7_1 = L7_1 + 50
end
L12_1 = table
L12_1 = L12_1.concat
L13_1 = L11_1.CommandlineTokens
L14_1 = "|"
L12_1 = L12_1(L13_1, L14_1)
L13_1 = IsPotentiallyClean
L14_1 = "CmdLine_Basic"
L15_1 = ""
L16_1 = L12_1
L13_1 = L13_1(L14_1, L15_1, L16_1)
if L13_1 then
  L13_1 = mp
  L13_1 = L13_1.CLEAN
  return L13_1
end
L13_1 = string
L13_1 = L13_1.find
L14_1 = L12_1
L15_1 = "downloadstring"
L16_1 = 1
L17_1 = true
L13_1 = L13_1(L14_1, L15_1, L16_1, L17_1)
if L13_1 then
  L7_1 = L7_1 + 100
end
L13_1 = L11_1.Evidence_L1
L13_1 = L13_1.MultilayerEncoding
if not L13_1 then
  L13_1 = L11_1.Evidence_L1
  L13_1 = L13_1.Obfuscated_FailedToDecode
  if not L13_1 then
    goto lbl_273
  end
end
L7_1 = L7_1 + 200
::lbl_273::
L13_1 = L11_1.Evidence_L1
L13_1 = L13_1.IsRemoteSession
if L13_1 then
  L7_1 = L7_1 + 5
end
if L7_1 < 10 then
  L13_1 = mp
  L13_1 = L13_1.CLEAN
  return L13_1
end
L13_1 = {}
L11_1.CommandlineTokens = L13_1
L8_1.CommandLineGradingInfo = L11_1
L13_1 = safeJsonSerialize
L14_1 = L8_1
L15_1 = 150
L16_1 = nil
L17_1 = true
L13_1, L14_1 = L13_1(L14_1, L15_1, L16_1, L17_1)
if not L13_1 then
  L15_1 = set_research_data
  L16_1 = "Error"
  L17_1 = "Error Serializing Evidence Data"
  L18_1 = MpCommon
  L18_1 = L18_1.Base64Encode
  L19_1 = L14_1
  L18_1 = L18_1(L19_1)
  L17_1 = L17_1 .. L18_1
  L18_1 = false
  L15_1(L16_1, L17_1, L18_1)
  L15_1 = mp
  L15_1 = L15_1.INFECTED
  return L15_1
else
  L15_1 = MpCommon
  L15_1 = L15_1.BmTriggerSig
  L16_1 = L3_1
  L17_1 = "LUA:SuspWinR"
  L18_1 = L13_1
  L15_1(L16_1, L17_1, L18_1)
end
L15_1 = mp
L15_1 = L15_1.CLEAN
return L15_1
