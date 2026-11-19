-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win32/PFApps_Cmdline.A
-- Type: 13
-- Includes: ResearchData, LuaFuncHelper, AppomalyHelpers, BMLuaLib
-- MpAttributes: (SCPT:APM_cmd_indicator_1 | SCPT:APM_cmd_indicator_2 | APM_cmd_indicator_3 | SCPT:APM_cmd_indicator_4) & MpIsPowerShellAMSIScan & !SCPT:APM_cmd_indicator_FP

local l_0_0, l_0_1 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_CONTENTNAME)
if l_0_1 then
  local l_0_2 = {
    "C:\\WINDOWS\\CCM\\",
    "C:\\WINDOWS\\IMECache\\",
    "\\Nexthink\\",
    "Microsoft\\Windows Defender Advanced Threat Protection\\",
    "WindowsDefenderExploitGuard\\Modules",
    "Plugins\\Microsoft.Azure"
  }
  if contains(l_0_1, l_0_2, true) then
    return mp.CLEAN
  end
  local l_0_3, l_0_4 = hasSeenBefore(string.lower(l_0_1), "", 20, "FileName")
  if l_0_3 and 2 < l_0_4 then
    return mp.CLEAN
  end
end
local l_0_5 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_5 then
  l_0_5 = string.lower(l_0_5)
  if not string.find(l_0_5, "powershell", 1, true) and not string.find(l_0_5, "pwsh.exe", 1, true) then
    return mp.CLEAN
  end
end
local l_0_6 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSDEVICEPATH) or ""
if string.find(l_0_6, "\\WindowsApps\\", 1, true) then
  return mp.CLEAN
end
local l_0_7 = tostring(headerpage) .. tostring(footerpage)
l_0_7 = string.lower(l_0_7)
local l_0_8, l_0_9 = CommandLineGrader(l_0_7, true, 2)
if not (l_0_8 and l_0_9) or not next(l_0_9) then
  return mp.CLEAN
end
local l_0_10 = GetCurrentPPID()
if not l_0_10 then
  return mp.CLEAN
end
local l_0_11 = mp.GetProcessCommandLine(l_0_10)
if hasBase64Content(l_0_7) or hasBase64Content(l_0_11) or hasURLEncodedContent(l_0_11) then
  l_0_8 = l_0_8 + 10
end
if l_0_9.Evidence_L1.MultilayerEncoding or l_0_9.Evidence_L1.Obfuscated_FailedToDecode then
  l_0_8 = l_0_8 + 20
end
if l_0_9.Evidence_L1 and not next(l_0_9.Evidence_L1.Urls) and not hasTamperingCmd(l_0_7) and l_0_8 < 10 then
  return mp.CLEAN
end
local l_0_12 = {}
l_0_12.Score = l_0_8
l_0_12.ScriptName = l_0_1
local l_0_13
local l_0_14 = mp.GetParentProcInfo(l_0_10)
if l_0_14 and l_0_14.ppid then
  l_0_13 = MpCommon.GetImagePathFromPid(l_0_14.ppid)
end
if l_0_9.CommandlineTokens then
  if IsPotentiallyClean("CmdLine_Basic", "", table.concat(l_0_9.CommandlineTokens, "|")) then
    return mp.CLEAN
  end
  local l_0_15, l_0_16, l_0_17 = IsPotentiallyClean("CmdLine", l_0_13 or "" .. ";powershell.exe", l_0_9.CommandlineTokens)
  if l_0_15 then
    l_0_12.IsPotentiallyClean = l_0_16
  end
end
l_0_12.Parents = add_parents_mp() or l_0_13
local l_0_18, l_0_19 = GetAppomalyProcessAttribute(l_0_10)
local l_0_20 = safeJsonDeserialize(l_0_19)
if l_0_20 then
  local l_0_21 = l_0_20.AppName
  local l_0_22 = mp.GetParentProcInfo(l_0_10)
  local l_0_23 = l_0_22.image_path
  local l_0_24 = l_0_23:match("([^\\]+)$") or ""
  local l_0_25 = "powershell.exe"
  local l_0_26 = l_0_9.CommandlineTokens
  local l_0_27 = {}
  l_0_27.ParentName = l_0_24
  l_0_27.TrackedProcess = l_0_21
  l_0_27.ProcessName = l_0_25
  l_0_27.Source = "AMSI"
  l_0_27.SignatureName = "PFApps_Cmdline.A"
  l_0_27.CommandlineTokens = l_0_26
  l_0_27.CommandlineScore = l_0_12.Score
  l_0_27.CommandlineScoreIndicator = l_0_12.CmdGradingInfo
  l_0_27.AnomalyTableName = "Appomaly_ChildProcName_CmdLine"
  l_0_27.TableAge = GetAnomalyTableAge("Appomaly_ChildProcName_CmdLine")
  local l_0_28 = table.concat(l_0_26, "|")
  local l_0_29 = l_0_21 .. ";" .. l_0_25 .. ";" .. l_0_28
  local l_0_30, l_0_31, l_0_32 = AnomalyTableCheck("Appomaly_ChildProcName_CmdLine", l_0_29, 30, "MarkerRecord_" .. l_0_21)
  if l_0_30 == false and l_0_31 == false then
    return mp.CLEAN
  elseif l_0_30 and not l_0_31 then
    local l_0_33, l_0_34, l_0_35 = IsPotentiallyClean("CmdLine", l_0_21 .. ";" .. l_0_25, l_0_28)
    if l_0_33 then
      l_0_12.IsPotentiallyClean = l_0_34
    end
    MpCommon.BmTriggerSig(l_0_22.ppid, "2_AnomalousChildCommandline", safeJsonSerialize(l_0_27))
  end
  local l_0_36 = "SuspAMSICmd[" .. l_0_10:match("pid:(%d+)")
  local l_0_37 = {}
  l_0_37.Pid = l_0_10
  l_0_37.CmdGradingInfo = l_0_9
  l_0_37.IndicatorScore = l_0_8
  l_0_37.Parents = l_0_23
  IncreaseProcessAnomalyScore(l_0_10, l_0_8, l_0_36, l_0_18, l_0_37)
end
l_0_12.Concrete = false
l_0_12.Remediation_Reason = ""
local l_0_38 = l_0_12.CmdGradingInfo
if l_0_38 and l_0_38.Evidence_L1 then
  local l_0_39 = l_0_38.Evidence_L1.Urls
  for l_0_40, l_0_41 in pairs(l_0_39) do
    if l_0_41.BadUrlRep then
      l_0_12.Remediation_Reason = "BadUrlRep"
      l_0_12.Concrete = true
      break
    end
  end
end
if l_0_12.Score > 45 then
  l_0_12.Remediation_Reason = l_0_12.Remediation_Reason .. ";" .. "HighScore"
end
l_0_9.CommandlineTokens = {}
l_0_12.CmdGradingInfo = l_0_9
local l_0_42, l_0_43 = safeJsonSerialize(l_0_12, 150, nil, true)
if not l_0_42 then
  set_research_data("Error", "Error Serializing Evidence Data" .. MpCommon.Base64Encode(l_0_43), false)
  return mp.INFECTED
else
  set_research_data("Evidence", MpCommon.Base64Encode(l_0_42), false)
  MpCommon.BmTriggerSig(l_0_10, "LUA:PFApps_Cmdline", l_0_42)
end
return mp.CLEAN
