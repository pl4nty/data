-- Threat: !InfrastructureShared
-- Name: 21bb3f39c42bd
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper, AppomalyHelpers

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = MpCommon.GetProcessAttributeValue(l_0_0.ppid, "PFAppTracked") or MpCommon.GetProcessAttributeValue(l_0_0.ppid, "inherit:PFAppTracked")
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = safeJsonDeserialize(l_0_1)
if not l_0_2 then
  return mp.CLEAN
end
local l_0_3 = l_0_2.AppName
local l_0_4 = bm.get_imagepath()
if not l_0_4 then
  return mp.CLEAN
end
if contains(l_0_4, {
  "conhost.exe",
  "WerFault.exe"
}) then
  return mp.CLEAN
end
local l_0_5 = l_0_4:match("([^\\]+)$")
local l_0_6 = "Appomaly_ChildProcName_0"
local l_0_7 = MpCommon.AnomalyEventLookup(l_0_6, "MarkerRecord_" .. l_0_3, 1)
local l_0_8 = MpCommon.GetCurrentTimeT()
local l_0_9 = l_0_8
local l_0_10
local l_0_11 = mp.GetParentProcInfo()
if l_0_11 and l_0_11.image_path then
  l_0_10 = l_0_11.image_path:match("([^\\]+)$")
end
l_0_10 = l_0_10 or "None"
local l_0_12 = l_0_10 .. "_" .. l_0_5
local l_0_13, l_0_14
local l_0_15 = {}
l_0_15.TrackedProcess = l_0_3
l_0_15.ParentName = l_0_10
l_0_15.SignatureName = "PFAppChildProc.B"
l_0_15.AnomalyTableName = "Appomaly_ChildProcName"
l_0_15.Key = l_0_12
if l_0_7 and l_0_7.Count then
  l_0_9 = l_0_7.Count
  local l_0_16 = (l_0_8 - l_0_9) / 60
  local l_0_17 = MpCommon.AnomalyEventLookup(l_0_6, l_0_12, 1)
  if not l_0_17 then
    if 43200 < l_0_16 then
      add_parents()
      l_0_15.AnomalyTableInfo = MpCommon.AnomalyTableLookup(l_0_6)
      local l_0_18 = mp.GetProcessCommandLine(l_0_0.ppid)
      local l_0_19, l_0_20 = CommandLineGrader(l_0_18)
      l_0_15.CommandlineScore = l_0_19
      l_0_15.CommandlineScoreIndicator = l_0_20
      local l_0_21 = {
        ["cmd.exe"] = 10,
        ["powershell.exe"] = 10,
        ["reg.exe"] = 5,
        pwsh = 10,
        ["net.exe"] = 5,
        ["wmic.exe"] = 5,
        ["net1.exe"] = 5,
        ["rundll32.exe"] = 5
      }
      local l_0_22 = l_0_21[string.lower(l_0_5)] or 0
      l_0_15.ProcNameWeight = l_0_22
      bm.add_related_string("AdditionalInfo", safeJsonSerialize(l_0_15), bm.RelatedStringBMReport)
      return mp.INFECTED
    else
      l_0_13, l_0_14 = pcall(MpCommon.AnomalyEventUpdate, l_0_6, l_0_12, 1, 1)
    end
  else
    local l_0_23 = l_0_17.Count
    l_0_13, l_0_14 = pcall(MpCommon.AnomalyEventUpdate, l_0_6, l_0_12, l_0_23 + 1, 1)
  end
else
  l_0_9 = l_0_8
  l_0_13, l_0_14 = pcall(MpCommon.AnomalyEventUpdate, l_0_6, "MarkerRecord_" .. l_0_3, l_0_8, 1)
  if l_0_13 then
    bm.trigger_sig("AnomalyTableMarker_Rcr", safeJsonSerialize(l_0_15))
    l_0_13, l_0_14 = pcall(MpCommon.AnomalyEventUpdate, l_0_6, l_0_12, 1, 1)
  end
end
if not l_0_13 then
  l_0_15.Error = l_0_14
  bm.trigger_sig("AnomalyTable_Error", safeJsonSerialize(l_0_15))
end
local l_0_24 = {}
l_0_24.TrackedProcess = l_0_3
l_0_24.ParentName = l_0_10
l_0_24.ProcessName = l_0_5
l_0_24.Source = "BM"
l_0_24.SignatureName = "PFAppChildProc.B"
l_0_24.AnomalyTableName = "Appomaly_ChildProcName_CmdLine"
l_0_24.TableAge = GetAnomalyTableAge("Appomaly_ChildProcName_CmdLine")
l_0_24.AttributeName = "PFAppTracked"
l_0_24.AttributeCategory = "programfiles_Net"
l_0_24.CommandlineScoreIndicator = l_0_15.CommandlineScoreIndicator
l_0_24.CommandlineScore = l_0_15.CommandlineScore
bm.trigger_sig("AnomalousChildCommandline", safeJsonSerialize(l_0_24))
return mp.CLEAN
