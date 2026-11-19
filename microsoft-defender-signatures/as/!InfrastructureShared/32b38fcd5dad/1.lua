-- Threat: !InfrastructureShared
-- Name: 32b38fcd5dad
-- Type: 21
-- Includes: LuaFuncHelper, AppomalyHelpers

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 then
  l_0_0 = safeJsonDeserialize(this_sigattrlog[1].utf8p2)
end
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = UrlGrader(l_0_0.Url, "FAppAnomalousOutbound.A", false)
if l_0_1 == 0 then
  return mp.CLEAN
end
local l_0_2
local l_0_3 = l_0_0.AttributeValue
local l_0_4 = safeJsonDeserialize(l_0_3)
if l_0_4 then
  l_0_2 = l_0_4.AppName
else
  l_0_2 = l_0_3:match("[^|]+")
end
if not l_0_2 then
  return mp.CLEAN
end
local l_0_5 = {
  "Appomaly_Network_HOST",
  "Appomaly_Network_UserAgent"
}
if versioning.IsSampled(100000, true, true, true) then
  for l_0_6, l_0_7 in ipairs(l_0_5) do
    local l_0_8 = {}
    l_0_8.SignatureName = "Behavior:Win32/PFAppAnomalousOutbound.A"
    l_0_8.Url = l_0_0.Url
    l_0_8.AnomalyTableName = l_0_7
    local l_0_9, l_0_10
    local l_0_11 = bm.get_current_process_startup_info()
    if l_0_7 == "Appomaly_Network_HOST" then
      l_0_9 = l_0_2 .. "_" .. l_0_0.HostName
      l_0_10 = l_0_7 .. "[" .. l_0_11.ppid:match("pid:(%d+)") .. "][" .. l_0_0.HostName .. "]"
    elseif l_0_7 == "Appomaly_Network_UserAgent" and l_0_0.UserAgent ~= "" then
      l_0_9 = l_0_2 .. "_" .. l_0_0.UserAgent
      l_0_10 = l_0_7 .. "[" .. l_0_11.ppid:match("pid:(%d+)") .. "][" .. l_0_0.UserAgent .. "]"
    end
    if l_0_9 then
      local l_0_12, l_0_13, l_0_14 = AnomalyTableCheck(l_0_7, l_0_9, 30, "MarkerRecord_" .. l_0_2)
      if l_0_12 and not l_0_13 then
        l_0_8.AnomalyTableInfo = l_0_14
        bm.add_related_string("AdditionalInfo", safeJsonSerialize(l_0_8), bm.RelatedStringBMReport)
        bm.trigger_sig(l_0_7, safeJsonSerialize(l_0_8))
        if l_0_11 and l_0_0.AttributeName then
          local l_0_15, l_0_16 = UrlGrader(l_0_0.Url, "BM_PFAppAnomalousOutbound.A")
          if l_0_15 == 0 and l_0_16 and l_0_16.URL_CLEAN then
            return mp.CLEAN
          end
          l_0_8.Url_ScoringInfo = l_0_16
          IncreaseProcessAnomalyScore(l_0_11.ppid, 10 + l_0_15, l_0_10, l_0_0.AttributeName, l_0_8)
        end
      end
    end
  end
else
  local l_0_17 = MpCommon.GetCurrentTimeT()
  for l_0_18, l_0_19 in ipairs(l_0_5) do
    local l_0_20 = {}
    l_0_20.SignatureName = "Behavior:Win32/PFAppAnomalousOutbound.A"
    l_0_20.Url = l_0_0.Url
    l_0_20.AnomalyTableName = l_0_19
    l_0_20.TableAge = GetAnomalyTableAge(l_0_19)
    local l_0_21 = MpCommon.AnomalyEventLookup(l_0_19, "MarkerRecord_" .. l_0_2, 1)
    local l_0_22 = l_0_17
    if l_0_21 then
      if l_0_21.Count and l_0_21.Count ~= -1 then
        l_0_22 = l_0_21.Count
      else
        local l_0_23 = {}
        l_0_23.SignatureName = "PFAppAnomalousOutbound.A"
        l_0_23.Error = "Record has been added with value -1."
        l_0_23.AnomalyTableName = l_0_19
        l_0_23.Key = "MarkerRecord_" .. l_0_2
        bm.trigger_sig("AnomalyTable_Error", safeJsonSerialize(l_0_23))
        pcall(MpCommon.AnomalyEventUpdate, l_0_19, "MarkerRecord_" .. l_0_2, l_0_17, 1)
      end
    else
      local l_0_24, l_0_25 = pcall(MpCommon.AnomalyEventUpdate, l_0_19, "MarkerRecord_" .. l_0_2, l_0_17, 1)
      if l_0_24 then
        l_0_20.AnomalyTableName = l_0_19
        bm.trigger_sig("AnomalyTableMarker_Rcr", safeJsonSerialize(l_0_20))
      else
        l_0_20.Error = tostring(l_0_25) .. "Failed to set the marker record for the first time"
        bm.trigger_sig("AnomalyTable_Error", safeJsonSerialize(l_0_20))
      end
    end
    local l_0_26, l_0_27
    local l_0_28 = bm.get_current_process_startup_info()
    if l_0_19 == "Appomaly_Network_HOST" then
      l_0_26 = l_0_2 .. "_" .. l_0_0.HostName
      l_0_27 = l_0_19 .. "[" .. l_0_28.ppid:match("pid:(%d+)") .. "][" .. l_0_0.HostName .. "]"
    elseif l_0_19 == "Appomaly_Network_UserAgent" and l_0_0.UserAgent ~= "" then
      l_0_26 = l_0_2 .. "_" .. l_0_0.UserAgent
      l_0_27 = l_0_19 .. "[" .. l_0_28.ppid:match("pid:(%d+)") .. "][" .. l_0_0.UserAgent .. "]"
    end
    if l_0_26 then
      local l_0_29, l_0_30
      local l_0_31 = MpCommon.AnomalyEventLookup(l_0_19, l_0_26, 1)
      if not l_0_31 then
        local l_0_32 = (l_0_17 - l_0_22) / 60
        local l_0_33 = l_0_32 / 1440
        if 30 < l_0_33 then
          l_0_20.Days_elapsed = l_0_33
          bm.add_related_string("AdditionalInfo", safeJsonSerialize(l_0_20), bm.RelatedStringBMReport)
          bm.trigger_sig(l_0_19, safeJsonSerialize(l_0_20))
          if l_0_28 and l_0_0.AttributeName then
            local l_0_34, l_0_35 = UrlGrader(l_0_0.Url, "BM_PFAppAnomalousOutbound.A")
            if l_0_34 == 0 and l_0_35 and l_0_35.URL_CLEAN then
              return mp.CLEAN
            end
            l_0_20.Url_ScoringInfo = l_0_35
            IncreaseProcessAnomalyScore(l_0_28.ppid, 10 + l_0_34, l_0_27, l_0_0.AttributeName, l_0_20)
          end
        else
          l_0_29, l_0_30 = pcall(MpCommon.AnomalyEventUpdate, l_0_19, l_0_26, 1, 1)
          l_0_20.Error = tostring(l_0_30) .. ";Failed to add the key"
        end
      else
        local l_0_36 = l_0_31.Count + 1
        l_0_29, l_0_30 = pcall(MpCommon.AnomalyEventUpdate, l_0_19, l_0_26, l_0_36, 1)
        l_0_20.Error = tostring(l_0_30) .. ";Failed to update the key"
      end
      if not l_0_29 then
        bm.trigger_sig("AnomalyTable_Error", safeJsonSerialize(l_0_20))
      end
    end
  end
end
return mp.CLEAN
