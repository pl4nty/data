-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\16ab3238e9b17\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC11: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[2]).matched then
    local l_0_0 = nil
  else
  end
  -- DECOMPILER ERROR at PC37: Overwrote pending register: R0 in 'AssignReg'

  do
    if not (this_sigattrlog[3]).matched or (this_sigattrlog[4]).matched then
      local l_0_1 = ((this_sigattrlog[3]).utf8p1):match("([^\\]+)$")
    else
    end
    -- DECOMPILER ERROR at PC63: Overwrote pending register: R0 in 'AssignReg'

    do
      if not (this_sigattrlog[5]).matched or (this_sigattrlog[6]).matched then
        local l_0_2, l_0_3, l_0_4 = ((this_sigattrlog[5]).utf8p1):match("([^\\]+)$")
      else
      end
      if not (this_sigattrlog[7]).matched or not ((this_sigattrlog[7]).utf8p2):find(".home=.* start") or not ((this_sigattrlog[7]).utf8p1):match("([^\\]+)$") then
        return mp.CLEAN
      end
      local l_0_5 = nil
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
      l_0_7 = (l_0_7(l_0_8, "([^\\]+)$"))
      l_0_8 = nil
      if (mp.GetParentProcInfo)() and ((mp.GetParentProcInfo)()).image_path then
        l_0_8 = (((mp.GetParentProcInfo)()).image_path):match("([^\\]+)$")
      end
      if not l_0_8 then
        l_0_8 = "None"
      end
      local l_0_9 = nil
      local l_0_10 = nil
      local l_0_11 = (MpCommon.AnomalyEventLookup)("Appomaly_ChildProcName_Server", "MarkerRecord_" .. l_0_5, 1)
      local l_0_12 = nil
      local l_0_13 = (MpCommon.GetCurrentTimeT)()
      local l_0_14, l_0_15 = l_0_8 .. "_" .. l_0_7, nil
      local l_0_16 = nil
      if l_0_11 and l_0_11.Count then
        l_0_13 = l_0_11.Count
        local l_0_17 = {ParentName = l_0_8, ProcessName = l_0_7, TrackedProcess = l_0_5, SignatureName = "PFAppChildProc.A", AnomalyTableName = "Appomaly_ChildProcName_Server"}
        local l_0_18 = (l_0_12 - l_0_13) / 60
        if not (MpCommon.AnomalyEventLookup)(l_0_10, l_0_14, 1) then
          if l_0_18 > 43200 then
            add_parents()
            l_0_17.AnomalyTableInfo = (MpCommon.AnomalyTableLookup)(l_0_10)
            local l_0_19 = nil
            if (bm.get_current_process_startup_info)() then
              local l_0_20 = nil
              local l_0_21 = nil
              l_0_17.CommandlineScore = CommandLineGrader((mp.GetProcessCommandLine)(((bm.get_current_process_startup_info)()).ppid))
              l_0_17.CommandlineScoreIndicator = (mp.GetProcessCommandLine)(((bm.get_current_process_startup_info)()).ppid)
            end
            do
              local l_0_22 = nil
              do
                do
                  do
                    local l_0_23 = nil
                    l_0_17.ProcNameWeight = ({["cmd.exe"] = 10, ["powershell.exe"] = 10, ["reg.exe"] = 5, pwsh = 10, ["net.exe"] = 5, ["wmic.exe"] = 5, ["net1.exe"] = 5, ["rundll32.exe"] = 5})[(string.lower)(l_0_7)] or 0
                    ;
                    (bm.add_related_string)("AdditionalInfo", safeJsonSerialize(l_0_17), bm.RelatedStringBMReport)
                    do return mp.INFECTED end
                    l_0_15 = pcall(MpCommon.AnomalyEventUpdate, l_0_10, l_0_14, 1, 1)
                    -- DECOMPILER ERROR at PC235: Confused about usage of register: R14 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC244: Overwrote pending register: R11 in 'AssignReg'

                    l_0_15 = pcall(MpCommon.AnomalyEventUpdate, l_0_10, l_0_14, l_0_19.Count + 1, 1)
                    l_0_13 = l_0_12
                    -- DECOMPILER ERROR at PC258: Overwrote pending register: R11 in 'AssignReg'

                    l_0_15 = pcall(MpCommon.AnomalyEventUpdate, l_0_10, "MarkerRecord_" .. l_0_5, l_0_12, 1)
                    -- DECOMPILER ERROR at PC266: Confused about usage of register: R12 in 'UnsetPending'

                    if l_0_15 then
                      (bm.trigger_sig)("AnomalyTableMarker_Rcr", safeJsonSerialize(l_0_17))
                      -- DECOMPILER ERROR at PC277: Overwrote pending register: R11 in 'AssignReg'

                      l_0_15 = pcall(MpCommon.AnomalyEventUpdate, l_0_10, l_0_14, 1, 1)
                    end
                    -- DECOMPILER ERROR at PC281: Confused about usage of register: R12 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC281: Confused about usage of register: R12 in 'UnsetPending'

                    if not l_0_15 then
                      l_0_17.Error = l_0_16
                      -- DECOMPILER ERROR at PC286: Confused about usage of register: R12 in 'UnsetPending'

                      ;
                      (bm.trigger_sig)("AnomalyTable_Error", safeJsonSerialize(l_0_17))
                    end
                    local l_0_24 = nil
                    ;
                    (bm.trigger_sig)("AnomalousChildCommandline", safeJsonSerialize({ParentName = l_0_8, TrackedProcess = l_0_5, ProcessName = l_0_7, Source = "BM", SignatureName = "Behavior:Win32/PFAppChildProc.A", AnomalyTableName = "Appomaly_ChildProcName_CmdLine", TableAge = GetAnomalyTableAge("Appomaly_ChildProcName_CmdLine"), AttributeName = "PFApp_Parent", AttributeCategory = "PFServers", CommandlineScoreIndicator = l_0_24.CommandlineScoreIndicator, CommandlineScore = l_0_24.CommandlineScore}))
                    return mp.CLEAN
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

