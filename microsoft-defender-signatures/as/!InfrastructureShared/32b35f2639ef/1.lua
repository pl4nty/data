-- Threat: !InfrastructureShared
-- Name: 32b35f2639ef
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper, AppomalyHelpers

local l_0_0, l_0_1, l_0_2
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 then
  l_0_0 = this_sigattrlog[1].utf8p2
  l_0_0 = safeJsonDeserialize(l_0_0)
  if not l_0_0 then
    return mp.CLEAN
  end
  l_0_1 = l_0_0.ParentName or "None"
  l_0_2 = l_0_0.ProcessName
end
if not l_0_2 then
  return mp.CLEAN
end
local l_0_3 = l_0_0.CommandlineScoreIndicator
local l_0_4
if not l_0_3 then
  local l_0_5 = bm.get_current_process_startup_info()
  if l_0_5 then
    local l_0_6 = mp.GetProcessCommandLine(l_0_5.ppid)
    if not l_0_6 or l_0_6 == "" then
      return mp.CLEAN
    end
    local l_0_7, l_0_8 = CommandLineGrader(l_0_6)
    if l_0_7 < 5 then
      return mp.CLEAN
    end
    l_0_0.CommandlineScoreIndicator = l_0_8
    l_0_4 = l_0_8.CommandlineTokens
  else
    return mp.CLEAN
  end
else
  if 5 > l_0_3.Score then
    return mp.CLEAN
  end
  l_0_4 = l_0_3.CommandlineTokens
end
if versioning.IsSampled(100000, true, true, true) then
  local l_0_9 = l_0_0.AnomalyTableName or "Appomaly_ChildProcName_CmdLine_0"
  local l_0_10 = l_0_1 .. ";" .. l_0_2 .. ";" .. table.concat(l_0_4, "|")
  local l_0_11, l_0_12, l_0_13 = AnomalyTableCheck(l_0_9, l_0_10, 30, "MarkerRecord_" .. l_0_1)
  if l_0_11 and not l_0_12 then
    add_parents()
    local l_0_14 = {}
    l_0_14.CmdLineInfo = l_0_0
    l_0_14.TrackedProcess = l_0_1
    l_0_14.AnomalyTableName = l_0_9
    l_0_14.AnomalyTableInfo = l_0_13
    local l_0_15 = {
      ["cmd.exe"] = 10,
      ["powershell.exe"] = 10,
      ["reg.exe"] = 5,
      pwsh = 10,
      ["net.exe"] = 5,
      ["wmic.exe"] = 5,
      ["net1.exe"] = 5,
      ["rundll32.exe"] = 5
    }
    local l_0_16 = l_0_15[string.lower(l_0_2)] or 0
    l_0_14.ProcNameWeight = l_0_16
    bm.add_related_string("AdditionalInfo", safeJsonSerialize(l_0_14), bm.RelatedStringBMReport)
    local l_0_17 = GetPidFromParentImagePath(l_0_1)
    if l_0_17 then
      local l_0_18 = l_0_0.AttributeCategory or "generic"
      local l_0_19, l_0_20 = startTrackingApp(l_0_17.ppid, l_0_1, l_0_18, l_0_0.AttributeName)
      if not l_0_19 then
        bm.trigger_sig("ProcAttribError", safeJsonSerialize(l_0_20))
      else
        local l_0_21 = l_0_9 .. "[" .. l_0_17.ppid:match("pid:(%d+)") .. "]"
        IncreaseProcessAnomalyScore(l_0_17.ppid, 10, l_0_21, l_0_0.AttributeName, l_0_14)
      end
    end
    return mp.INFECTED
  end
else
  local l_0_22 = l_0_0.AnomalyTableName or "Appomaly_ChildProcName_CmdLine_0"
  local l_0_23 = MpCommon.AnomalyEventLookup(l_0_22, "MarkerRecord_" .. l_0_1, 1)
  local l_0_24 = MpCommon.GetCurrentTimeT()
  local l_0_25 = l_0_24
  local l_0_26 = l_0_1 .. ";" .. l_0_2 .. ";" .. table.concat(l_0_4, "|")
  local l_0_27 = {}
  l_0_27.CmdLineInfo = l_0_0
  l_0_27.TrackedProcess = l_0_1
  l_0_27.AnomalyTableName = l_0_22
  local l_0_28, l_0_29
  if l_0_23 and l_0_23.Count then
    l_0_25 = l_0_23.Count
    local l_0_30 = (l_0_24 - l_0_25) / 60
    local l_0_31 = MpCommon.AnomalyEventLookup(l_0_22, l_0_26, 1)
    if not l_0_31 then
      if 43200 < l_0_30 then
        add_parents()
        local l_0_32 = {
          ["cmd.exe"] = 10,
          ["powershell.exe"] = 10,
          ["reg.exe"] = 5,
          pwsh = 10,
          ["net.exe"] = 5,
          ["wmic.exe"] = 5,
          ["net1.exe"] = 5,
          ["rundll32.exe"] = 5
        }
        local l_0_33 = l_0_32[string.lower(l_0_2)] or 0
        l_0_27.ProcNameWeight = l_0_33
        bm.add_related_string("AdditionalInfo", safeJsonSerialize(l_0_27), bm.RelatedStringBMReport)
        local l_0_34 = GetPidFromParentImagePath(l_0_1)
        if l_0_34 then
          local l_0_35 = l_0_0.AttributeCategory or "generic"
          local l_0_36, l_0_37 = startTrackingApp(l_0_34.ppid, l_0_1, l_0_35, l_0_0.AttributeName)
          if not l_0_36 then
            bm.trigger_sig("ProcAttribError", safeJsonSerialize(l_0_37))
          else
            local l_0_38 = l_0_22 .. "[" .. l_0_34.ppid:match("pid:(%d+)") .. "]"
            IncreaseProcessAnomalyScore(l_0_34.ppid, 10, l_0_38, l_0_0.AttributeName, l_0_27)
          end
        end
        return mp.INFECTED
      else
        l_0_28, l_0_29 = pcall(MpCommon.AnomalyEventUpdate, l_0_22, l_0_26, 1, 1)
      end
    else
      local l_0_39 = l_0_31.Count
      l_0_28, l_0_29 = pcall(MpCommon.AnomalyEventUpdate, l_0_22, l_0_26, l_0_39 + 1, 1)
    end
  else
    l_0_25 = l_0_24
    l_0_28, l_0_29 = pcall(MpCommon.AnomalyEventUpdate, l_0_22, "MarkerRecord_" .. l_0_1, l_0_24, 1)
    if l_0_28 then
      bm.trigger_sig("AnomalyTableMarker_Rcr", safeJsonSerialize(l_0_27))
      l_0_28, l_0_29 = pcall(MpCommon.AnomalyEventUpdate, l_0_22, l_0_26, 1, 1)
    end
  end
  if not l_0_28 then
    l_0_27.Error = l_0_29
    bm.trigger_sig("AnomalyTable_Error", safeJsonSerialize(l_0_27))
  end
end
return mp.CLEAN
