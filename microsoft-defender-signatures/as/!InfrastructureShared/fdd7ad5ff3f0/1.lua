local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
L1_1 = GetAppomalyProcessAttribute
L2_1 = L0_1.ppid
L1_1, L2_1 = L1_1(L2_1)
if L1_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = MpCommon
L3_1 = L3_1.GetImagePathFromPid
L4_1 = L0_1.ppid
L3_1 = L3_1(L4_1)
if not L3_1 then
  L3_1 = ""
end
L5_1 = L3_1
L4_1 = L3_1.match
L6_1 = "([^\\]+)$"
L4_1 = L4_1(L5_1, L6_1)
if not L4_1 then
  L4_1 = ""
end
L5_1 = {}
L5_1.ParentName = L4_1
L6_1 = mp
L6_1 = L6_1.GetScannedPPID
L6_1 = L6_1()
if not L6_1 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = mp
L7_1 = L7_1.GetProcessCommandLine
L8_1 = L6_1
L7_1 = L7_1(L8_1)
if not L7_1 then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L8_1 = add_parents_mp
L8_1 = L8_1()
L5_1.Parents = L8_1
L9_1 = mp
L9_1 = L9_1.hstr_full_log
L9_1 = L9_1()
if L9_1 then
  L10_1 = L9_1[2]
  L10_1 = L10_1.matched
  if not L10_1 then
    L10_1 = L9_1[3]
    L10_1 = L10_1.matched
    if not L10_1 then
      goto lbl_68
    end
  end
  L10_1 = hasBase64Content
  L11_1 = L7_1
  L10_1 = L10_1(L11_1)
  if not L10_1 then
    L10_1 = mp
    L10_1 = L10_1.CLEAN
    return L10_1
  end
end
::lbl_68::
L10_1 = Base64Grader
L11_1 = L7_1
L10_1, L11_1 = L10_1(L11_1)
L12_1 = mp
L12_1 = L12_1.enum_mpattributesubstring
L13_1 = "Appomaly_BadUrlRep_Found"
L12_1 = L12_1(L13_1)
if L12_1 then
  L13_1 = #L12_1
  if 0 < L13_1 then
    L13_1 = mp
    L13_1 = L13_1.set_mpattribute
    L14_1 = "HSTR:PFApps_MaliciousCMD_C"
    L13_1(L14_1)
  end
end
if not L11_1 then
  L13_1 = mp
  L13_1 = L13_1.CLEAN
  return L13_1
end
L13_1 = CommandlineMLScore
L13_1 = L13_1()
L11_1.ML_score = L13_1
L5_1.Base64GradingInfo = L11_1
L13_1 = mp
L13_1 = L13_1.get_mpattribute
L14_1 = "MpCmdLineFoundB64"
L13_1 = L13_1(L14_1)
if L13_1 then
  L5_1.MpCmdLineFoundB64 = true
else
  L5_1.MpCmdLineFoundB64 = false
end
L13_1 = L11_1.Evidence_L1
if L13_1 then
  L13_1 = L11_1.Evidence_L1
  L13_1 = L13_1.MultilayerEncoding
  if not L13_1 then
    L13_1 = L11_1.Evidence_L1
    L13_1 = L13_1.Obfuscated_FailedToDecode
    if not L13_1 then
      goto lbl_218
    end
  end
  L13_1 = L11_1.Score
  if 0 < L13_1 then
    L13_1 = false
    L14_1 = parent_mp_contains
    L15_1 = L8_1
    L16_1 = "GoogleUpdate.exe"
    L14_1 = L14_1(L15_1, L16_1)
    if not L14_1 then
      L14_1 = parent_mp_contains
      L15_1 = L8_1
      L16_1 = "svchost.exe"
      L14_1 = L14_1(L15_1, L16_1)
      if not L14_1 then
        L14_1 = parent_mp_contains
        L15_1 = L8_1
        L16_1 = "winrshost.exe"
        L14_1 = L14_1(L15_1, L16_1)
        if not L14_1 then
          L14_1 = parent_mp_contains
          L15_1 = L8_1
          L16_1 = "services.exe"
          L14_1 = L14_1(L15_1, L16_1)
          if not L14_1 then
            goto lbl_142
          end
        end
      end
    end
    L13_1 = true
    ::lbl_142::
    L14_1 = mp
    L14_1 = L14_1.get_mpattribute
    L15_1 = "Appomaly_Pattern_Obfuscated"
    L14_1 = L14_1(L15_1)
    if not L14_1 then
      L14_1 = L11_1.Evidence_L2
      if L14_1 then
        L14_1 = L11_1.Evidence_L2
        L14_1 = L14_1.Score
        if L14_1 <= 5 then
          L14_1 = next
          L15_1 = L11_1.Evidence_L1
          L15_1 = L15_1.Urls
          L14_1 = L14_1(L15_1)
          if not L14_1 then
            L14_1 = L11_1.Evidence_L2
            L14_1 = L14_1.MultilayerEncoding
            if not L14_1 then
              L14_1 = L11_1.Evidence_L2
              L14_1 = L14_1.Obfuscated_FailedToDecode
              if not L14_1 then
                L13_1 = true
              end
            end
          end
        end
      end
    end
    L14_1 = L11_1.Evidence_L2
    if L14_1 then
      L14_1 = L11_1.Evidence_L2
      L14_1 = L14_1.CommandlineTokens
      if L14_1 then
        L14_1 = L11_1.Evidence_L2
        L14_1 = L14_1.CommandlineTokens
        L15_1 = table_contains
        L16_1 = L14_1
        L17_1 = "googleupdate"
        L18_1 = true
        L15_1 = L15_1(L16_1, L17_1, L18_1)
        if not L15_1 then
          L15_1 = table_contains
          L16_1 = L14_1
          L17_1 = "[scriptblock]::create($split_parts[0])&$exec_wrapper"
          L18_1 = true
          L15_1 = L15_1(L16_1, L17_1, L18_1)
          if not L15_1 then
            goto lbl_194
          end
        end
        L13_1 = true
      end
    end
    ::lbl_194::
    if not L13_1 then
      L14_1 = safeJsonSerialize
      L15_1 = L11_1
      L16_1 = 150
      L17_1 = nil
      L18_1 = true
      L14_1, L15_1 = L14_1(L15_1, L16_1, L17_1, L18_1)
      L16_1 = L11_1.Evidence_L1
      L16_1 = L16_1.MultilayerEncoding
      if L16_1 then
        L16_1 = "Appomaly_MultilayerEncoded_Gen"
        if L16_1 then
          goto lbl_210
        end
      end
      L16_1 = "Appomaly_Encoded_Obfuscated_Gen"
      ::lbl_210::
      L17_1 = MpCommon
      L17_1 = L17_1.BmTriggerSig
      L18_1 = L0_1.ppid
      L19_1 = L16_1
      L20_1 = L14_1 or L20_1
      if not L14_1 then
        L20_1 = L15_1
      end
      L17_1(L18_1, L19_1, L20_1)
    end
  end
end
::lbl_218::
L13_1 = L11_1.Score
if L13_1 <= 10 then
  L13_1 = mp
  L13_1 = L13_1.ReportLowfi
  L14_1 = L3_1
  L15_1 = 3531094077
  L13_1(L14_1, L15_1)
  L13_1 = mp
  L13_1 = L13_1.CLEAN
  return L13_1
else
  L13_1 = next
  L14_1 = L11_1.Evidence_L1
  L14_1 = L14_1.Urls
  L13_1 = L13_1(L14_1)
  if not L13_1 then
    L13_1 = mp
    L13_1 = L13_1.CLEAN
    return L13_1
  else
    L13_1 = L11_1.Score
    if 40 < L13_1 then
      L13_1 = isInstalledApp
      L14_1 = L6_1
      L13_1, L14_1, L15_1 = L13_1(L14_1)
      L16_1 = MpCommon
      L16_1 = L16_1.GetImagePathFromPid
      L17_1 = L6_1
      L16_1 = L16_1(L17_1)
      L18_1 = L16_1
      L17_1 = L16_1.match
      L19_1 = "([^\\]+)$"
      L17_1 = L17_1(L18_1, L19_1)
      if not L17_1 then
        L17_1 = ""
      end
      if L14_1 then
        L18_1 = L11_1.CommandlineTokens
        if L18_1 then
          L18_1 = {}
          L18_1.ParentName = L14_1
          L18_1.ProcessName = L17_1
          L18_1.Source = "CMD"
          L18_1.SignatureName = "APML_SuspCommand.A"
          L19_1 = L11_1.Score
          L18_1.CommandlineScore = L19_1
          L19_1 = L5_1.Base64GradingInfo
          L18_1.CommandlineScoreIndicator = L19_1
          L18_1.AnomalyTableName = "Appomaly_ChildProcName_CmdLine_Base64"
          L19_1 = GetAnomalyTableAge
          L20_1 = "Appomaly_ChildProcName_CmdLine_Base64"
          L19_1 = L19_1(L20_1)
          L18_1.TableAge = L19_1
          L19_1 = L14_1
          L20_1 = ";"
          L21_1 = L17_1
          L22_1 = ";"
          L23_1 = table
          L23_1 = L23_1.concat
          L24_1 = L11_1.CommandlineTokens
          L25_1 = "|"
          L23_1 = L23_1(L24_1, L25_1)
          L19_1 = L19_1 .. L20_1 .. L21_1 .. L22_1 .. L23_1
          L20_1 = AnomalyTableCheck
          L21_1 = "Appomaly_ChildProcName_CmdLine"
          L22_1 = L19_1
          L23_1 = 30
          L20_1, L21_1, L22_1 = L20_1(L21_1, L22_1, L23_1)
          if L20_1 == false and L21_1 == false then
            L23_1 = mp
            L23_1 = L23_1.CLEAN
            return L23_1
          elseif L20_1 and not L21_1 then
            L23_1 = IsPotentiallyClean
            L24_1 = "CmdLine"
            L25_1 = L14_1
            L26_1 = ";"
            L27_1 = L17_1
            L25_1 = L25_1 .. L26_1 .. L27_1
            L26_1 = L11_1.CommandlineTokens
            L23_1, L24_1, L25_1 = L23_1(L24_1, L25_1, L26_1)
            if L23_1 then
              L5_1.IsPotentiallyClean = L24_1
            end
            L26_1 = MpCommon
            L26_1 = L26_1.BmTriggerSig
            L27_1 = L0_1.ppid
            L28_1 = "AnomalousChildCommandline2"
            L29_1 = safeJsonSerialize
            L30_1 = L18_1
            L29_1, L30_1 = L29_1(L30_1)
            L26_1(L27_1, L28_1, L29_1, L30_1)
          end
      end
      else
        L18_1 = L4_1
        L19_1 = ";"
        L20_1 = L17_1
        L21_1 = ";"
        L22_1 = table
        L22_1 = L22_1.concat
        L23_1 = L11_1.CommandlineTokens
        L24_1 = "|"
        L22_1 = L22_1(L23_1, L24_1)
        L18_1 = L18_1 .. L19_1 .. L20_1 .. L21_1 .. L22_1
        L19_1 = AnomalyTableCheck
        L20_1 = "Appomaly_Global_CmdLine"
        L21_1 = L18_1
        L22_1 = 20
        L19_1, L20_1, L21_1 = L19_1(L20_1, L21_1, L22_1)
        if L19_1 == false and L20_1 == false then
          L22_1 = mp
          L22_1 = L22_1.CLEAN
          return L22_1
        elseif L19_1 and not L20_1 then
          L5_1.AnomalousCMD_Cached = true
          L5_1.AnomalousCMD_Cached_TblInfo = L21_1
        end
      end
      if L14_1 then
        L18_1 = "programfiles"
        if L18_1 then
          goto lbl_357
        end
      end
      L18_1 = "generic"
      ::lbl_357::
      L19_1 = L15_1 or L19_1
      if not L15_1 then
        L19_1 = L0_1.ppid
      end
      L20_1 = startTrackingApp
      L21_1 = L19_1
      L22_1 = L14_1 or L22_1
      if not L14_1 then
        L22_1 = L4_1
      end
      L23_1 = L18_1
      L20_1, L21_1 = L20_1(L21_1, L22_1, L23_1)
      if not L20_1 then
        L21_1.SignatureName = "APML_SuspCommand.A"
        L22_1 = MpCommon
        L22_1 = L22_1.BmTriggerSig
        L23_1 = L19_1
        L24_1 = "ProcAttribError"
        L25_1 = safeJsonSerialize
        L26_1 = L21_1
        L25_1, L26_1, L27_1, L28_1, L29_1, L30_1 = L25_1(L26_1)
        L22_1(L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1)
      else
        L22_1 = next
        L23_1 = L21_1
        L22_1 = L22_1(L23_1)
        if L22_1 then
          L22_1 = L21_1.IsNewApp
          if L22_1 then
            L21_1.SignatureName = "APML_SuspCommand.A"
            L22_1 = L11_1.Score
            L21_1.Score = L22_1
            L22_1 = MpCommon
            L22_1 = L22_1.BmTriggerSig
            L23_1 = L19_1
            L24_1 = "SetProcessAttrib"
            L25_1 = safeJsonSerialize
            L26_1 = L21_1
            L25_1, L26_1, L27_1, L28_1, L29_1, L30_1 = L25_1(L26_1)
            L22_1(L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1)
          end
        end
      end
      L22_1 = L14_1 or L22_1
      if not L14_1 then
        L22_1 = L4_1
      end
      L5_1.AppName = L22_1
      L5_1.AppCategory = L18_1
      L22_1 = "Base64Cmd_child["
      L24_1 = L6_1
      L23_1 = L6_1.match
      L25_1 = "pid:(%d+)"
      L23_1 = L23_1(L24_1, L25_1)
      L24_1 = "][cmd/APML_SuspCommand.A]"
      L22_1 = L22_1 .. L23_1 .. L24_1
      L23_1 = {}
      L24_1 = MpCommon
      L24_1 = L24_1.GetImagePathFromPid
      L25_1 = L6_1
      L24_1 = L24_1(L25_1)
      L23_1.ProcessName = L24_1
      L24_1 = MpCommon
      L24_1 = L24_1.IsFriendlyProcess
      L25_1 = L6_1
      L24_1 = L24_1(L25_1)
      L23_1.IsProcessFriendly = L24_1
      L23_1.Pid = L6_1
      L24_1 = L5_1.Base64GradingInfo
      L23_1.Base64GradingInfo = L24_1
      L24_1 = L11_1.Score
      L23_1.IndicatorScore = L24_1
      L23_1.Parents = L8_1
      L24_1 = IncreaseProcessAnomalyScore
      L25_1 = L0_1.ppid
      L26_1 = L11_1.Score
      L27_1 = L22_1
      L28_1 = "PFAppTracked"
      L29_1 = L23_1
      L24_1(L25_1, L26_1, L27_1, L28_1, L29_1)
    end
  end
end
L5_1.Concrete = false
L5_1.Remediation_Reason = ""
L13_1 = L5_1.Base64GradingInfo
L14_1 = 1
L15_1 = 3
L16_1 = 1
for L17_1 = L14_1, L15_1, L16_1 do
  if L13_1 then
    L18_1 = "Evidence_L"
    L19_1 = L17_1
    L18_1 = L18_1 .. L19_1
    L18_1 = L13_1[L18_1]
    if L18_1 then
      L18_1 = "Evidence_L"
      L19_1 = L17_1
      L18_1 = L18_1 .. L19_1
      L18_1 = L13_1[L18_1]
      L18_1 = L18_1.Urls
      L19_1 = pairs
      L20_1 = L18_1
      L19_1, L20_1, L21_1 = L19_1(L20_1)
      for L22_1, L23_1 in L19_1, L20_1, L21_1 do
        L24_1 = L23_1.BadUrlRep
        if L24_1 then
          L5_1.Remediation_Reason = "BadUrlRep"
          L5_1.Concrete = true
          break
        end
      end
      L19_1 = "Evidence_L"
      L20_1 = L17_1
      L19_1 = L19_1 .. L20_1
      L19_1 = L13_1[L19_1]
      L19_1 = L19_1.MultilayerEncoding
      if L19_1 then
        L19_1 = mp
        L19_1 = L19_1.set_mpattribute
        L20_1 = "HSTR:PFApps_MultilayerEncoded_B"
        L19_1(L20_1)
      end
    end
  end
end
L14_1 = L11_1.Score
if 45 < L14_1 then
  L14_1 = L5_1.Remediation_Reason
  L15_1 = ";"
  L16_1 = "HighScore"
  L14_1 = L14_1 .. L15_1 .. L16_1
  L5_1.Remediation_Reason = L14_1
end
if L13_1 then
  L14_1 = L13_1.Evidence_L1
  if L14_1 then
    L14_1 = L13_1.Evidence_L1
    L15_1 = L14_1.MultilayerEncoding
    if L15_1 then
      L15_1 = L5_1.Remediation_Reason
      L16_1 = ";"
      L17_1 = "MultilayerEncoding"
      L15_1 = L15_1 .. L16_1 .. L17_1
      L5_1.Remediation_Reason = L15_1
    end
  end
end
L14_1 = mp
L14_1 = L14_1.enum_mpattributesubstring
L15_1 = "Appomaly_HighlySuspCmd_Pattern_"
L14_1 = L14_1(L15_1)
if L14_1 then
  L15_1 = #L14_1
  if 0 < L15_1 then
    L15_1 = mp
    L15_1 = L15_1.set_mpattribute
    L16_1 = "HSTR:PFApps_SuspPatterns_encoded3"
    L15_1(L16_1)
    L15_1 = L5_1.Remediation_Reason
    L16_1 = ";"
    L17_1 = "SuspPattern"
    L15_1 = L15_1 .. L16_1 .. L17_1
    L5_1.Remediation_Reason = L15_1
  end
end
L15_1 = mp
L15_1 = L15_1.enum_mpattributesubstring
L16_1 = "Appomaly_SuspUrl_Found"
L15_1 = L15_1(L16_1)
L14_1 = L15_1
if L14_1 then
  L15_1 = #L14_1
  if 0 < L15_1 then
    L15_1 = mp
    L15_1 = L15_1.set_mpattribute
    L16_1 = "HSTR:PFApps_HighlySuspUrl"
    L15_1(L16_1)
    L15_1 = L5_1.Remediation_Reason
    L16_1 = ";"
    L17_1 = "SuspUrl"
    L15_1 = L15_1 .. L16_1 .. L17_1
    L5_1.Remediation_Reason = L15_1
  end
end
L15_1 = mp
L15_1 = L15_1.enum_mpattributesubstring
L16_1 = "Appomaly_"
L15_1 = L15_1(L16_1)
L14_1 = L15_1
if L14_1 then
  L15_1 = #L14_1
  if 0 < L15_1 then
    L15_1 = table_dedup
    L16_1 = L14_1
    L15_1 = L15_1(L16_1)
    L5_1.Attributes = L15_1
  end
end
L15_1 = {}
L16_1 = 0
L17_1 = ipairs
L18_1 = L5_1.Parents
L17_1, L18_1, L19_1 = L17_1(L18_1)
for L20_1, L21_1 in L17_1, L18_1, L19_1 do
  L22_1 = IsFileRecentlyDropped
  L23_1 = L21_1.ImagePath
  L22_1, L23_1, L24_1 = L22_1(L23_1)
  if L22_1 then
    L25_1 = table
    L25_1 = L25_1.insert
    L26_1 = L15_1
    L27_1 = L24_1
    L25_1(L26_1, L27_1)
    L16_1 = L16_1 + L23_1
  end
end
L5_1.RecentlyDroppedParents = L15_1
L5_1.ParentScore = L16_1
L17_1 = safeJsonSerialize
L18_1 = L5_1
L19_1 = 150
L20_1 = nil
L21_1 = true
L17_1, L18_1 = L17_1(L18_1, L19_1, L20_1, L21_1)
if L17_1 then
  L19_1 = set_research_data
  L20_1 = "Evidence"
  L21_1 = MpCommon
  L21_1 = L21_1.Base64Encode
  L22_1 = L17_1
  L21_1 = L21_1(L22_1)
  L22_1 = false
  L19_1(L20_1, L21_1, L22_1)
  L19_1 = MpCommon
  L19_1 = L19_1.BmTriggerSig
  L20_1 = L0_1.ppid
  L21_1 = "SuspDownload3_BM_Capture"
  L22_1 = L17_1
  L19_1(L20_1, L21_1, L22_1)
elseif L18_1 then
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
L19_1 = mp
L19_1 = L19_1.CLEAN
return L19_1
