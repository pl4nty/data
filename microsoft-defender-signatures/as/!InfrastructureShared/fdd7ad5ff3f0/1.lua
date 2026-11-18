-- Threat: !InfrastructureShared
-- Name: fdd7ad5ff3f0
-- Type: 21
-- Includes: ResearchData, LuaFuncHelper, AppomalyHelpers

local l_0_0 = mp.GetParentProcInfo()
local l_0_1, l_0_2 = GetAppomalyProcessAttribute(l_0_0.ppid)
if l_0_1 then
  return mp.CLEAN
end
local l_0_3 = MpCommon.GetImagePathFromPid(l_0_0.ppid) or ""
local l_0_4 = l_0_3:match("([^\\]+)$") or ""
local l_0_5 = {}
l_0_5.ParentName = l_0_4
local l_0_6 = mp.GetScannedPPID()
if not l_0_6 then
  return mp.CLEAN
end
local l_0_7 = mp.GetProcessCommandLine(l_0_6)
if not l_0_7 then
  return mp.CLEAN
end
local l_0_8 = add_parents_mp()
l_0_5.Parents = l_0_8
local l_0_9 = mp.hstr_full_log()
if l_0_9 and (l_0_9[2].matched or l_0_9[3].matched) and not hasBase64Content(l_0_7) then
  return mp.CLEAN
end
local l_0_10, l_0_11 = Base64Grader(l_0_7)
local l_0_12 = mp.enum_mpattributesubstring("Appomaly_BadUrlRep_Found")
if l_0_12 and 0 < #l_0_12 then
  mp.set_mpattribute("HSTR:PFApps_MaliciousCMD_C")
end
if not l_0_11 then
  return mp.CLEAN
end
l_0_11.ML_score = CommandlineMLScore()
l_0_5.Base64GradingInfo = l_0_11
if mp.get_mpattribute("MpCmdLineFoundB64") then
  l_0_5.MpCmdLineFoundB64 = true
else
  l_0_5.MpCmdLineFoundB64 = false
end
if l_0_11.Evidence_L1 and (l_0_11.Evidence_L1.MultilayerEncoding or l_0_11.Evidence_L1.Obfuscated_FailedToDecode) and 0 < l_0_11.Score then
  local l_0_13 = false
  if parent_mp_contains(l_0_8, "GoogleUpdate.exe") or parent_mp_contains(l_0_8, "svchost.exe") or parent_mp_contains(l_0_8, "winrshost.exe") or parent_mp_contains(l_0_8, "services.exe") then
    l_0_13 = true
  end
  if not mp.get_mpattribute("Appomaly_Pattern_Obfuscated") and l_0_11.Evidence_L2 and l_0_11.Evidence_L2.Score <= 5 and not next(l_0_11.Evidence_L1.Urls) and not l_0_11.Evidence_L2.MultilayerEncoding and not l_0_11.Evidence_L2.Obfuscated_FailedToDecode then
    l_0_13 = true
  end
  if l_0_11.Evidence_L2 and l_0_11.Evidence_L2.CommandlineTokens then
    local l_0_14 = l_0_11.Evidence_L2.CommandlineTokens
    if table_contains(l_0_14, "googleupdate", true) or table_contains(l_0_14, "[scriptblock]::create($split_parts[0])&$exec_wrapper", true) then
      l_0_13 = true
    end
  end
  if not l_0_13 then
    local l_0_15, l_0_16 = safeJsonSerialize(l_0_11, 150, nil, true)
    local l_0_17 = l_0_11.Evidence_L1.MultilayerEncoding and "Appomaly_MultilayerEncoded_Gen" or "Appomaly_Encoded_Obfuscated_Gen"
    MpCommon.BmTriggerSig(l_0_0.ppid, l_0_17, l_0_15 or l_0_16)
  end
end
if l_0_11.Score <= 10 then
  mp.ReportLowfi(l_0_3, 3531094077)
  return mp.CLEAN
elseif not next(l_0_11.Evidence_L1.Urls) then
  return mp.CLEAN
elseif l_0_11.Score > 40 then
  local l_0_18, l_0_19, l_0_20 = isInstalledApp(l_0_6)
  local l_0_21 = MpCommon.GetImagePathFromPid(l_0_6)
  local l_0_22 = l_0_21:match("([^\\]+)$") or ""
  if l_0_19 and l_0_11.CommandlineTokens then
    local l_0_23 = {}
    l_0_23.ParentName = l_0_19
    l_0_23.ProcessName = l_0_22
    l_0_23.Source = "CMD"
    l_0_23.SignatureName = "APML_SuspCommand.A"
    l_0_23.CommandlineScore = l_0_11.Score
    l_0_23.CommandlineScoreIndicator = l_0_5.Base64GradingInfo
    l_0_23.AnomalyTableName = "Appomaly_ChildProcName_CmdLine_Base64"
    l_0_23.TableAge = GetAnomalyTableAge("Appomaly_ChildProcName_CmdLine_Base64")
    local l_0_24 = l_0_19 .. ";" .. l_0_22 .. ";" .. table.concat(l_0_11.CommandlineTokens, "|")
    local l_0_25, l_0_26, l_0_27 = AnomalyTableCheck("Appomaly_ChildProcName_CmdLine", l_0_24, 30)
    if l_0_25 == false and l_0_26 == false then
      return mp.CLEAN
    elseif l_0_25 and not l_0_26 then
      local l_0_28, l_0_29, l_0_30 = IsPotentiallyClean("CmdLine", l_0_19 .. ";" .. l_0_22, l_0_11.CommandlineTokens)
      if l_0_28 then
        l_0_5.IsPotentiallyClean = l_0_29
      end
      MpCommon.BmTriggerSig(l_0_0.ppid, "AnomalousChildCommandline2", safeJsonSerialize(l_0_23))
    end
  else
    local l_0_31 = l_0_4 .. ";" .. l_0_22 .. ";" .. table.concat(l_0_11.CommandlineTokens, "|")
    local l_0_32, l_0_33, l_0_34 = AnomalyTableCheck("Appomaly_Global_CmdLine", l_0_31, 20)
    if l_0_32 == false and l_0_33 == false then
      return mp.CLEAN
    elseif l_0_32 and not l_0_33 then
      l_0_5.AnomalousCMD_Cached = true
      l_0_5.AnomalousCMD_Cached_TblInfo = l_0_34
    end
  end
  local l_0_35 = l_0_19 and "programfiles" or "generic"
  local l_0_36 = l_0_20 or l_0_0.ppid
  local l_0_37, l_0_38 = startTrackingApp(l_0_36, l_0_19 or l_0_4, l_0_35)
  if not l_0_37 then
    l_0_38.SignatureName = "APML_SuspCommand.A"
    MpCommon.BmTriggerSig(l_0_36, "ProcAttribError", safeJsonSerialize(l_0_38))
  elseif next(l_0_38) and l_0_38.IsNewApp then
    l_0_38.SignatureName = "APML_SuspCommand.A"
    l_0_38.Score = l_0_11.Score
    MpCommon.BmTriggerSig(l_0_36, "SetProcessAttrib", safeJsonSerialize(l_0_38))
  end
  l_0_5.AppName = l_0_19 or l_0_4
  l_0_5.AppCategory = l_0_35
  local l_0_39 = "Base64Cmd_child[" .. l_0_6:match("pid:(%d+)") .. "][cmd/APML_SuspCommand.A]"
  local l_0_40 = {}
  l_0_40.ProcessName = MpCommon.GetImagePathFromPid(l_0_6)
  l_0_40.IsProcessFriendly = MpCommon.IsFriendlyProcess(l_0_6)
  l_0_40.Pid = l_0_6
  l_0_40.Base64GradingInfo = l_0_5.Base64GradingInfo
  l_0_40.IndicatorScore = l_0_11.Score
  l_0_40.Parents = l_0_8
  IncreaseProcessAnomalyScore(l_0_0.ppid, l_0_11.Score, l_0_39, "PFAppTracked", l_0_40)
end
l_0_5.Concrete = false
l_0_5.Remediation_Reason = ""
local l_0_41 = l_0_5.Base64GradingInfo
for l_0_42 = 1, 3 do
  if l_0_41 and l_0_41["Evidence_L" .. l_0_42] then
    local l_0_43 = l_0_41["Evidence_L" .. l_0_42].Urls
    for l_0_44, l_0_45 in pairs(l_0_43) do
      if l_0_45.BadUrlRep then
        l_0_5.Remediation_Reason = "BadUrlRep"
        l_0_5.Concrete = true
        break
      end
    end
    if l_0_41["Evidence_L" .. l_0_42].MultilayerEncoding then
      mp.set_mpattribute("HSTR:PFApps_MultilayerEncoded_B")
    end
  end
end
if l_0_11.Score > 45 then
  l_0_5.Remediation_Reason = l_0_5.Remediation_Reason .. ";" .. "HighScore"
end
if l_0_41 and l_0_41.Evidence_L1 then
  local l_0_46 = l_0_41.Evidence_L1
  if l_0_46.MultilayerEncoding then
    l_0_5.Remediation_Reason = l_0_5.Remediation_Reason .. ";" .. "MultilayerEncoding"
  end
end
local l_0_47 = mp.enum_mpattributesubstring("Appomaly_HighlySuspCmd_Pattern_")
if l_0_47 and 0 < #l_0_47 then
  mp.set_mpattribute("HSTR:PFApps_SuspPatterns_encoded3")
  l_0_5.Remediation_Reason = l_0_5.Remediation_Reason .. ";" .. "SuspPattern"
end
l_0_47 = mp.enum_mpattributesubstring("Appomaly_SuspUrl_Found")
if l_0_47 and 0 < #l_0_47 then
  mp.set_mpattribute("HSTR:PFApps_HighlySuspUrl")
  l_0_5.Remediation_Reason = l_0_5.Remediation_Reason .. ";" .. "SuspUrl"
end
l_0_47 = mp.enum_mpattributesubstring("Appomaly_")
if l_0_47 and 0 < #l_0_47 then
  l_0_5.Attributes = table_dedup(l_0_47)
end
local l_0_48 = {}
local l_0_49 = 0
for l_0_50, l_0_51 in ipairs(l_0_5.Parents) do
  local l_0_52, l_0_53, l_0_54 = IsFileRecentlyDropped(l_0_51.ImagePath)
  if l_0_52 then
    table.insert(l_0_48, l_0_54)
    l_0_49 = l_0_49 + l_0_53
  end
end
l_0_5.RecentlyDroppedParents = l_0_48
l_0_5.ParentScore = l_0_49
local l_0_55, l_0_56 = safeJsonSerialize(l_0_5, 150, nil, true)
if l_0_55 then
  set_research_data("Evidence", MpCommon.Base64Encode(l_0_55), false)
  MpCommon.BmTriggerSig(l_0_0.ppid, "SuspDownload3_BM_Capture", l_0_55)
elseif l_0_56 then
  set_research_data("Error", MpCommon.Base64Encode(l_0_56), false)
  return mp.INFECTED
end
return mp.CLEAN
