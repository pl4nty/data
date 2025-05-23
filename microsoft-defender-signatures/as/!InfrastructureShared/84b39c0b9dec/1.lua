-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\84b39c0b9dec\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if not l_0_0 or not l_0_0.ppid then
  return mp.CLEAN
end
if not (MpCommon.GetProcessAttributeValue)(l_0_0.ppid, "inherit:PFApp_Parent") then
  local l_0_2 = (MpCommon.GetProcessAttributeValue)(l_0_0.ppid, "PFApp_Parent")
  do
    if not l_0_2 then
      local l_0_1 = "ruby.exe"
    end
    local l_0_3 = nil
    if not (bm.get_connection_string)() then
      return mp.CLEAN
    end
    local l_0_4 = nil
    if not ((bm.get_connection_string)()):match("Uri=(.-;)") then
      return mp.CLEAN
    end
    local l_0_5 = nil
    if not (((bm.get_connection_string)()):match("Uri=(.-;)")):match("^%a+://([^:/]+)") then
      return mp.CLEAN
    end
    local l_0_6 = (string.lower)((((bm.get_connection_string)()):match("Uri=(.-;)")):match("^%a+://([^:/]+)"))
    local l_0_7 = nil
    local l_0_8 = (MpCommon.AnomalyEventLookup)("PFApp_HOST", "MarkerRecord_" .. l_0_3, 1)
    local l_0_9 = nil
    local l_0_10, l_0_11 = (MpCommon.GetCurrentTimeT)(), nil
    local l_0_12 = nil
    if l_0_8 and l_0_8.Count then
      l_0_10 = l_0_8.Count
    end
    l_0_10 = l_0_9
    l_0_11 = pcall(MpCommon.AnomalyEventUpdate, l_0_7, "MarkerRecord_" .. l_0_3, l_0_9, 1)
    if l_0_11 then
      (bm.trigger_sig)("AnomalyTableMarker_Rcr", safeJsonSerialize({TrackedProcess = l_0_3, SignatureName = "Behavior:Win32/PFAppAnomalousOutbound.C", AnomalyTableName = "Appomaly_Network_HOST"}))
    else
      -- DECOMPILER ERROR at PC105: Confused about usage of register: R12 in 'UnsetPending'

      -- DECOMPILER ERROR at PC105: Confused about usage of register: R12 in 'UnsetPending'

      ;
      ({TrackedProcess = l_0_3, SignatureName = "Behavior:Win32/PFAppAnomalousOutbound.C", AnomalyTableName = "Appomaly_Network_HOST"}).Error = l_0_12
      -- DECOMPILER ERROR at PC110: Confused about usage of register: R12 in 'UnsetPending'

      ;
      (bm.trigger_sig)("AnomalyTable_Error", safeJsonSerialize({TrackedProcess = l_0_3, SignatureName = "Behavior:Win32/PFAppAnomalousOutbound.C", AnomalyTableName = "Appomaly_Network_HOST"}))
      return mp.CLEAN
    end
    local l_0_13 = nil
    local l_0_14 = (l_0_9 - l_0_10) / 60
    local l_0_15 = nil
    if not (MpCommon.AnomalyEventLookup)(l_0_7, l_0_3 .. "_" .. l_0_6, 1) then
      if l_0_14 > 43200 then
        l_0_13.minutes_elapsed = l_0_14
        l_0_13.isTest = "false"
        l_0_13.processAttrib = l_0_2
        ;
        (bm.add_related_string)("AdditionalInfo", safeJsonSerialize(l_0_13), bm.RelatedStringBMReport)
        return mp.INFECTED
      else
        -- DECOMPILER ERROR at PC156: Overwrote pending register: R11 in 'AssignReg'

        l_0_11 = pcall(MpCommon.AnomalyEventUpdate, l_0_7, l_0_15, 1, 1)
      end
    else
      local l_0_16 = nil
      -- DECOMPILER ERROR at PC169: Overwrote pending register: R11 in 'AssignReg'

      l_0_11 = pcall(MpCommon.AnomalyEventUpdate, l_0_7, l_0_15, ((MpCommon.AnomalyEventLookup)(l_0_7, l_0_3 .. "_" .. l_0_6, 1)).Count + 1, 1)
    end
    do
      if not l_0_11 then
        l_0_13.Key = l_0_15
        l_0_13.Error = l_0_12
        ;
        (bm.trigger_sig)("AnomalyTable_Error", safeJsonSerialize(l_0_13))
      end
      return mp.CLEAN
    end
  end
end

