-- Threat: !InfrastructureShared
-- Name: 4ab3cbae62e3
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper, AppomalyHelpers

local l_0_0 = "ruby.exe"
local l_0_1 = bm.get_imagepath()
if not l_0_1 then
  return mp.CLEAN
end
if contains(l_0_1, {
  "conhost.exe",
  "WerFault.exe"
}) then
  return mp.CLEAN
end
local l_0_2 = l_0_1:match("([^\\]+)$")
if not l_0_2 then
  return mp.CLEAN
end
local l_0_3 = bm.get_current_process_startup_info()
local l_0_4, l_0_5
local l_0_6 = {}
l_0_6.TrackedProcess = l_0_0
l_0_6.SignatureName = "Behavior:Win32/PFAppChildProc.C"
if l_0_3 and l_0_3.integrity_level > MpCommon.SECURITY_MANDATORY_MEDIUM_RID then
  local l_0_7 = "Appomaly_ChildProcPriv_0"
  local l_0_8 = MpCommon.AnomalyEventLookup(l_0_7, "MarkerRecord_" .. l_0_0, 1)
  local l_0_9 = MpCommon.GetCurrentTimeT()
  local l_0_10 = l_0_9
  local l_0_11 = l_0_0 .. "_" .. l_0_2 .. "_" .. l_0_3.integrity_level
  l_0_6.AnomalyTableName = "Appomaly_ChildProcPriv"
  l_0_6.Key = l_0_11
  if l_0_8 and l_0_8.Count then
    l_0_10 = l_0_8.Count
    local l_0_12 = (l_0_9 - l_0_10) / 60
    local l_0_13 = MpCommon.AnomalyEventLookup(l_0_7, l_0_11, 1)
    if not l_0_13 then
      if 28800 < l_0_12 then
        l_0_6.AnomalyTableInfo = MpCommon.AnomalyTableLookup(l_0_7)
        bm.trigger_sig("AnomalousChildPriv", safeJsonSerialize(l_0_6))
      else
        l_0_4, l_0_5 = pcall(MpCommon.AnomalyEventUpdate, l_0_7, l_0_11, 1, 1)
      end
    else
      local l_0_14 = l_0_13.Count
      l_0_4, l_0_5 = pcall(MpCommon.AnomalyEventUpdate, l_0_7, l_0_11, l_0_14 + 1, 1)
    end
  else
    l_0_10 = l_0_9
    l_0_4, l_0_5 = pcall(MpCommon.AnomalyEventUpdate, l_0_7, "MarkerRecord_" .. l_0_0, l_0_9, 1)
    if l_0_4 then
      bm.trigger_sig("AnomalyTableMarker_Rcr", safeJsonSerialize(l_0_6))
      l_0_4, l_0_5 = pcall(MpCommon.AnomalyEventUpdate, l_0_7, l_0_11, 1, 1)
    end
  end
  if not l_0_4 then
    l_0_6.Error = l_0_5
    bm.trigger_sig("AnomalyTable_Error", safeJsonSerialize(l_0_6))
  end
end
local l_0_15 = "Appomaly_ChildProcName_0"
local l_0_16 = MpCommon.AnomalyEventLookup(l_0_15, "MarkerRecord_" .. l_0_0, 1)
local l_0_17 = 0
local l_0_18 = MpCommon.GetCurrentTimeT()
local l_0_19 = l_0_0 .. "_" .. l_0_2
l_0_6.AnomalyTableName = "Appomaly_ChildProcName"
l_0_6.Key = l_0_19
if l_0_16 and l_0_16.Count then
  l_0_17 = l_0_16.Count
  local l_0_20 = (l_0_18 - l_0_17) / 60
  local l_0_21 = MpCommon.AnomalyEventLookup(l_0_15, l_0_19, 1)
  if not l_0_21 then
    if 28800 < l_0_20 then
      l_0_6.AnomalyTableInfo = MpCommon.AnomalyTableLookup(l_0_15)
      add_parents()
      local l_0_22 = bm.get_current_process_startup_info()
      if l_0_22 then
        local l_0_23 = mp.GetProcessCommandLine(l_0_22.ppid)
        local l_0_24, l_0_25 = CommandLineGrader(l_0_23)
        l_0_6.CommandlineScore = l_0_24
        l_0_6.CommandlineScoreIndicator = l_0_25
      end
      local l_0_26 = {
        ["cmd.exe"] = 10,
        ["powershell.exe"] = 10,
        ["reg.exe"] = 5,
        pwsh = 10,
        ["net.exe"] = 5,
        ["wmic.exe"] = 5,
        ["net1.exe"] = 5,
        ["rundll32.exe"] = 5
      }
      local l_0_27 = l_0_26[string.lower(l_0_2)] or 0
      l_0_6.ProcNameWeight = l_0_27
      bm.add_related_string("AdditionalInfo", safeJsonSerialize(l_0_6), bm.RelatedStringBMReport)
      return mp.INFECTED
    else
      l_0_4, l_0_5 = pcall(MpCommon.AnomalyEventUpdate, l_0_15, l_0_19, 1, 1)
    end
  else
    local l_0_28 = l_0_21.Count
    l_0_4, l_0_5 = pcall(MpCommon.AnomalyEventUpdate, l_0_15, l_0_19, l_0_28 + 1, 1)
  end
else
  l_0_17 = l_0_18
  l_0_4, l_0_5 = pcall(MpCommon.AnomalyEventUpdate, l_0_15, "MarkerRecord_" .. l_0_0, l_0_18, 1)
  if l_0_4 then
    bm.trigger_sig("AnomalyTableMarker_Rcr", safeJsonSerialize(l_0_6))
    l_0_4, l_0_5 = pcall(MpCommon.AnomalyEventUpdate, l_0_15, l_0_19, 1, 1)
  end
end
if not l_0_4 then
  l_0_6.Error = l_0_5
  bm.trigger_sig("AnomalyTable_Error", safeJsonSerialize(l_0_6))
end
local l_0_29 = {}
l_0_29.ParentName = l_0_0
l_0_29.ProcessName = l_0_2
l_0_29.Source = "BM"
l_0_29.SignatureName = "Behavior:Win32/PFAppChildProc.C"
l_0_29.AnomalyTableName = "Appomaly_ChildProcName_CmdLine"
l_0_29.TableAge = GetAnomalyTableAge("Appomaly_ChildProcName_CmdLine")
l_0_29.AttributeName = "PFApp_Parent"
l_0_29.AttributeCategory = "PFServers"
l_0_29.CommandlineScoreIndicator = l_0_6.CommandlineScoreIndicator
l_0_29.CommandlineScore = l_0_6.CommandlineScore
bm.trigger_sig("AnomalousChildCommandline", safeJsonSerialize(l_0_29))
return mp.CLEAN
