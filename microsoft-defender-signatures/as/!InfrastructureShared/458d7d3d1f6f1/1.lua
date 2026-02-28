local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1
L0_1 = mp
L0_1 = L0_1.GetScannedPPID
L0_1 = L0_1()
if L0_1 == "" or L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = {}
L2_1 = nil
L3_1 = nil
L4_1 = nil
L5_1 = GetAppomalyProcessAttribute
L6_1 = L0_1
L5_1, L6_1 = L5_1(L6_1)
if L6_1 then
  L7_1 = safeJsonDeserialize
  L8_1 = L6_1
  L7_1 = L7_1(L8_1)
  if L7_1 then
    L2_1 = L7_1.AppName
    L3_1 = L7_1.Pid
    L4_1 = L7_1.AppCategory
  end
else
  L7_1 = nil
  L8_1 = isInstalledApp
  L9_1 = L0_1
  L8_1, L9_1, L10_1 = L8_1(L9_1)
  L3_1 = L10_1
  L2_1 = L9_1
  L7_1 = L8_1
  L4_1 = L7_1 or L4_1
  if L7_1 then
    L4_1 = "programfiles"
  end
end
L1_1.AppName = L2_1
L1_1.AppCategory = L4_1
L7_1 = mp
L7_1 = L7_1.hstr_full_log
L7_1 = L7_1()
L8_1 = mp
L8_1 = L8_1.GetProcessCommandLine
L9_1 = L0_1
L8_1 = L8_1(L9_1)
if L7_1 then
  L9_1 = L7_1[1]
  L9_1 = L9_1.matched
  if not L9_1 then
    L9_1 = L7_1[2]
    L9_1 = L9_1.matched
    if not L9_1 then
      L9_1 = mp
      L9_1 = L9_1.HSTR_WEIGHT
      if not (30 < L9_1) then
        goto lbl_544
      end
    end
  end
  L9_1 = false
  if L2_1 then
    L9_1 = true
  end
  L10_1 = CommandLineGrader
  L11_1 = L8_1
  L12_1 = L9_1
  L13_1 = 2
  L10_1, L11_1 = L10_1(L11_1, L12_1, L13_1)
  L12_1 = mp
  L12_1 = L12_1.GetParentProcInfo
  L12_1 = L12_1()
  L13_1 = MpCommon
  L13_1 = L13_1.GetImagePathFromPid
  L14_1 = L12_1.ppid
  L13_1 = L13_1(L14_1)
  if not L13_1 then
    L13_1 = ""
  end
  L14_1 = mp
  L14_1 = L14_1.enum_mpattributesubstring
  L15_1 = "Appomaly_BadUrlRep_Found"
  L14_1 = L14_1(L15_1)
  if L14_1 then
    L15_1 = #L14_1
    if 0 < L15_1 then
      L15_1 = mp
      L15_1 = L15_1.set_mpattribute
      L16_1 = "HSTR:PFApps_MaliciousCMD_A"
      L15_1(L16_1)
      L15_1 = MpCommon
      L15_1 = L15_1.BmTriggerSig
      L16_1 = L12_1.ppid
      L17_1 = "BM_PFApps_MaliciousCMD_A"
      L18_1 = safeJsonSerialize
      L19_1 = L11_1
      L18_1 = L18_1(L19_1)
      if not L18_1 then
        L18_1 = ""
      end
      L15_1(L16_1, L17_1, L18_1)
    end
  end
  if not L10_1 or L10_1 < 20 then
    L15_1 = mp
    L15_1 = L15_1.CLEAN
    return L15_1
  end
  if L11_1 then
    L15_1 = next
    L16_1 = L11_1
    L15_1 = L15_1(L16_1)
    if L15_1 then
      goto lbl_120
    end
  end
  L15_1 = mp
  L15_1 = L15_1.CLEAN
  do return L15_1 end
  ::lbl_120::
  L15_1 = L11_1.Evidence_L1
  if L15_1 then
    L15_1 = next
    L16_1 = L11_1.Evidence_L1
    L16_1 = L16_1.Urls
    L15_1 = L15_1(L16_1)
    if L15_1 then
      goto lbl_137
    end
  end
  L15_1 = hasTamperingCmd
  L16_1 = L8_1
  L15_1 = L15_1(L16_1)
  if not L15_1 then
    L15_1 = mp
    L15_1 = L15_1.CLEAN
    return L15_1
  end
  ::lbl_137::
  L15_1 = CommandlineMLScore
  L15_1 = L15_1()
  L11_1.ML_score = L15_1
  L1_1.CmdGradingInfo = L11_1
  L1_1.Score = L10_1
  L15_1 = add_parents_mp
  L15_1 = L15_1()
  L1_1.Parents = L15_1
  L15_1 = MpCommon
  L15_1 = L15_1.GetImagePathFromPid
  L16_1 = L0_1
  L15_1 = L15_1(L16_1)
  L1_1.CurrentProcess = L15_1
  L15_1 = L11_1.ML_score
  if 0 < L15_1 then
    L15_1 = L11_1.ML_score
    L15_1 = L15_1 + L10_1
    if 170 < L15_1 then
      L15_1 = mp
      L15_1 = L15_1.set_mpattribute
      L16_1 = "HSTR:PFApps_MaliciousCMD_ML_B"
      L15_1(L16_1)
    end
  end
  L15_1 = AppendToRollingQueue
  L16_1 = "PFApp_PotentialDownload_Ppid"
  L17_1 = L12_1.ppid
  L18_1 = safeJsonSerialize
  L19_1 = L11_1
  L18_1 = L18_1(L19_1)
  L19_1 = 300
  L20_1 = 500
  L21_1 = 0
  L15_1(L16_1, L17_1, L18_1, L19_1, L20_1, L21_1)
  if 20 <= L10_1 then
    L16_1 = L13_1
    L15_1 = L13_1.match
    L17_1 = "([^\\]+)$"
    L15_1 = L15_1(L16_1, L17_1)
    if not L15_1 then
      L15_1 = ""
    end
    L16_1 = MpCommon
    L16_1 = L16_1.GetImagePathFromPid
    L17_1 = L0_1
    L16_1 = L16_1(L17_1)
    L18_1 = L16_1
    L17_1 = L16_1.match
    L19_1 = "([^\\]+)$"
    L17_1 = L17_1(L18_1, L19_1)
    if not L17_1 then
      L17_1 = ""
    end
    L18_1 = L11_1.CommandlineTokens
    if L18_1 and L2_1 then
      L19_1 = {}
      L19_1.ParentName = L2_1
      L19_1.ProcessName = L17_1
      L19_1.Source = "CMD"
      L19_1.SignatureName = "PFApps.A"
      L20_1 = L1_1.Score
      L19_1.CommandlineScore = L20_1
      L20_1 = L1_1.CmdGradingInfo
      L19_1.CommandlineScoreIndicator = L20_1
      L19_1.AnomalyTableName = "Appomaly_ChildProcName_CmdLine"
      L20_1 = GetAnomalyTableAge
      L21_1 = "Appomaly_ChildProcName_CmdLine"
      L20_1 = L20_1(L21_1)
      L19_1.TableAge = L20_1
      L20_1 = L2_1
      L21_1 = ";"
      L22_1 = L17_1
      L23_1 = ";"
      L24_1 = table
      L24_1 = L24_1.concat
      L25_1 = L18_1
      L26_1 = "|"
      L24_1 = L24_1(L25_1, L26_1)
      L20_1 = L20_1 .. L21_1 .. L22_1 .. L23_1 .. L24_1
      L21_1 = AnomalyTableCheck
      L22_1 = "Appomaly_ChildProcName_CmdLine"
      L23_1 = L20_1
      L24_1 = 30
      L21_1, L22_1, L23_1 = L21_1(L22_1, L23_1, L24_1)
      if L21_1 == false and L22_1 == false then
        L24_1 = mp
        L24_1 = L24_1.CLEAN
        return L24_1
      elseif L21_1 and not L22_1 then
        L24_1 = IsPotentiallyClean
        L25_1 = "CmdLine"
        L26_1 = L2_1
        L27_1 = ";"
        L28_1 = L17_1
        L26_1 = L26_1 .. L27_1 .. L28_1
        L27_1 = L18_1
        L24_1, L25_1, L26_1 = L24_1(L25_1, L26_1, L27_1)
        if L24_1 then
          L1_1.IsPotentiallyClean = L25_1
        end
        L27_1 = MpCommon
        L27_1 = L27_1.BmTriggerSig
        L28_1 = L12_1.ppid
        L29_1 = "AnomalousChildCommandline"
        L30_1 = safeJsonSerialize
        L31_1 = L19_1
        L30_1, L31_1, L32_1, L33_1, L34_1, L35_1 = L30_1(L31_1)
        L27_1(L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1)
      end
      L24_1 = L4_1 or L24_1
      if not L4_1 then
        L24_1 = "generic"
      end
      L25_1 = L3_1 or L25_1
      if not L3_1 then
        L25_1 = L12_1.ppid
      end
      L26_1 = startTrackingApp
      L27_1 = L25_1
      L28_1 = L2_1 or L28_1
      if not L2_1 then
        L28_1 = L15_1
      end
      L29_1 = L24_1
      L26_1, L27_1 = L26_1(L27_1, L28_1, L29_1)
      if not L26_1 then
        L27_1.SignatureName = "PFApps.A"
        L28_1 = MpCommon
        L28_1 = L28_1.BmTriggerSig
        L29_1 = L25_1
        L30_1 = "ProcAttribError"
        L31_1 = safeJsonSerialize
        L32_1 = L27_1
        L31_1, L32_1, L33_1, L34_1, L35_1 = L31_1(L32_1)
        L28_1(L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1)
      else
        L28_1 = "SuspDownload["
        L30_1 = L0_1
        L29_1 = L0_1.match
        L31_1 = "pid:(%d+)"
        L29_1 = L29_1(L30_1, L31_1)
        L30_1 = "][CMD/PFApps.A]"
        L28_1 = L28_1 .. L29_1 .. L30_1
        L29_1 = {}
        L29_1.ProcessName = L16_1
        L30_1 = MpCommon
        L30_1 = L30_1.IsFriendlyProcess
        L31_1 = L0_1
        L30_1 = L30_1(L31_1)
        L29_1.IsProcessFriendly = L30_1
        L29_1.Pid = L0_1
        L30_1 = L1_1.CmdGradingInfo
        L29_1.CmdGradingInfo = L30_1
        L29_1.IndicatorScore = L10_1
        L30_1 = L1_1.Parents
        L29_1.Parents = L30_1
        L30_1 = IncreaseProcessAnomalyScore
        L31_1 = L12_1.ppid
        L32_1 = L10_1
        L33_1 = L28_1
        L34_1 = L5_1
        L35_1 = L29_1
        L30_1(L31_1, L32_1, L33_1, L34_1, L35_1)
        L30_1 = next
        L31_1 = L27_1
        L30_1 = L30_1(L31_1)
        if L30_1 then
          L30_1 = L27_1.IsNewApp
          if L30_1 then
            L27_1.SignatureName = "PFApps.A"
            L27_1.Score = L10_1
            L30_1 = MpCommon
            L30_1 = L30_1.BmTriggerSig
            L31_1 = L25_1
            L32_1 = "SetProcessAttrib"
            L33_1 = safeJsonSerialize
            L34_1 = L27_1
            L33_1, L34_1, L35_1 = L33_1(L34_1)
            L30_1(L31_1, L32_1, L33_1, L34_1, L35_1)
          end
        end
      end
    else
      L19_1 = L15_1
      L20_1 = ";"
      L21_1 = L17_1
      L22_1 = ";"
      L23_1 = table
      L23_1 = L23_1.concat
      L24_1 = L18_1
      L25_1 = "|"
      L23_1 = L23_1(L24_1, L25_1)
      L19_1 = L19_1 .. L20_1 .. L21_1 .. L22_1 .. L23_1
      L20_1 = AnomalyTableCheck
      L21_1 = "Appomaly_Global_CmdLine"
      L22_1 = L19_1
      L23_1 = 20
      L20_1, L21_1, L22_1 = L20_1(L21_1, L22_1, L23_1)
      if L20_1 == false and L21_1 == false then
        L23_1 = mp
        L23_1 = L23_1.CLEAN
        return L23_1
      elseif L20_1 and not L21_1 then
        L23_1 = IsPotentiallyClean
        L24_1 = "CmdLine"
        L25_1 = L15_1
        L26_1 = ";"
        L27_1 = L17_1
        L25_1 = L25_1 .. L26_1 .. L27_1
        L26_1 = L18_1
        L23_1, L24_1, L25_1 = L23_1(L24_1, L25_1, L26_1)
        if L23_1 then
          L1_1.IsPotentiallyClean = L24_1
        end
        L1_1.AnomalousCMD_Cached = true
        L1_1.AnomalousCMD_Cached_TblInfo = L22_1
      end
    end
  end
  L1_1.Concrete = false
  L1_1.Remediation_Reason = ""
  L15_1 = L1_1.CmdGradingInfo
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
          L1_1.Remediation_Reason = "BadUrlRep"
          L1_1.Concrete = true
          break
        end
      end
    end
  end
  L16_1 = L1_1.Score
  if 45 < L16_1 then
    L16_1 = L1_1.Remediation_Reason
    L17_1 = ";"
    L18_1 = "HighScore"
    L16_1 = L16_1 .. L17_1 .. L18_1
    L1_1.Remediation_Reason = L16_1
  else
    L16_1 = mp
    L16_1 = L16_1.CLEAN
    return L16_1
  end
  L16_1 = mp
  L16_1 = L16_1.enum_mpattributesubstring
  L17_1 = "Appomaly_HighlySuspCmd_Pattern_"
  L16_1 = L16_1(L17_1)
  L14_1 = L16_1
  if L14_1 then
    L16_1 = #L14_1
    if 0 < L16_1 then
      L16_1 = mp
      L16_1 = L16_1.set_mpattribute
      L17_1 = "HSTR:PFApps_SuspPatterns3"
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
  L14_1 = L16_1
  if L14_1 then
    L16_1 = #L14_1
    if 0 < L16_1 then
      L16_1 = mp
      L16_1 = L16_1.set_mpattribute
      L17_1 = "HSTR:PFApps_HighlySuspUrl"
      L16_1(L17_1)
      L16_1 = {}
      L17_1 = "WebLogic"
      L18_1 = "sqlservr"
      L19_1 = "tomcat"
      L20_1 = "w3wp.exe"
      L21_1 = "hfs.exe"
      L22_1 = "httpd.exe"
      L16_1[1] = L17_1
      L16_1[2] = L18_1
      L16_1[3] = L19_1
      L16_1[4] = L20_1
      L16_1[5] = L21_1
      L16_1[6] = L22_1
      if L2_1 then
        L17_1 = L15_1.CommandlineTokens
        L17_1 = #L17_1
        if L17_1 < 6 then
          L17_1 = contains
          L18_1 = L2_1
          L19_1 = L16_1
          L17_1 = L17_1(L18_1, L19_1)
          if L17_1 then
            L17_1 = mp
            L17_1 = L17_1.set_mpattribute
            L18_1 = "HSTR:PFApps_HighlySuspUrl_B"
            L17_1(L18_1)
            L17_1 = L1_1.Remediation_Reason
            L18_1 = ";"
            L19_1 = "SuspUrl_ToBlock"
            L17_1 = L17_1 .. L18_1 .. L19_1
            L1_1.Remediation_Reason = L17_1
        end
      end
      else
        L17_1 = L1_1.Remediation_Reason
        L18_1 = ";"
        L19_1 = "SuspUrl"
        L17_1 = L17_1 .. L18_1 .. L19_1
        L1_1.Remediation_Reason = L17_1
      end
    end
  end
  L16_1 = mp
  L16_1 = L16_1.enum_mpattributesubstring
  L17_1 = "Appomaly_"
  L16_1 = L16_1(L17_1)
  L14_1 = L16_1
  if L14_1 then
    L16_1 = #L14_1
    if 0 < L16_1 then
      L16_1 = table_dedup
      L17_1 = L14_1
      L16_1 = L16_1(L17_1)
      L1_1.Attributes = L16_1
    end
  end
  L16_1 = GetExecutablesFromParentsCommandLine
  L16_1 = L16_1()
  L17_1 = {}
  L18_1 = 0
  L19_1 = ipairs
  L20_1 = L16_1
  L19_1, L20_1, L21_1 = L19_1(L20_1)
  for L22_1, L23_1 in L19_1, L20_1, L21_1 do
    L24_1 = IsFileRecentlyDropped
    L25_1 = L23_1
    L24_1, L25_1, L26_1 = L24_1(L25_1)
    if L24_1 then
      L27_1 = table
      L27_1 = L27_1.insert
      L28_1 = L17_1
      L29_1 = L26_1
      L27_1(L28_1, L29_1)
      L18_1 = L18_1 + L25_1
    end
    L27_1 = IsFileDroppedByTrackedApp
    L28_1 = L23_1
    L27_1, L28_1 = L27_1(L28_1)
    L26_1 = L28_1
    L24_1 = L27_1
    if L24_1 then
      L27_1 = table
      L27_1 = L27_1.insert
      L28_1 = L17_1
      L29_1 = L26_1
      L27_1(L28_1, L29_1)
      L18_1 = L18_1 + 10
    end
  end
  L1_1.RecentlyDroppedParents = L17_1
  L1_1.ParentScore = L18_1
  L19_1 = safeJsonSerialize
  L20_1 = L1_1
  L21_1 = 150
  L22_1 = nil
  L23_1 = true
  L19_1, L20_1 = L19_1(L20_1, L21_1, L22_1, L23_1)
  if L19_1 then
    L21_1 = MpCommon
    L21_1 = L21_1.BmTriggerSig
    L22_1 = L12_1.ppid
    L23_1 = "SuspDownload_BM_Capture"
    L24_1 = L19_1
    L21_1(L22_1, L23_1, L24_1)
  elseif L20_1 then
    L21_1 = set_research_data
    L22_1 = "Error"
    L23_1 = MpCommon
    L23_1 = L23_1.Base64Encode
    L24_1 = L20_1
    L23_1 = L23_1(L24_1)
    L24_1 = false
    L21_1(L22_1, L23_1, L24_1)
    L21_1 = mp
    L21_1 = L21_1.INFECTED
    return L21_1
  end
end
::lbl_544::
L9_1 = mp
L9_1 = L9_1.CLEAN
return L9_1
