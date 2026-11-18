-- Threat: !InfrastructureShared
-- Name: 1c6b35797f113
-- Type: 21
-- Includes: LuaFuncHelper, AppomalyHelpers

local l_0_0 = bm.get_current_process_startup_info()
if not l_0_0 or not l_0_0.ppid then
  return mp.CLEAN
end
local l_0_1
local l_0_2 = MpCommon.GetProcessAttributeValue(l_0_0.ppid, "inherit:PFApp_Parent") or MpCommon.GetProcessAttributeValue(l_0_0.ppid, "PFApp_Parent")
if l_0_2 then
  local l_0_3 = safeJsonDeserialize(l_0_2)
  if l_0_3 then
    l_0_1 = l_0_3.AppName
  else
    l_0_1 = l_0_2:match("[^|]+")
  end
else
  l_0_2 = "None"
  if this_sigattrlog[1].matched then
    l_0_1 = this_sigattrlog[1].utf8p1:match("([^\\]+)$")
  elseif this_sigattrlog[2].matched then
    l_0_1 = this_sigattrlog[2].utf8p1:match("([^\\]+)$")
  elseif this_sigattrlog[3].matched then
    l_0_1 = this_sigattrlog[3].utf8p1:match("([^\\]+)$")
  elseif this_sigattrlog[4].matched then
    l_0_1 = this_sigattrlog[4].utf8p1:match("([^\\]+)$")
  elseif this_sigattrlog[5].matched then
    l_0_1 = this_sigattrlog[5].utf8p1:match("([^\\]+)$")
  elseif this_sigattrlog[6].matched then
    l_0_1 = this_sigattrlog[6].utf8p1:match("([^\\]+)$")
  elseif this_sigattrlog[7].matched then
    l_0_1 = this_sigattrlog[7].utf8p1:match("([^\\]+)$")
  end
end
local l_0_4 = bm.get_connection_string()
if not l_0_4 then
  return mp.CLEAN
end
local l_0_5 = l_0_4:match("Uri=(.-;)")
if not l_0_5 then
  return mp.CLEAN
end
local l_0_6 = l_0_5:match("^%a+://([^:/]+)")
if not l_0_6 then
  return mp.CLEAN
end
l_0_6 = string.lower(l_0_6)
local l_0_7, l_0_8
local l_0_9 = {}
l_0_9.TrackedProcess = l_0_1
l_0_9.SignatureName = "PFAppAnomalousOutbound.B"
l_0_9.AnomalyTableName = "Appomaly_Network_HOST"
l_0_9.Key = l_0_1 .. "_" .. l_0_6
if versioning.IsSampled(100000, true, true, true) then
  local l_0_10 = "Appomaly_Network_HOST_0"
  local l_0_11 = l_0_1 .. "_" .. l_0_6
  local l_0_12, l_0_13, l_0_14 = AnomalyTableCheck(l_0_10, l_0_11, 30, "MarkerRecord_" .. l_0_1)
  if l_0_12 and not l_0_13 then
    l_0_9.processAttrib = l_0_2
    l_0_9.AnomalyTableInfo = l_0_14
    bm.add_related_string("AdditionalInfo", safeJsonSerialize(l_0_9), bm.RelatedStringBMReport)
    return mp.INFECTED
  end
else
  local l_0_15 = "Appomaly_Network_HOST_0"
  local l_0_16 = MpCommon.AnomalyEventLookup(l_0_15, "MarkerRecord_" .. l_0_1, 1)
  local l_0_17 = MpCommon.GetCurrentTimeT()
  local l_0_18 = l_0_17
  if l_0_16 then
    if l_0_16.Count then
      l_0_18 = l_0_16.Count
    end
  else
    l_0_7, l_0_8 = pcall(MpCommon.AnomalyEventUpdate, l_0_15, "MarkerRecord_" .. l_0_1, l_0_17, 1)
    if l_0_7 then
      l_0_9.hostname = l_0_6
      bm.trigger_sig("AnomalyTableMarker_Rcr", safeJsonSerialize(l_0_9))
    else
      l_0_9.Error = l_0_8
      bm.trigger_sig("AnomalyTable_Error", safeJsonSerialize(l_0_9))
      return mp.CLEAN
    end
  end
  local l_0_19 = (l_0_17 - l_0_18) / 60
  local l_0_20 = l_0_1 .. "_" .. l_0_6
  local l_0_21 = MpCommon.AnomalyEventLookup(l_0_15, l_0_20, 1)
  if not l_0_21 then
    if 43200 < l_0_19 then
      l_0_9.minutes_elapsed = l_0_19
      l_0_9.isTest = "false"
      l_0_9.processAttrib = l_0_2
      bm.add_related_string("AdditionalInfo", safeJsonSerialize(l_0_9), bm.RelatedStringBMReport)
      return mp.INFECTED
    else
      l_0_7, l_0_8 = pcall(MpCommon.AnomalyEventUpdate, l_0_15, l_0_20, 1, 1)
    end
  else
    local l_0_22 = l_0_21.Count + 1
    l_0_7, l_0_8 = pcall(MpCommon.AnomalyEventUpdate, l_0_15, l_0_20, l_0_22, 1)
  end
  if not l_0_7 then
    l_0_9.Key = l_0_20
    l_0_9.Error = l_0_8
    bm.trigger_sig("AnomalyTable_Error", safeJsonSerialize(l_0_9))
  end
end
return mp.CLEAN
