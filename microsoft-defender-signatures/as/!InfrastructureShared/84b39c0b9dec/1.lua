-- Threat: !InfrastructureShared
-- Name: 84b39c0b9dec
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = bm.get_current_process_startup_info()
if not l_0_0 or not l_0_0.ppid then
  return mp.CLEAN
end
local l_0_1 = MpCommon.GetProcessAttributeValue(l_0_0.ppid, "inherit:PFApp_Parent") or MpCommon.GetProcessAttributeValue(l_0_0.ppid, "PFApp_Parent")
local l_0_2 = "ruby.exe"
l_0_1 = l_0_1 or {}
local l_0_3 = bm.get_connection_string()
if not l_0_3 then
  return mp.CLEAN
end
local l_0_4 = l_0_3:match("Uri=(.-;)")
if not l_0_4 then
  return mp.CLEAN
end
local l_0_5 = l_0_4:match("^%a+://([^:/]+)")
if not l_0_5 then
  return mp.CLEAN
end
l_0_5 = string.lower(l_0_5)
local l_0_6 = "PFApp_HOST_0"
local l_0_7 = MpCommon.AnomalyEventLookup(l_0_6, "MarkerRecord_" .. l_0_2, 1)
local l_0_8 = MpCommon.GetCurrentTimeT()
local l_0_9 = l_0_8
local l_0_10, l_0_11
local l_0_12 = {}
l_0_12.TrackedProcess = l_0_2
l_0_12.SignatureName = "Behavior:Win32/PFAppAnomalousOutbound.C"
l_0_12.AnomalyTableName = "Appomaly_Network_HOST"
if l_0_7 then
  if l_0_7.Count then
    l_0_9 = l_0_7.Count
  end
else
  l_0_9 = l_0_8
  l_0_10, l_0_11 = pcall(MpCommon.AnomalyEventUpdate, l_0_6, "MarkerRecord_" .. l_0_2, l_0_8, 1)
  if l_0_10 then
    bm.trigger_sig("AnomalyTableMarker_Rcr", safeJsonSerialize(l_0_12))
  else
    l_0_12.Error = l_0_11
    bm.trigger_sig("AnomalyTable_Error", safeJsonSerialize(l_0_12))
    return mp.CLEAN
  end
end
local l_0_13 = (l_0_8 - l_0_9) / 60
local l_0_14 = l_0_2 .. "_" .. l_0_5
local l_0_15 = MpCommon.AnomalyEventLookup(l_0_6, l_0_14, 1)
if not l_0_15 then
  if 43200 < l_0_13 then
    l_0_12.minutes_elapsed = l_0_13
    l_0_12.isTest = "false"
    l_0_12.processAttrib = l_0_1
    bm.add_related_string("AdditionalInfo", safeJsonSerialize(l_0_12), bm.RelatedStringBMReport)
    return mp.INFECTED
  else
    l_0_10, l_0_11 = pcall(MpCommon.AnomalyEventUpdate, l_0_6, l_0_14, 1, 1)
  end
else
  local l_0_16 = l_0_15.Count + 1
  l_0_10, l_0_11 = pcall(MpCommon.AnomalyEventUpdate, l_0_6, l_0_14, l_0_16, 1)
end
if not l_0_10 then
  l_0_12.Key = l_0_14
  l_0_12.Error = l_0_11
  bm.trigger_sig("AnomalyTable_Error", safeJsonSerialize(l_0_12))
end
return mp.CLEAN
