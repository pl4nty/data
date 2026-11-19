-- Threat: !InfrastructureShared
-- Name: 16ab3238e9b17
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper, AppomalyHelpers

local l_0_0
if this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p1:match("([^\\]+)$")
elseif this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p1:match("([^\\]+)$")
elseif this_sigattrlog[4].matched then
  l_0_0 = this_sigattrlog[4].utf8p1:match("([^\\]+)$")
elseif this_sigattrlog[5].matched then
  l_0_0 = this_sigattrlog[5].utf8p1:match("([^\\]+)$")
elseif this_sigattrlog[6].matched then
  l_0_0 = this_sigattrlog[6].utf8p1:match("([^\\]+)$")
elseif this_sigattrlog[7].matched and this_sigattrlog[7].utf8p2:find(".home=.* start") then
  l_0_0 = this_sigattrlog[7].utf8p1:match("([^\\]+)$")
end
if not l_0_0 then
  return mp.CLEAN
end
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
local l_0_3
local l_0_4 = mp.GetParentProcInfo()
if l_0_4 and l_0_4.image_path then
  l_0_3 = l_0_4.image_path:match("([^\\]+)$")
end
l_0_3 = l_0_3 or "None"
local l_0_5 = {}
if versioning.IsSampled(100000, true, true, true) then
  local l_0_6 = "Appomaly_ChildProcName_Server_0"
  local l_0_7 = l_0_3 .. "_" .. l_0_2
  local l_0_8, l_0_9, l_0_10 = AnomalyTableCheck(l_0_6, l_0_7, 30, "MarkerRecord_" .. l_0_0)
  if l_0_8 and not l_0_9 then
    add_parents()
    l_0_5.ParentName = l_0_3
    l_0_5.ProcessName = l_0_2
    l_0_5.TrackedProcess = l_0_0
    l_0_5.SignatureName = "PFAppChildProc.A"
    l_0_5.AnomalyTableName = "Appomaly_ChildProcName_Server"
    l_0_5.AnomalyTableInfo = l_0_10
    local l_0_11 = bm.get_current_process_startup_info()
    if l_0_11 then
      local l_0_12 = mp.GetProcessCommandLine(l_0_11.ppid)
      local l_0_13, l_0_14 = CommandLineGrader(l_0_12)
      l_0_5.CommandlineScore = l_0_13
      l_0_5.CommandlineScoreIndicator = l_0_14
    end
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
    l_0_5.ProcNameWeight = l_0_16
    bm.add_related_string("AdditionalInfo", safeJsonSerialize(l_0_5), bm.RelatedStringBMReport)
    return mp.INFECTED
  end
else
  local l_0_17 = "Appomaly_ChildProcName_Server_0"
  local l_0_18 = MpCommon.AnomalyEventLookup(l_0_17, "MarkerRecord_" .. l_0_0, 1)
  local l_0_19 = MpCommon.GetCurrentTimeT()
  local l_0_20 = l_0_19
  local l_0_21 = l_0_3 .. "_" .. l_0_2
  local l_0_22, l_0_23
  l_0_5.ParentName = l_0_3
  l_0_5.ProcessName = l_0_2
  l_0_5.TrackedProcess = l_0_0
  l_0_5.SignatureName = "PFAppChildProc.A"
  l_0_5.AnomalyTableName = "Appomaly_ChildProcName_Server"
  if l_0_18 and l_0_18.Count then
    l_0_20 = l_0_18.Count
    local l_0_24 = (l_0_19 - l_0_20) / 60
    local l_0_25 = MpCommon.AnomalyEventLookup(l_0_17, l_0_21, 1)
    if not l_0_25 then
      if 43200 < l_0_24 then
        add_parents()
        l_0_5.AnomalyTableInfo = MpCommon.AnomalyTableLookup(l_0_17)
        local l_0_26 = bm.get_current_process_startup_info()
        if l_0_26 then
          local l_0_27 = mp.GetProcessCommandLine(l_0_26.ppid)
          local l_0_28, l_0_29 = CommandLineGrader(l_0_27)
          l_0_5.CommandlineScore = l_0_28
          l_0_5.CommandlineScoreIndicator = l_0_29
        end
        local l_0_30 = {
          ["cmd.exe"] = 10,
          ["powershell.exe"] = 10,
          ["reg.exe"] = 5,
          pwsh = 10,
          ["net.exe"] = 5,
          ["wmic.exe"] = 5,
          ["net1.exe"] = 5,
          ["rundll32.exe"] = 5
        }
        local l_0_31 = l_0_30[string.lower(l_0_2)] or 0
        l_0_5.ProcNameWeight = l_0_31
        bm.add_related_string("AdditionalInfo", safeJsonSerialize(l_0_5), bm.RelatedStringBMReport)
        return mp.INFECTED
      else
        l_0_22, l_0_23 = pcall(MpCommon.AnomalyEventUpdate, l_0_17, l_0_21, 1, 1)
      end
    else
      local l_0_32 = l_0_25.Count
      l_0_22, l_0_23 = pcall(MpCommon.AnomalyEventUpdate, l_0_17, l_0_21, l_0_32 + 1, 1)
    end
  else
    l_0_20 = l_0_19
    l_0_22, l_0_23 = pcall(MpCommon.AnomalyEventUpdate, l_0_17, "MarkerRecord_" .. l_0_0, l_0_19, 1)
    if l_0_22 then
      bm.trigger_sig("AnomalyTableMarker_Rcr", safeJsonSerialize(l_0_5))
      l_0_22, l_0_23 = pcall(MpCommon.AnomalyEventUpdate, l_0_17, l_0_21, 1, 1)
    end
  end
  if not l_0_22 then
    l_0_5.Error = l_0_23
    bm.trigger_sig("AnomalyTable_Error", safeJsonSerialize(l_0_5))
  end
end
local l_0_33 = {}
l_0_33.ParentName = l_0_3
l_0_33.TrackedProcess = l_0_0
l_0_33.ProcessName = l_0_2
l_0_33.Source = "BM"
l_0_33.SignatureName = "Behavior:Win32/PFAppChildProc.A"
l_0_33.AnomalyTableName = "Appomaly_ChildProcName_CmdLine"
l_0_33.TableAge = GetAnomalyTableAge("Appomaly_ChildProcName_CmdLine")
l_0_33.AttributeName = "PFApp_Parent"
l_0_33.AttributeCategory = "PFServers"
l_0_33.CommandlineScoreIndicator = l_0_5.CommandlineScoreIndicator
l_0_33.CommandlineScore = l_0_5.CommandlineScore
bm.trigger_sig("AnomalousChildCommandline", safeJsonSerialize(l_0_33))
return mp.CLEAN
