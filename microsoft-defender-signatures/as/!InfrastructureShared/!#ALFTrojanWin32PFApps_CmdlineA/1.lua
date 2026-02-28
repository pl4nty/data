local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1
L0_1 = pcall
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_AMSI_CONTENTNAME
L0_1, L1_1 = L0_1(L1_1, L2_1)
if L1_1 then
  L2_1 = {}
  L3_1 = "C:\\WINDOWS\\CCM\\"
  L4_1 = "C:\\WINDOWS\\IMECache\\"
  L5_1 = "\\Nexthink\\"
  L6_1 = "Microsoft\\Windows Defender Advanced Threat Protection\\"
  L7_1 = "WindowsDefenderExploitGuard\\Modules"
  L8_1 = "Plugins\\Microsoft.Azure"
  L2_1[1] = L3_1
  L2_1[2] = L4_1
  L2_1[3] = L5_1
  L2_1[4] = L6_1
  L2_1[5] = L7_1
  L2_1[6] = L8_1
  L3_1 = contains
  L4_1 = L1_1
  L5_1 = L2_1
  L6_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1)
  if L3_1 then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  L3_1 = hasSeenBefore
  L4_1 = string
  L4_1 = L4_1.lower
  L5_1 = L1_1
  L4_1 = L4_1(L5_1)
  L5_1 = ""
  L6_1 = 20
  L7_1 = "FileName"
  L3_1, L4_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if L3_1 and 2 < L4_1 then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
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
L4_1 = L4_1.CONTEXT_DATA_PROCESSDEVICEPATH
L3_1 = L3_1(L4_1)
if not L3_1 then
  L3_1 = ""
end
L4_1 = string
L4_1 = L4_1.find
L5_1 = L3_1
L6_1 = "\\WindowsApps\\"
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if L4_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = tostring
L5_1 = headerpage
L4_1 = L4_1(L5_1)
L5_1 = tostring
L6_1 = footerpage
L5_1 = L5_1(L6_1)
L4_1 = L4_1 .. L5_1
L5_1 = string
L5_1 = L5_1.lower
L6_1 = L4_1
L5_1 = L5_1(L6_1)
L4_1 = L5_1
L5_1 = CommandLineGrader
L6_1 = L4_1
L7_1 = true
L8_1 = 2
L5_1, L6_1 = L5_1(L6_1, L7_1, L8_1)
if L5_1 and L6_1 then
  L7_1 = next
  L8_1 = L6_1
  L7_1 = L7_1(L8_1)
  if L7_1 then
    goto lbl_125
  end
end
L7_1 = mp
L7_1 = L7_1.CLEAN
do return L7_1 end
::lbl_125::
L7_1 = GetCurrentPPID
L7_1 = L7_1()
if not L7_1 then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L8_1 = mp
L8_1 = L8_1.GetProcessCommandLine
L9_1 = L7_1
L8_1 = L8_1(L9_1)
L9_1 = hasBase64Content
L10_1 = L4_1
L9_1 = L9_1(L10_1)
if not L9_1 then
  L9_1 = hasBase64Content
  L10_1 = L8_1
  L9_1 = L9_1(L10_1)
  if not L9_1 then
    L9_1 = hasURLEncodedContent
    L10_1 = L8_1
    L9_1 = L9_1(L10_1)
    if not L9_1 then
      goto lbl_152
    end
  end
end
L5_1 = L5_1 + 10
::lbl_152::
L9_1 = L6_1.Evidence_L1
L9_1 = L9_1.MultilayerEncoding
if not L9_1 then
  L9_1 = L6_1.Evidence_L1
  L9_1 = L9_1.Obfuscated_FailedToDecode
  if not L9_1 then
    goto lbl_161
  end
end
L5_1 = L5_1 + 20
::lbl_161::
L9_1 = L6_1.Evidence_L1
if L9_1 then
  L9_1 = next
  L10_1 = L6_1.Evidence_L1
  L10_1 = L10_1.Urls
  L9_1 = L9_1(L10_1)
  if not L9_1 then
    L9_1 = hasTamperingCmd
    L10_1 = L4_1
    L9_1 = L9_1(L10_1)
    if not L9_1 and L5_1 < 10 then
      L9_1 = mp
      L9_1 = L9_1.CLEAN
      return L9_1
    end
  end
end
L9_1 = {}
L9_1.Score = L5_1
L9_1.ScriptName = L1_1
L10_1 = nil
L11_1 = mp
L11_1 = L11_1.GetParentProcInfo
L12_1 = L7_1
L11_1 = L11_1(L12_1)
if L11_1 then
  L12_1 = L11_1.ppid
  if L12_1 then
    L12_1 = MpCommon
    L12_1 = L12_1.GetImagePathFromPid
    L13_1 = L11_1.ppid
    L12_1 = L12_1(L13_1)
    L10_1 = L12_1
  end
end
L12_1 = L6_1.CommandlineTokens
if L12_1 then
  L12_1 = IsPotentiallyClean
  L13_1 = "CmdLine_Basic"
  L14_1 = ""
  L15_1 = table
  L15_1 = L15_1.concat
  L16_1 = L6_1.CommandlineTokens
  L17_1 = "|"
  L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1 = L15_1(L16_1, L17_1)
  L12_1 = L12_1(L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1)
  if L12_1 then
    L12_1 = mp
    L12_1 = L12_1.CLEAN
    return L12_1
  end
  L12_1 = IsPotentiallyClean
  L13_1 = "CmdLine"
  L14_1 = L10_1 or L14_1
  if not L10_1 then
    L14_1 = ""
    L15_1 = ";powershell.exe"
    L14_1 = L14_1 .. L15_1
  end
  L15_1 = L6_1.CommandlineTokens
  L12_1, L13_1, L14_1 = L12_1(L13_1, L14_1, L15_1)
  if L12_1 then
    L9_1.IsPotentiallyClean = L13_1
  end
end
L12_1 = add_parents_mp
L12_1 = L12_1()
if not L12_1 then
  L12_1 = L10_1
end
L9_1.Parents = L12_1
L12_1 = GetAppomalyProcessAttribute
L13_1 = L7_1
L12_1, L13_1 = L12_1(L13_1)
L14_1 = safeJsonDeserialize
L15_1 = L13_1
L14_1 = L14_1(L15_1)
if L14_1 then
  L15_1 = L14_1.AppName
  L16_1 = mp
  L16_1 = L16_1.GetParentProcInfo
  L17_1 = L7_1
  L16_1 = L16_1(L17_1)
  L17_1 = L16_1.image_path
  L19_1 = L17_1
  L18_1 = L17_1.match
  L20_1 = "([^\\]+)$"
  L18_1 = L18_1(L19_1, L20_1)
  if not L18_1 then
    L18_1 = ""
  end
  L19_1 = "powershell.exe"
  L20_1 = L6_1.CommandlineTokens
  L21_1 = {}
  L21_1.ParentName = L18_1
  L21_1.TrackedProcess = L15_1
  L21_1.ProcessName = L19_1
  L21_1.Source = "AMSI"
  L21_1.SignatureName = "PFApps_Cmdline.A"
  L21_1.CommandlineTokens = L20_1
  L22_1 = L9_1.Score
  L21_1.CommandlineScore = L22_1
  L22_1 = L9_1.CmdGradingInfo
  L21_1.CommandlineScoreIndicator = L22_1
  L21_1.AnomalyTableName = "Appomaly_ChildProcName_CmdLine"
  L22_1 = GetAnomalyTableAge
  L23_1 = "Appomaly_ChildProcName_CmdLine"
  L22_1 = L22_1(L23_1)
  L21_1.TableAge = L22_1
  L22_1 = table
  L22_1 = L22_1.concat
  L23_1 = L20_1
  L24_1 = "|"
  L22_1 = L22_1(L23_1, L24_1)
  L23_1 = L15_1
  L24_1 = ";"
  L25_1 = L19_1
  L26_1 = ";"
  L27_1 = L22_1
  L23_1 = L23_1 .. L24_1 .. L25_1 .. L26_1 .. L27_1
  L24_1 = AnomalyTableCheck
  L25_1 = "Appomaly_ChildProcName_CmdLine"
  L26_1 = L23_1
  L27_1 = 30
  L28_1 = "MarkerRecord_"
  L29_1 = L15_1
  L28_1 = L28_1 .. L29_1
  L24_1, L25_1, L26_1 = L24_1(L25_1, L26_1, L27_1, L28_1)
  if L24_1 == false and L25_1 == false then
    L27_1 = mp
    L27_1 = L27_1.CLEAN
    return L27_1
  elseif L24_1 and not L25_1 then
    L27_1 = IsPotentiallyClean
    L28_1 = "CmdLine"
    L29_1 = L15_1
    L30_1 = ";"
    L31_1 = L19_1
    L29_1 = L29_1 .. L30_1 .. L31_1
    L30_1 = L22_1
    L27_1, L28_1, L29_1 = L27_1(L28_1, L29_1, L30_1)
    if L27_1 then
      L9_1.IsPotentiallyClean = L28_1
    end
    L30_1 = MpCommon
    L30_1 = L30_1.BmTriggerSig
    L31_1 = L16_1.ppid
    L32_1 = "AnomalousChildCommandline2"
    L33_1 = safeJsonSerialize
    L34_1 = L21_1
    L33_1, L34_1 = L33_1(L34_1)
    L30_1(L31_1, L32_1, L33_1, L34_1)
  end
  L27_1 = "SuspAMSICmd["
  L29_1 = L7_1
  L28_1 = L7_1.match
  L30_1 = "pid:(%d+)"
  L28_1 = L28_1(L29_1, L30_1)
  L27_1 = L27_1 .. L28_1
  L28_1 = {}
  L28_1.Pid = L7_1
  L28_1.CmdGradingInfo = L6_1
  L28_1.IndicatorScore = L5_1
  L28_1.Parents = L17_1
  L29_1 = IncreaseProcessAnomalyScore
  L30_1 = L7_1
  L31_1 = L5_1
  L32_1 = L27_1
  L33_1 = L12_1
  L34_1 = L28_1
  L29_1(L30_1, L31_1, L32_1, L33_1, L34_1)
end
L9_1.Concrete = false
L9_1.Remediation_Reason = ""
L15_1 = L9_1.CmdGradingInfo
if L15_1 then
  L16_1 = L15_1.Evidence_L1
  if L16_1 then
    L16_1 = L15_1.Evidence_L1
    L16_1 = L16_1.Urls
    L17_1 = pairs
    L18_1 = L16_1
    L17_1, L18_1, L19_1 = L17_1(L18_1)
    for L20_1, L21_1 in L17_1, L18_1, L19_1 do
      L22_1 = L21_1.BadUrlRep
      if L22_1 then
        L9_1.Remediation_Reason = "BadUrlRep"
        L9_1.Concrete = true
        break
      end
    end
  end
end
L16_1 = L9_1.Score
if 45 < L16_1 then
  L16_1 = L9_1.Remediation_Reason
  L17_1 = ";"
  L18_1 = "HighScore"
  L16_1 = L16_1 .. L17_1 .. L18_1
  L9_1.Remediation_Reason = L16_1
end
L16_1 = {}
L6_1.CommandlineTokens = L16_1
L9_1.CmdGradingInfo = L6_1
L16_1 = safeJsonSerialize
L17_1 = L9_1
L18_1 = 150
L19_1 = nil
L20_1 = true
L16_1, L17_1 = L16_1(L17_1, L18_1, L19_1, L20_1)
if not L16_1 then
  L18_1 = set_research_data
  L19_1 = "Error"
  L20_1 = "Error Serializing Evidence Data"
  L21_1 = MpCommon
  L21_1 = L21_1.Base64Encode
  L22_1 = L17_1
  L21_1 = L21_1(L22_1)
  L20_1 = L20_1 .. L21_1
  L21_1 = false
  L18_1(L19_1, L20_1, L21_1)
  L18_1 = mp
  L18_1 = L18_1.INFECTED
  return L18_1
else
  L18_1 = set_research_data
  L19_1 = "Evidence"
  L20_1 = MpCommon
  L20_1 = L20_1.Base64Encode
  L21_1 = L16_1
  L20_1 = L20_1(L21_1)
  L21_1 = false
  L18_1(L19_1, L20_1, L21_1)
  L18_1 = MpCommon
  L18_1 = L18_1.BmTriggerSig
  L19_1 = L7_1
  L20_1 = "LUA:PFApps_Cmdline"
  L21_1 = L16_1
  L18_1(L19_1, L20_1, L21_1)
end
L18_1 = mp
L18_1 = L18_1.CLEAN
return L18_1
