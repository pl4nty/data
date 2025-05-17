-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\21bb3f39c42bd\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
do
  if not (MpCommon.GetProcessAttributeValue)(l_0_0.ppid, "PFAppTracked") then
    local l_0_1, l_0_2 = (MpCommon.GetProcessAttributeValue)(l_0_0.ppid, "inherit:PFAppTracked")
  end
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R1 in 'UnsetPending'

  if not l_0_1 then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC21: Confused about usage of register: R1 in 'UnsetPending'

  local l_0_3 = nil
  if not safeJsonDeserialize(l_0_1) then
    return mp.CLEAN
  end
  local l_0_4 = nil
  local l_0_5 = (safeJsonDeserialize(l_0_1)).AppName
  if not (bm.get_imagepath)() then
    return mp.CLEAN
  end
  local l_0_6 = nil
  local l_0_7 = contains
  local l_0_8 = l_0_6
  l_0_7 = l_0_7(l_0_8, {"conhost.exe", "WerFault.exe"})
  if l_0_7 then
    l_0_7 = mp
    l_0_7 = l_0_7.CLEAN
    return l_0_7
  end
  l_0_7, l_0_8 = l_0_6:match, l_0_6
  l_0_7 = l_0_7(l_0_8, "([^\\]+)$")
  l_0_8 = "Appomaly_ChildProcName"
  local l_0_9 = (MpCommon.AnomalyEventLookup)(l_0_8, "MarkerRecord_" .. l_0_5, 1)
  local l_0_10 = nil
  local l_0_11 = (MpCommon.GetCurrentTimeT)()
  local l_0_12 = nil
  if (mp.GetParentProcInfo)() and ((mp.GetParentProcInfo)()).image_path then
    l_0_12 = (((mp.GetParentProcInfo)()).image_path):match("([^\\]+)$")
  end
  if not l_0_12 then
    l_0_12 = "None"
  end
  local l_0_13 = nil
  local l_0_14, l_0_15 = l_0_12 .. "_" .. l_0_7, nil
  local l_0_16 = nil
  if l_0_9 and l_0_9.Count then
    l_0_11 = l_0_9.Count
    local l_0_17 = {TrackedProcess = l_0_5, ParentName = l_0_12, SignatureName = "PFAppChildProc.B", AnomalyTableName = "Appomaly_ChildProcName", Key = l_0_14}
    local l_0_18 = (l_0_10 - l_0_11) / 60
    if not (MpCommon.AnomalyEventLookup)(l_0_8, l_0_14, 1) then
      if l_0_18 > 43200 then
        add_parents()
        l_0_17.AnomalyTableInfo = (MpCommon.AnomalyTableLookup)(l_0_8)
        local l_0_19 = nil
        local l_0_20, l_0_21 = , CommandLineGrader((mp.GetProcessCommandLine)(l_0_0.ppid))
        l_0_17.CommandlineScore = l_0_21
        l_0_17.CommandlineScoreIndicator = (mp.GetProcessCommandLine)(l_0_0.ppid)
        local l_0_22 = nil
        do
          do
            do
              local l_0_23 = nil
              l_0_17.ProcNameWeight = ({["cmd.exe"] = 10, ["powershell.exe"] = 10, ["reg.exe"] = 5, pwsh = 10, ["net.exe"] = 5, ["wmic.exe"] = 5, ["net1.exe"] = 5, ["rundll32.exe"] = 5})[(string.lower)(l_0_7)] or 0
              ;
              (bm.add_related_string)("AdditionalInfo", safeJsonSerialize(l_0_17), bm.RelatedStringBMReport)
              do return mp.INFECTED end
              l_0_15 = pcall(MpCommon.AnomalyEventUpdate, l_0_8, l_0_14, 1, 1)
              -- DECOMPILER ERROR at PC169: Confused about usage of register: R17 in 'UnsetPending'

              -- DECOMPILER ERROR at PC178: Overwrote pending register: R14 in 'AssignReg'

              l_0_15 = pcall(MpCommon.AnomalyEventUpdate, l_0_8, l_0_14, l_0_19.Count + 1, 1)
              l_0_11 = l_0_10
              -- DECOMPILER ERROR at PC192: Overwrote pending register: R14 in 'AssignReg'

              l_0_15 = pcall(MpCommon.AnomalyEventUpdate, l_0_8, "MarkerRecord_" .. l_0_5, l_0_10, 1)
              -- DECOMPILER ERROR at PC200: Confused about usage of register: R15 in 'UnsetPending'

              if l_0_15 then
                (bm.trigger_sig)("AnomalyTableMarker_Rcr", safeJsonSerialize(l_0_17))
                -- DECOMPILER ERROR at PC211: Overwrote pending register: R14 in 'AssignReg'

                l_0_15 = pcall(MpCommon.AnomalyEventUpdate, l_0_8, l_0_14, 1, 1)
              end
              -- DECOMPILER ERROR at PC215: Confused about usage of register: R15 in 'UnsetPending'

              -- DECOMPILER ERROR at PC215: Confused about usage of register: R15 in 'UnsetPending'

              if not l_0_15 then
                l_0_17.Error = l_0_16
                -- DECOMPILER ERROR at PC220: Confused about usage of register: R15 in 'UnsetPending'

                ;
                (bm.trigger_sig)("AnomalyTable_Error", safeJsonSerialize(l_0_17))
              end
              local l_0_24 = nil
              ;
              (bm.trigger_sig)("AnomalousChildCommandline", safeJsonSerialize({TrackedProcess = l_0_5, ParentName = l_0_12, ProcessName = l_0_7, Source = "BM", SignatureName = "PFAppChildProc.B", AnomalyTableName = "Appomaly_ChildProcName_CmdLine", TableAge = GetAnomalyTableAge("Appomaly_ChildProcName_CmdLine"), AttributeName = "PFAppTracked", AttributeCategory = "programfiles_Net", CommandlineScoreIndicator = l_0_24.CommandlineScoreIndicator, CommandlineScore = l_0_24.CommandlineScore}))
              return mp.CLEAN
            end
          end
        end
      end
    end
  end
end

