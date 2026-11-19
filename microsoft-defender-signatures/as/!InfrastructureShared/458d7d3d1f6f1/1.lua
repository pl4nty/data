-- Threat: !InfrastructureShared
-- Name: 458d7d3d1f6f1
-- Type: 21
-- Includes: ResearchData, LuaFuncHelper, AppomalyHelpers, BMLuaLib

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = {}
local l_0_2, l_0_3, l_0_4
local l_0_5, l_0_6 = GetAppomalyProcessAttribute(l_0_0)
if l_0_6 then
  local l_0_7 = safeJsonDeserialize(l_0_6)
  if l_0_7 then
    l_0_2 = l_0_7.AppName
    l_0_3 = l_0_7.Pid
    l_0_4 = l_0_7.AppCategory
  end
else
  local l_0_8
  l_0_8, l_0_2, l_0_3 = isInstalledApp(l_0_0)
  l_0_4 = l_0_8 and "programfiles"
end
l_0_1.AppName = l_0_2
l_0_1.AppCategory = l_0_4
local l_0_9 = mp.hstr_full_log()
local l_0_10 = mp.GetProcessCommandLine(l_0_0)
if l_0_9 and (l_0_9[1].matched or l_0_9[2].matched or mp.HSTR_WEIGHT > 30) then
  local l_0_11 = false
  if l_0_2 then
    l_0_11 = true
  end
  local l_0_12, l_0_13 = CommandLineGrader(l_0_10, l_0_11, 2)
  local l_0_14 = mp.GetParentProcInfo()
  local l_0_15 = MpCommon.GetImagePathFromPid(l_0_14.ppid) or ""
  local l_0_16 = mp.enum_mpattributesubstring("Appomaly_BadUrlRep_Found")
  if l_0_16 and 0 < #l_0_16 then
    mp.set_mpattribute("HSTR:PFApps_MaliciousCMD_A")
    MpCommon.BmTriggerSig(l_0_14.ppid, "BM_PFApps_MaliciousCMD_A", safeJsonSerialize(l_0_13) or "")
  end
  if not l_0_12 or l_0_12 < 20 then
    return mp.CLEAN
  end
  if not l_0_13 or not next(l_0_13) then
    return mp.CLEAN
  end
  if (not l_0_13.Evidence_L1 or not next(l_0_13.Evidence_L1.Urls)) and not hasTamperingCmd(l_0_10) then
    return mp.CLEAN
  end
  l_0_13.ML_score = CommandlineMLScore()
  l_0_1.CmdGradingInfo = l_0_13
  l_0_1.Score = l_0_12
  l_0_1.Parents = add_parents_mp()
  l_0_1.CurrentProcess = MpCommon.GetImagePathFromPid(l_0_0)
  if 0 < l_0_13.ML_score and l_0_13.ML_score + l_0_12 > 170 then
    mp.set_mpattribute("HSTR:PFApps_MaliciousCMD_ML_B")
  end
  AppendToRollingQueue("PFApp_PotentialDownload_Ppid", l_0_14.ppid, safeJsonSerialize(l_0_13), 300, 500, 0)
  if 20 <= l_0_12 then
    local l_0_17 = l_0_15:match("([^\\]+)$") or ""
    local l_0_18 = MpCommon.GetImagePathFromPid(l_0_0)
    local l_0_19 = l_0_18:match("([^\\]+)$") or ""
    local l_0_20 = l_0_13.CommandlineTokens
    if l_0_20 and l_0_2 then
      local l_0_21 = {}
      l_0_21.ParentName = l_0_2
      l_0_21.ProcessName = l_0_19
      l_0_21.Source = "CMD"
      l_0_21.SignatureName = "PFApps.A"
      l_0_21.CommandlineScore = l_0_1.Score
      l_0_21.CommandlineScoreIndicator = l_0_1.CmdGradingInfo
      l_0_21.AnomalyTableName = "Appomaly_ChildProcName_CmdLine"
      l_0_21.TableAge = GetAnomalyTableAge("Appomaly_ChildProcName_CmdLine")
      local l_0_22 = l_0_2 .. ";" .. l_0_19 .. ";" .. table.concat(l_0_20, "|")
      local l_0_23, l_0_24, l_0_25 = AnomalyTableCheck("Appomaly_ChildProcName_CmdLine", l_0_22, 30)
      if l_0_23 == false and l_0_24 == false then
        return mp.CLEAN
      elseif l_0_23 and not l_0_24 then
        local l_0_26, l_0_27, l_0_28 = IsPotentiallyClean("CmdLine", l_0_2 .. ";" .. l_0_19, l_0_20)
        if l_0_26 then
          l_0_1.IsPotentiallyClean = l_0_27
        end
        MpCommon.BmTriggerSig(l_0_14.ppid, "AnomalousChildCommandline", safeJsonSerialize(l_0_21))
      end
      local l_0_29 = l_0_4 or "generic"
      local l_0_30 = l_0_3 or l_0_14.ppid
      local l_0_31, l_0_32 = startTrackingApp(l_0_30, l_0_2 or l_0_17, l_0_29)
      if not l_0_31 then
        l_0_32.SignatureName = "PFApps.A"
        MpCommon.BmTriggerSig(l_0_30, "ProcAttribError", safeJsonSerialize(l_0_32))
      else
        local l_0_33 = "SuspDownload[" .. l_0_0:match("pid:(%d+)") .. "][CMD/PFApps.A]"
        local l_0_34 = {}
        l_0_34.ProcessName = l_0_18
        l_0_34.IsProcessFriendly = MpCommon.IsFriendlyProcess(l_0_0)
        l_0_34.Pid = l_0_0
        l_0_34.CmdGradingInfo = l_0_1.CmdGradingInfo
        l_0_34.IndicatorScore = l_0_12
        l_0_34.Parents = l_0_1.Parents
        IncreaseProcessAnomalyScore(l_0_14.ppid, l_0_12, l_0_33, l_0_5, l_0_34)
        if next(l_0_32) and l_0_32.IsNewApp then
          l_0_32.SignatureName = "PFApps.A"
          l_0_32.Score = l_0_12
          MpCommon.BmTriggerSig(l_0_30, "SetProcessAttrib", safeJsonSerialize(l_0_32))
        end
      end
    else
      local l_0_35 = l_0_17 .. ";" .. l_0_19 .. ";" .. table.concat(l_0_20, "|")
      local l_0_36, l_0_37, l_0_38 = AnomalyTableCheck("Appomaly_Global_CmdLine", l_0_35, 20)
      if l_0_36 == false and l_0_37 == false then
        return mp.CLEAN
      elseif l_0_36 and not l_0_37 then
        local l_0_39, l_0_40, l_0_41 = IsPotentiallyClean("CmdLine", l_0_17 .. ";" .. l_0_19, l_0_20)
        if l_0_39 then
          l_0_1.IsPotentiallyClean = l_0_40
        end
        l_0_1.AnomalousCMD_Cached = true
        l_0_1.AnomalousCMD_Cached_TblInfo = l_0_38
      end
    end
  end
  l_0_1.Concrete = false
  l_0_1.Remediation_Reason = ""
  local l_0_42 = l_0_1.CmdGradingInfo
  if l_0_42 and l_0_42.Evidence_L1 then
    local l_0_43 = l_0_42.Evidence_L1.Urls
    for l_0_44, l_0_45 in pairs(l_0_43) do
      if l_0_45.BadUrlRep then
        l_0_1.Remediation_Reason = "BadUrlRep"
        l_0_1.Concrete = true
        break
      end
    end
  end
  if l_0_1.Score > 45 then
    l_0_1.Remediation_Reason = l_0_1.Remediation_Reason .. ";" .. "HighScore"
  else
    return mp.CLEAN
  end
  l_0_16 = mp.enum_mpattributesubstring("Appomaly_HighlySuspCmd_Pattern_")
  if l_0_16 and 0 < #l_0_16 then
    mp.set_mpattribute("HSTR:PFApps_SuspPatterns3")
    l_0_1.Remediation_Reason = l_0_1.Remediation_Reason .. ";" .. "SuspPattern"
  end
  l_0_16 = mp.enum_mpattributesubstring("Appomaly_SuspUrl_Found")
  if l_0_16 and 0 < #l_0_16 then
    mp.set_mpattribute("HSTR:PFApps_HighlySuspUrl")
    local l_0_46 = {
      "WebLogic",
      "sqlservr",
      "tomcat",
      "w3wp.exe",
      "hfs.exe",
      "httpd.exe"
    }
    if l_0_2 and #l_0_42.CommandlineTokens < 6 and contains(l_0_2, l_0_46) then
      mp.set_mpattribute("HSTR:PFApps_HighlySuspUrl_B")
      l_0_1.Remediation_Reason = l_0_1.Remediation_Reason .. ";" .. "SuspUrl_ToBlock"
    else
      l_0_1.Remediation_Reason = l_0_1.Remediation_Reason .. ";" .. "SuspUrl"
    end
  end
  l_0_16 = mp.enum_mpattributesubstring("Appomaly_")
  if l_0_16 and 0 < #l_0_16 then
    l_0_1.Attributes = table_dedup(l_0_16)
  end
  local l_0_47 = GetExecutablesFromParentsCommandLine()
  local l_0_48 = {}
  local l_0_49 = 0
  for l_0_50, l_0_51 in ipairs(l_0_47) do
    local l_0_52, l_0_53, l_0_54 = IsFileRecentlyDropped(l_0_51)
    if l_0_52 then
      table.insert(l_0_48, l_0_54)
      l_0_49 = l_0_49 + l_0_53
    end
    l_0_52, l_0_54 = IsFileDroppedByTrackedApp(l_0_51)
    if l_0_52 then
      table.insert(l_0_48, l_0_54)
      l_0_49 = l_0_49 + 10
    end
  end
  l_0_1.RecentlyDroppedParents = l_0_48
  l_0_1.ParentScore = l_0_49
  local l_0_55, l_0_56 = safeJsonSerialize(l_0_1, 150, nil, true)
  if l_0_55 then
    MpCommon.BmTriggerSig(l_0_14.ppid, "SuspDownload_BM_Capture", l_0_55)
  elseif l_0_56 then
    set_research_data("Error", MpCommon.Base64Encode(l_0_56), false)
    return mp.INFECTED
  end
end
return mp.CLEAN
