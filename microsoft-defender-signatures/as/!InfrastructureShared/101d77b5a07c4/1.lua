local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1
L0_1 = mp
L0_1 = L0_1.GetScannedPPID
L0_1 = L0_1()
if L0_1 == "" or L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = {}
L2_1 = mp
L2_1 = L2_1.GetParentProcInfo
L2_1 = L2_1()
L3_1 = GetAppomalyProcessAttribute
L4_1 = L2_1.ppid
L3_1, L4_1 = L3_1(L4_1)
if not L3_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = safeJsonDeserialize
L6_1 = L4_1
L5_1 = L5_1(L6_1)
if not L5_1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = L5_1.AppName
L7_1 = L5_1.Pid
if not L7_1 or not L6_1 then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L8_1 = add_parents_mp
L8_1 = L8_1()
L1_1.Parents = L8_1
L1_1.AppName = L6_1
L9_1 = L5_1.AppCategory
L1_1.AppCategory = L9_1
L9_1 = mp
L9_1 = L9_1.GetProcessCommandLine
L10_1 = L0_1
L9_1 = L9_1(L10_1)
if not L9_1 then
  L10_1 = mp
  L10_1 = L10_1.CLEAN
  return L10_1
end
L10_1 = mp
L10_1 = L10_1.hstr_full_log
L10_1 = L10_1()
if L10_1 then
  L11_1 = L10_1[2]
  L11_1 = L11_1.matched
  if not L11_1 then
    L11_1 = L10_1[3]
    L11_1 = L11_1.matched
    if not L11_1 then
      goto lbl_76
    end
  end
  L11_1 = hasBase64Content
  L12_1 = L9_1
  L11_1 = L11_1(L12_1)
  if not L11_1 then
    L11_1 = mp
    L11_1 = L11_1.CLEAN
    return L11_1
  end
end
::lbl_76::
L11_1 = Base64Grader
L12_1 = L9_1
L11_1, L12_1 = L11_1(L12_1)
L13_1 = mp
L13_1 = L13_1.enum_mpattributesubstring
L14_1 = "Appomaly_BadUrlRep_Found"
L13_1 = L13_1(L14_1)
if L13_1 then
  L14_1 = #L13_1
  if 0 < L14_1 then
    L14_1 = mp
    L14_1 = L14_1.set_mpattribute
    L15_1 = "HSTR:PFApps_MaliciousCMD_B"
    L14_1(L15_1)
    L14_1 = mp
    L14_1 = L14_1.CLEAN
    return L14_1
  end
end
if L12_1 then
  L14_1 = L12_1.Score
  if L14_1 ~= 0 then
    goto lbl_103
  end
end
L14_1 = mp
L14_1 = L14_1.CLEAN
do return L14_1 end
::lbl_103::
L14_1 = CommandlineMLScore
L14_1 = L14_1()
L12_1.ML_score = L14_1
L1_1.Base64GradingInfo = L12_1
L14_1 = mp
L14_1 = L14_1.get_mpattribute
L15_1 = "MpCmdLineFoundB64"
L14_1 = L14_1(L15_1)
if L14_1 then
  L1_1.MpCmdLineFoundB64 = true
else
  L1_1.MpCmdLineFoundB64 = false
end
L14_1 = L12_1.Evidence_L1
if L14_1 then
  L14_1 = L12_1.Evidence_L1
  L14_1 = L14_1.MultilayerEncoding
  if not L14_1 then
    L14_1 = L12_1.Evidence_L1
    L14_1 = L14_1.Obfuscated_FailedToDecode
    if not L14_1 then
      goto lbl_232
    end
  end
  L14_1 = L12_1.Score
  if 0 < L14_1 then
    L14_1 = false
    L15_1 = parent_mp_contains
    L16_1 = L8_1
    L17_1 = "GoogleUpdate.exe"
    L15_1 = L15_1(L16_1, L17_1)
    if not L15_1 then
      L15_1 = parent_mp_contains
      L16_1 = L8_1
      L17_1 = "svchost.exe"
      L15_1 = L15_1(L16_1, L17_1)
      if not L15_1 then
        L15_1 = parent_mp_contains
        L16_1 = L8_1
        L17_1 = "winrshost.exe"
        L15_1 = L15_1(L16_1, L17_1)
        if not L15_1 then
          L15_1 = parent_mp_contains
          L16_1 = L8_1
          L17_1 = "services.exe"
          L15_1 = L15_1(L16_1, L17_1)
          if not L15_1 then
            goto lbl_156
          end
        end
      end
    end
    L14_1 = true
    ::lbl_156::
    L15_1 = mp
    L15_1 = L15_1.get_mpattribute
    L16_1 = "Appomaly_Pattern_Obfuscated"
    L15_1 = L15_1(L16_1)
    if not L15_1 then
      L15_1 = L12_1.Evidence_L2
      if L15_1 then
        L15_1 = L12_1.Evidence_L2
        L15_1 = L15_1.Score
        if L15_1 <= 5 then
          L15_1 = next
          L16_1 = L12_1.Evidence_L1
          L16_1 = L16_1.Urls
          L15_1 = L15_1(L16_1)
          if not L15_1 then
            L15_1 = L12_1.Evidence_L2
            L15_1 = L15_1.MultilayerEncoding
            if not L15_1 then
              L15_1 = L12_1.Evidence_L2
              L15_1 = L15_1.Obfuscated_FailedToDecode
              if not L15_1 then
                L14_1 = true
              end
            end
          end
        end
      end
    end
    L15_1 = L12_1.Evidence_L2
    if L15_1 then
      L15_1 = L12_1.Evidence_L2
      L15_1 = L15_1.CommandlineTokens
      if L15_1 then
        L15_1 = L12_1.Evidence_L2
        L15_1 = L15_1.CommandlineTokens
        L16_1 = table_contains
        L17_1 = L15_1
        L18_1 = "googleupdate"
        L19_1 = true
        L16_1 = L16_1(L17_1, L18_1, L19_1)
        if not L16_1 then
          L16_1 = table_contains
          L17_1 = L15_1
          L18_1 = "[scriptblock]::create($split_parts[0])&$exec_wrapper"
          L19_1 = true
          L16_1 = L16_1(L17_1, L18_1, L19_1)
          if not L16_1 then
            goto lbl_208
          end
        end
        L14_1 = true
      end
    end
    ::lbl_208::
    if not L14_1 then
      L15_1 = safeJsonSerialize
      L16_1 = L12_1
      L17_1 = 150
      L18_1 = nil
      L19_1 = true
      L15_1, L16_1 = L15_1(L16_1, L17_1, L18_1, L19_1)
      L17_1 = L12_1.Evidence_L1
      L17_1 = L17_1.MultilayerEncoding
      if L17_1 then
        L17_1 = "Appomaly_MultilayerEncoded_Tracked"
        if L17_1 then
          goto lbl_224
        end
      end
      L17_1 = "Appomaly_Encoded_Obfuscated_Tracked"
      ::lbl_224::
      L18_1 = MpCommon
      L18_1 = L18_1.BmTriggerSig
      L19_1 = L2_1.ppid
      L20_1 = L17_1
      L21_1 = L15_1 or L21_1
      if not L15_1 then
        L21_1 = L16_1
      end
      L18_1(L19_1, L20_1, L21_1)
    end
  end
end
::lbl_232::
L14_1 = L12_1.Score
if L14_1 <= 15 then
  L14_1 = next
  L15_1 = L12_1.Evidence_L1
  L15_1 = L15_1.Urls
  L14_1 = L14_1(L15_1)
  if not L14_1 then
    L14_1 = hasTamperingCmd
    L15_1 = L9_1
    L14_1 = L14_1(L15_1)
    if not L14_1 then
      L14_1 = mp
      L14_1 = L14_1.CLEAN
      return L14_1
    end
  end
end
L14_1 = L12_1.Score
if 30 < L14_1 then
  L14_1 = L12_1.CommandlineTokens
  if L14_1 then
    L14_1 = MpCommon
    L14_1 = L14_1.GetImagePathFromPid
    L15_1 = L0_1
    L14_1 = L14_1(L15_1)
    L16_1 = L14_1
    L15_1 = L14_1.match
    L17_1 = "([^\\]+)$"
    L15_1 = L15_1(L16_1, L17_1)
    if not L15_1 then
      L15_1 = ""
    end
    L16_1 = {}
    L16_1.ParentName = L6_1
    L16_1.ProcessName = L15_1
    L16_1.Source = "CMD"
    L16_1.SignatureName = "PFApps.C"
    L17_1 = L12_1.Score
    L16_1.CommandlineScore = L17_1
    L17_1 = L1_1.Base64GradingInfo
    L16_1.CommandlineScoreIndicator = L17_1
    L16_1.AnomalyTableName = "Appomaly_ChildProcName_CmdLine_Base64"
    L17_1 = GetAnomalyTableAge
    L18_1 = "Appomaly_ChildProcName_CmdLine_Base64"
    L17_1 = L17_1(L18_1)
    L16_1.TableAge = L17_1
    L16_1.AttributeName = "PFApp_Parent"
    L16_1.AttributeCategory = "PFServers"
    L17_1 = L6_1
    L18_1 = ";"
    L19_1 = L15_1
    L20_1 = ";"
    L21_1 = table
    L21_1 = L21_1.concat
    L22_1 = L12_1.CommandlineTokens
    L23_1 = "|"
    L21_1 = L21_1(L22_1, L23_1)
    L17_1 = L17_1 .. L18_1 .. L19_1 .. L20_1 .. L21_1
    L18_1 = AnomalyTableCheck
    L19_1 = "Appomaly_ChildProcName_CmdLine"
    L20_1 = L17_1
    L21_1 = 30
    L18_1, L19_1, L20_1 = L18_1(L19_1, L20_1, L21_1)
    if L18_1 == false and L19_1 == false then
      L21_1 = mp
      L21_1 = L21_1.CLEAN
      return L21_1
    elseif L18_1 and not L19_1 then
      L21_1 = IsPotentiallyClean
      L22_1 = "CmdLine"
      L23_1 = L6_1
      L24_1 = ";"
      L25_1 = L15_1
      L23_1 = L23_1 .. L24_1 .. L25_1
      L24_1 = L12_1.CommandlineTokens
      L21_1, L22_1, L23_1 = L21_1(L22_1, L23_1, L24_1)
      if L21_1 then
        L1_1.IsPotentiallyClean = L22_1
      end
      L24_1 = MpCommon
      L24_1 = L24_1.BmTriggerSig
      L25_1 = L2_1.ppid
      L26_1 = "AnomalousChildCommandline"
      L27_1 = safeJsonSerialize
      L28_1 = L16_1
      L27_1, L28_1 = L27_1(L28_1)
      L24_1(L25_1, L26_1, L27_1, L28_1)
    end
  end
  L14_1 = startTrackingApp
  L15_1 = L7_1
  L16_1 = L6_1
  L17_1 = "PFServers"
  L18_1 = "PFApp_Parent"
  L14_1, L15_1 = L14_1(L15_1, L16_1, L17_1, L18_1)
  if not L14_1 then
    L15_1.SignatureName = "PFApps.C"
    L16_1 = MpCommon
    L16_1 = L16_1.BmTriggerSig
    L17_1 = L7_1
    L18_1 = "ProcAttribError"
    L19_1 = safeJsonSerialize
    L20_1 = L15_1
    L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1 = L19_1(L20_1)
    L16_1(L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1)
  else
    L16_1 = "Base64Cmd_child["
    L18_1 = L0_1
    L17_1 = L0_1.match
    L19_1 = "pid:(%d+)"
    L17_1 = L17_1(L18_1, L19_1)
    L18_1 = "][cmd/PFApps.C]"
    L16_1 = L16_1 .. L17_1 .. L18_1
    L17_1 = {}
    L18_1 = MpCommon
    L18_1 = L18_1.GetImagePathFromPid
    L19_1 = L0_1
    L18_1 = L18_1(L19_1)
    L17_1.ProcessName = L18_1
    L18_1 = MpCommon
    L18_1 = L18_1.IsFriendlyProcess
    L19_1 = L0_1
    L18_1 = L18_1(L19_1)
    L17_1.IsProcessFriendly = L18_1
    L17_1.Pid = L0_1
    L18_1 = L1_1.Base64GradingInfo
    L17_1.Base64GradingInfo = L18_1
    L18_1 = L12_1.Score
    L17_1.IndicatorScore = L18_1
    L17_1.Parents = L8_1
    L18_1 = IncreaseProcessAnomalyScore
    L19_1 = L2_1.ppid
    L20_1 = L12_1.Score
    L21_1 = L16_1
    L22_1 = "PFApp_Parent"
    L23_1 = L17_1
    L18_1(L19_1, L20_1, L21_1, L22_1, L23_1)
    L18_1 = next
    L19_1 = L15_1
    L18_1 = L18_1(L19_1)
    if L18_1 then
      L18_1 = L15_1.IsNewApp
      if L18_1 then
        L15_1.SignatureName = "PFApps.C"
        L18_1 = L12_1.Score
        L15_1.Score = L18_1
        L18_1 = MpCommon
        L18_1 = L18_1.BmTriggerSig
        L19_1 = L7_1
        L20_1 = "SetProcessAttrib"
        L21_1 = safeJsonSerialize
        L22_1 = L15_1
        L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1 = L21_1(L22_1)
        L18_1(L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1)
      end
    end
  end
end
L1_1.Concrete = false
L1_1.Remediation_Reason = ""
L14_1 = L1_1.Base64GradingInfo
L15_1 = 1
L16_1 = 3
L17_1 = 1
for L18_1 = L15_1, L16_1, L17_1 do
  if L14_1 then
    L19_1 = "Evidence_L"
    L20_1 = L18_1
    L19_1 = L19_1 .. L20_1
    L19_1 = L14_1[L19_1]
    if L19_1 then
      L19_1 = "Evidence_L"
      L20_1 = L18_1
      L19_1 = L19_1 .. L20_1
      L19_1 = L14_1[L19_1]
      L19_1 = L19_1.Urls
      L20_1 = pairs
      L21_1 = L19_1
      L20_1, L21_1, L22_1 = L20_1(L21_1)
      for L23_1, L24_1 in L20_1, L21_1, L22_1 do
        L25_1 = L24_1.BadUrlRep
        if L25_1 then
          L1_1.Remediation_Reason = "BadUrlRep"
          L1_1.Concrete = true
          break
        end
      end
      L20_1 = "Evidence_L"
      L21_1 = L18_1
      L20_1 = L20_1 .. L21_1
      L20_1 = L14_1[L20_1]
      L20_1 = L20_1.MultilayerEncoding
      if L20_1 then
        L20_1 = mp
        L20_1 = L20_1.set_mpattribute
        L21_1 = "HSTR:PFApps_MultilayerEncoded_A"
        L20_1(L21_1)
        L1_1.Concrete = true
      end
    end
  end
end
L15_1 = next
L16_1 = L12_1.Evidence_L1
L16_1 = L16_1.Urls
L15_1 = L15_1(L16_1)
if not L15_1 then
  L15_1 = mp
  L15_1 = L15_1.CLEAN
  return L15_1
end
L15_1 = L12_1.Score
if 45 < L15_1 then
  L15_1 = L1_1.Remediation_Reason
  L16_1 = ";"
  L17_1 = "HighScore"
  L15_1 = L15_1 .. L16_1 .. L17_1
  L1_1.Remediation_Reason = L15_1
end
if L14_1 then
  L15_1 = L14_1.Evidence_L1
  if L15_1 then
    L15_1 = L14_1.Evidence_L1
    L16_1 = L15_1.MultilayerEncoding
    if L16_1 then
      L16_1 = L1_1.Remediation_Reason
      L17_1 = ";"
      L18_1 = "MultilayerEncoding"
      L16_1 = L16_1 .. L17_1 .. L18_1
      L1_1.Remediation_Reason = L16_1
    end
  end
end
L15_1 = mp
L15_1 = L15_1.enum_mpattributesubstring
L16_1 = "Appomaly_HighlySuspCmd_Pattern_"
L15_1 = L15_1(L16_1)
if L15_1 then
  L16_1 = #L15_1
  if 0 < L16_1 then
    L16_1 = mp
    L16_1 = L16_1.set_mpattribute
    L17_1 = "HSTR:PFApps_SuspPatterns_encoded3"
    L16_1(L17_1)
    L16_1 = L1_1.Remediation_Reason
    L17_1 = ";"
    L18_1 = "SuspPattern"
    L16_1 = L16_1 .. L17_1 .. L18_1
    L1_1.Remediation_Reason = L16_1
  end
end
L16_1 = mp
L16_1 = L16_1.enum_mpattributesubstring
L17_1 = "Appomaly_SuspUrl_Found"
L16_1 = L16_1(L17_1)
L15_1 = L16_1
if L15_1 then
  L16_1 = #L15_1
  if 0 < L16_1 then
    L16_1 = mp
    L16_1 = L16_1.set_mpattribute
    L17_1 = "HSTR:PFApps_HighlySuspUrl"
    L16_1(L17_1)
    L16_1 = L1_1.Remediation_Reason
    L17_1 = ";"
    L18_1 = "SuspUrl"
    L16_1 = L16_1 .. L17_1 .. L18_1
    L1_1.Remediation_Reason = L16_1
  end
end
L16_1 = mp
L16_1 = L16_1.enum_mpattributesubstring
L17_1 = "Appomaly_"
L16_1 = L16_1(L17_1)
L15_1 = L16_1
if L15_1 then
  L16_1 = #L15_1
  if 0 < L16_1 then
    L16_1 = table_dedup
    L17_1 = L15_1
    L16_1 = L16_1(L17_1)
    L1_1.Attributes = L16_1
  end
end
L16_1 = {}
L17_1 = 0
L18_1 = ipairs
L19_1 = L1_1.Parents
L18_1, L19_1, L20_1 = L18_1(L19_1)
for L21_1, L22_1 in L18_1, L19_1, L20_1 do
  L23_1 = IsFileRecentlyDropped
  L24_1 = L22_1.ImagePath
  L23_1, L24_1, L25_1 = L23_1(L24_1)
  if L23_1 then
    L26_1 = table
    L26_1 = L26_1.insert
    L27_1 = L16_1
    L28_1 = L25_1
    L26_1(L27_1, L28_1)
    L17_1 = L17_1 + L24_1
  end
end
L1_1.RecentlyDroppedParents = L16_1
L1_1.ParentScore = L17_1
L18_1 = safeJsonSerialize
L19_1 = L1_1
L20_1 = 150
L21_1 = nil
L22_1 = true
L18_1, L19_1 = L18_1(L19_1, L20_1, L21_1, L22_1)
if L18_1 then
  L20_1 = set_research_data
  L21_1 = "Evidence"
  L22_1 = MpCommon
  L22_1 = L22_1.Base64Encode
  L23_1 = L18_1
  L22_1 = L22_1(L23_1)
  L23_1 = false
  L20_1(L21_1, L22_1, L23_1)
  L20_1 = MpCommon
  L20_1 = L20_1.BmTriggerSig
  L21_1 = L2_1.ppid
  L22_1 = "SuspDownload2_BM_Capture"
  L23_1 = L18_1
  L20_1(L21_1, L22_1, L23_1)
elseif L19_1 then
  L20_1 = set_research_data
  L21_1 = "Error"
  L22_1 = MpCommon
  L22_1 = L22_1.Base64Encode
  L23_1 = L19_1
  L22_1 = L22_1(L23_1)
  L23_1 = false
  L20_1(L21_1, L22_1, L23_1)
  L20_1 = mp
  L20_1 = L20_1.INFECTED
  return L20_1
else
  L20_1 = set_research_data
  L21_1 = "Error"
  L22_1 = "Failed Serialization w/o error"
  L23_1 = false
  L20_1(L21_1, L22_1, L23_1)
end
L20_1 = mp
L20_1 = L20_1.CLEAN
return L20_1
