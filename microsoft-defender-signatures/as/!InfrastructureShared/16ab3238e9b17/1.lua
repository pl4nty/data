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
      if (MpCommon.IsSampled)(100000, true, true, true) then
        local l_0_10 = {}
        local l_0_11 = "Appomaly_ChildProcName_Server"
        local l_0_12, l_0_13, l_0_14 = , AnomalyTableCheck(l_0_11, l_0_8 .. "_" .. l_0_7, 30, "MarkerRecord_" .. l_0_5)
        if l_0_13 and not l_0_14 then
          add_parents()
          l_0_10.ParentName = l_0_8
          l_0_10.ProcessName = l_0_7
          l_0_10.TrackedProcess = l_0_5
          l_0_10.SignatureName = "PFAppChildProc.A"
          l_0_10.AnomalyTableName = "Appomaly_ChildProcName_Server"
          l_0_10.AnomalyTableInfo = l_0_8 .. "_" .. l_0_7
          local l_0_15 = nil
          if (bm.get_current_process_startup_info)() then
            local l_0_16 = nil
            local l_0_17 = nil
            l_0_10.CommandlineScore = CommandLineGrader((mp.GetProcessCommandLine)(((bm.get_current_process_startup_info)()).ppid))
            l_0_10.CommandlineScoreIndicator = (mp.GetProcessCommandLine)(((bm.get_current_process_startup_info)()).ppid)
          end
          do
            local l_0_18 = nil
            do
              do
                local l_0_19 = nil
                l_0_10.ProcNameWeight = ({["cmd.exe"] = 10, ["powershell.exe"] = 10, ["reg.exe"] = 5, pwsh = 10, ["net.exe"] = 5, ["wmic.exe"] = 5, ["net1.exe"] = 5, ["rundll32.exe"] = 5})[(string.lower)(l_0_7)] or 0
                ;
                (bm.add_related_string)("AdditionalInfo", safeJsonSerialize(l_0_10), bm.RelatedStringBMReport)
                do return mp.INFECTED end
                local l_0_20 = nil
                local l_0_21 = nil
                local l_0_22 = (MpCommon.AnomalyEventLookup)("Appomaly_ChildProcName_Server", "MarkerRecord_" .. l_0_5, 1)
                local l_0_23 = nil
                local l_0_24 = (MpCommon.GetCurrentTimeT)()
                local l_0_25, l_0_26 = l_0_8 .. "_" .. l_0_7, nil
                if l_0_22 and l_0_22.Count then
                  local l_0_27 = nil
                  local l_0_28 = (l_0_23 - l_0_24) / 60
                  if not (MpCommon.AnomalyEventLookup)(l_0_21, l_0_25, 1) then
                    if l_0_28 > 43200 then
                      add_parents()
                      l_0_20.AnomalyTableInfo = (MpCommon.AnomalyTableLookup)(l_0_21)
                      local l_0_29 = nil
                      if (bm.get_current_process_startup_info)() then
                        local l_0_30 = nil
                        local l_0_31 = nil
                        l_0_20.CommandlineScore = CommandLineGrader((mp.GetProcessCommandLine)(((bm.get_current_process_startup_info)()).ppid))
                        l_0_20.CommandlineScoreIndicator = (mp.GetProcessCommandLine)(((bm.get_current_process_startup_info)()).ppid)
                      end
                      do
                        local l_0_32 = nil
                        do
                          do
                            do
                              do
                                local l_0_33 = nil
                                l_0_20.ProcNameWeight = ({["cmd.exe"] = 10, ["powershell.exe"] = 10, ["reg.exe"] = 5, pwsh = 10, ["net.exe"] = 5, ["wmic.exe"] = 5, ["net1.exe"] = 5, ["rundll32.exe"] = 5})[(string.lower)(l_0_7)] or 0
                                ;
                                (bm.add_related_string)("AdditionalInfo", safeJsonSerialize(l_0_20), bm.RelatedStringBMReport)
                                do return mp.INFECTED end
                                l_0_26 = pcall(MpCommon.AnomalyEventUpdate, l_0_21, l_0_25, 1, 1)
                                -- DECOMPILER ERROR at PC314: Confused about usage of register: R14 in 'UnsetPending'

                                -- DECOMPILER ERROR at PC323: Overwrote pending register: R12 in 'AssignReg'

                                l_0_26 = pcall(MpCommon.AnomalyEventUpdate, l_0_21, l_0_25, l_0_29.Count + 1, 1)
                                -- DECOMPILER ERROR at PC326: Overwrote pending register: R9 in 'AssignReg'

                                -- DECOMPILER ERROR at PC337: Overwrote pending register: R12 in 'AssignReg'

                                l_0_26 = pcall(MpCommon.AnomalyEventUpdate, l_0_21, "MarkerRecord_" .. l_0_5, l_0_23, 1)
                                if l_0_26 then
                                  (bm.trigger_sig)("AnomalyTableMarker_Rcr", safeJsonSerialize(l_0_20))
                                  -- DECOMPILER ERROR at PC356: Overwrote pending register: R12 in 'AssignReg'

                                  l_0_26 = pcall(MpCommon.AnomalyEventUpdate, l_0_21, l_0_25, 1, 1)
                                end
                                if not l_0_26 then
                                  l_0_20.Error = l_0_27
                                  ;
                                  (bm.trigger_sig)("AnomalyTable_Error", safeJsonSerialize(l_0_20))
                                end
                                local l_0_34 = nil
                                -- DECOMPILER ERROR at PC388: Overwrote pending register: R9 in 'AssignReg'

                                ;
                                (bm.trigger_sig)("AnomalousChildCommandline", l_0_24({ParentName = l_0_8, TrackedProcess = l_0_5, ProcessName = l_0_7, Source = "BM", SignatureName = "Behavior:Win32/PFAppChildProc.A", AnomalyTableName = "Appomaly_ChildProcName_CmdLine", TableAge = GetAnomalyTableAge("Appomaly_ChildProcName_CmdLine"), AttributeName = "PFApp_Parent", AttributeCategory = "PFServers", CommandlineScoreIndicator = l_0_34.CommandlineScoreIndicator, CommandlineScore = l_0_34.CommandlineScore}))
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
          end
        end
      end
    end
  end
end

