-- Threat: !InfrastructureShared
-- Name: 101d77b5a07c4
-- Type: 21
-- Includes: ResearchData, LuaFuncHelper, AppomalyHelpers

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = {}
local l_0_2 = mp.GetParentProcInfo()
local l_0_3, l_0_4 = GetAppomalyProcessAttribute(l_0_2.ppid)
if not l_0_3 then
  return mp.CLEAN
end
local l_0_5 = safeJsonDeserialize(l_0_4)
if not l_0_5 then
  return mp.CLEAN
end
local l_0_6 = l_0_5.AppName
local l_0_7 = l_0_5.Pid
if not l_0_7 or not l_0_6 then
  return mp.CLEAN
end
local l_0_8 = add_parents_mp()
l_0_1.Parents = l_0_8
l_0_1.AppName = l_0_6
l_0_1.AppCategory = l_0_5.AppCategory
local l_0_9 = mp.GetProcessCommandLine(l_0_0)
if not l_0_9 then
  return mp.CLEAN
end
local l_0_10 = mp.hstr_full_log()
if l_0_10 and (l_0_10[2].matched or l_0_10[3].matched) and not hasBase64Content(l_0_9) then
  return mp.CLEAN
end
local l_0_11, l_0_12 = Base64Grader(l_0_9)
local l_0_13 = mp.enum_mpattributesubstring("Appomaly_BadUrlRep_Found")
if l_0_13 and 0 < #l_0_13 then
  mp.set_mpattribute("HSTR:PFApps_MaliciousCMD_B")
  return mp.CLEAN
end
if not l_0_12 or l_0_12.Score == 0 then
  return mp.CLEAN
end
l_0_12.ML_score = CommandlineMLScore()
l_0_1.Base64GradingInfo = l_0_12
if mp.get_mpattribute("MpCmdLineFoundB64") then
  l_0_1.MpCmdLineFoundB64 = true
else
  l_0_1.MpCmdLineFoundB64 = false
end
if l_0_12.Evidence_L1 and (l_0_12.Evidence_L1.MultilayerEncoding or l_0_12.Evidence_L1.Obfuscated_FailedToDecode) and 0 < l_0_12.Score then
  local l_0_14 = false
  if parent_mp_contains(l_0_8, "GoogleUpdate.exe") or parent_mp_contains(l_0_8, "svchost.exe") or parent_mp_contains(l_0_8, "winrshost.exe") or parent_mp_contains(l_0_8, "services.exe") then
    l_0_14 = true
  end
  if not mp.get_mpattribute("Appomaly_Pattern_Obfuscated") and l_0_12.Evidence_L2 and l_0_12.Evidence_L2.Score <= 5 and not next(l_0_12.Evidence_L1.Urls) and not l_0_12.Evidence_L2.MultilayerEncoding and not l_0_12.Evidence_L2.Obfuscated_FailedToDecode then
    l_0_14 = true
  end
  if l_0_12.Evidence_L2 and l_0_12.Evidence_L2.CommandlineTokens then
    local l_0_15 = l_0_12.Evidence_L2.CommandlineTokens
    if table_contains(l_0_15, "googleupdate", true) or table_contains(l_0_15, "[scriptblock]::create($split_parts[0])&$exec_wrapper", true) then
      l_0_14 = true
    end
  end
  if not l_0_14 then
    local l_0_16, l_0_17 = safeJsonSerialize(l_0_12, 150, nil, true)
    local l_0_18 = l_0_12.Evidence_L1.MultilayerEncoding and "Appomaly_MultilayerEncoded_Tracked" or "Appomaly_Encoded_Obfuscated_Tracked"
    MpCommon.BmTriggerSig(l_0_2.ppid, l_0_18, l_0_16 or l_0_17)
  end
end
if l_0_12.Score <= 15 and not next(l_0_12.Evidence_L1.Urls) and not hasTamperingCmd(l_0_9) then
  return mp.CLEAN
end
if l_0_12.Score > 30 then
  if l_0_12.CommandlineTokens then
    local l_0_19 = MpCommon.GetImagePathFromPid(l_0_0)
    local l_0_20 = l_0_19:match("([^\\]+)$") or ""
    local l_0_21 = {}
    l_0_21.ParentName = l_0_6
    l_0_21.ProcessName = l_0_20
    l_0_21.Source = "CMD"
    l_0_21.SignatureName = "PFApps.C"
    l_0_21.CommandlineScore = l_0_12.Score
    l_0_21.CommandlineScoreIndicator = l_0_1.Base64GradingInfo
    l_0_21.AnomalyTableName = "Appomaly_ChildProcName_CmdLine_Base64"
    l_0_21.TableAge = GetAnomalyTableAge("Appomaly_ChildProcName_CmdLine_Base64")
    l_0_21.AttributeName = "PFApp_Parent"
    l_0_21.AttributeCategory = "PFServers"
    local l_0_22 = l_0_6 .. ";" .. l_0_20 .. ";" .. table.concat(l_0_12.CommandlineTokens, "|")
    local l_0_23, l_0_24, l_0_25 = AnomalyTableCheck("Appomaly_ChildProcName_CmdLine", l_0_22, 30)
    if l_0_23 == false and l_0_24 == false then
      return mp.CLEAN
    elseif l_0_23 and not l_0_24 then
      local l_0_26, l_0_27, l_0_28 = IsPotentiallyClean("CmdLine", l_0_6 .. ";" .. l_0_20, l_0_12.CommandlineTokens)
      if l_0_26 then
        l_0_1.IsPotentiallyClean = l_0_27
      end
      MpCommon.BmTriggerSig(l_0_2.ppid, "AnomalousChildCommandline", safeJsonSerialize(l_0_21))
    end
  end
  local l_0_29, l_0_30 = startTrackingApp(l_0_7, l_0_6, "PFServers", "PFApp_Parent")
  if not l_0_29 then
    l_0_30.SignatureName = "PFApps.C"
    MpCommon.BmTriggerSig(l_0_7, "ProcAttribError", safeJsonSerialize(l_0_30))
  else
    local l_0_31 = "Base64Cmd_child[" .. l_0_0:match("pid:(%d+)") .. "][cmd/PFApps.C]"
    local l_0_32 = {}
    l_0_32.ProcessName = MpCommon.GetImagePathFromPid(l_0_0)
    l_0_32.IsProcessFriendly = MpCommon.IsFriendlyProcess(l_0_0)
    l_0_32.Pid = l_0_0
    l_0_32.Base64GradingInfo = l_0_1.Base64GradingInfo
    l_0_32.IndicatorScore = l_0_12.Score
    l_0_32.Parents = l_0_8
    IncreaseProcessAnomalyScore(l_0_2.ppid, l_0_12.Score, l_0_31, "PFApp_Parent", l_0_32)
    if next(l_0_30) and l_0_30.IsNewApp then
      l_0_30.SignatureName = "PFApps.C"
      l_0_30.Score = l_0_12.Score
      MpCommon.BmTriggerSig(l_0_7, "SetProcessAttrib", safeJsonSerialize(l_0_30))
    end
  end
end
l_0_1.Concrete = false
l_0_1.Remediation_Reason = ""
local l_0_33 = l_0_1.Base64GradingInfo
for l_0_34 = 1, 3 do
  if l_0_33 and l_0_33["Evidence_L" .. l_0_34] then
    local l_0_35 = l_0_33["Evidence_L" .. l_0_34].Urls
    for l_0_36, l_0_37 in pairs(l_0_35) do
      if l_0_37.BadUrlRep then
        l_0_1.Remediation_Reason = "BadUrlRep"
        l_0_1.Concrete = true
        break
      end
    end
    if l_0_33["Evidence_L" .. l_0_34].MultilayerEncoding then
      mp.set_mpattribute("HSTR:PFApps_MultilayerEncoded_A")
      l_0_1.Concrete = true
    end
  end
end
if not next(l_0_12.Evidence_L1.Urls) then
  return mp.CLEAN
end
if l_0_12.Score > 45 then
  l_0_1.Remediation_Reason = l_0_1.Remediation_Reason .. ";" .. "HighScore"
end
if l_0_33 and l_0_33.Evidence_L1 then
  local l_0_38 = l_0_33.Evidence_L1
  if l_0_38.MultilayerEncoding then
    l_0_1.Remediation_Reason = l_0_1.Remediation_Reason .. ";" .. "MultilayerEncoding"
  end
end
local l_0_39 = mp.enum_mpattributesubstring("Appomaly_HighlySuspCmd_Pattern_")
if l_0_39 and 0 < #l_0_39 then
  mp.set_mpattribute("HSTR:PFApps_SuspPatterns_encoded3")
  l_0_1.Remediation_Reason = l_0_1.Remediation_Reason .. ";" .. "SuspPattern"
end
l_0_39 = mp.enum_mpattributesubstring("Appomaly_SuspUrl_Found")
if l_0_39 and 0 < #l_0_39 then
  mp.set_mpattribute("HSTR:PFApps_HighlySuspUrl")
  l_0_1.Remediation_Reason = l_0_1.Remediation_Reason .. ";" .. "SuspUrl"
end
l_0_39 = mp.enum_mpattributesubstring("Appomaly_")
if l_0_39 and 0 < #l_0_39 then
  l_0_1.Attributes = table_dedup(l_0_39)
end
local l_0_40 = {}
local l_0_41 = 0
for l_0_42, l_0_43 in ipairs(l_0_1.Parents) do
  local l_0_44, l_0_45, l_0_46 = IsFileRecentlyDropped(l_0_43.ImagePath)
  if l_0_44 then
    table.insert(l_0_40, l_0_46)
    l_0_41 = l_0_41 + l_0_45
  end
end
l_0_1.RecentlyDroppedParents = l_0_40
l_0_1.ParentScore = l_0_41
local l_0_47, l_0_48 = safeJsonSerialize(l_0_1, 150, nil, true)
if l_0_47 then
  set_research_data("Evidence", MpCommon.Base64Encode(l_0_47), false)
  MpCommon.BmTriggerSig(l_0_2.ppid, "SuspDownload2_BM_Capture", l_0_47)
elseif l_0_48 then
  set_research_data("Error", MpCommon.Base64Encode(l_0_48), false)
  return mp.INFECTED
else
  set_research_data("Error", "Failed Serialization w/o error", false)
end
return mp.CLEAN
