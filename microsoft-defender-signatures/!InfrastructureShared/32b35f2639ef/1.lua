-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b35f2639ef\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 then
  local l_0_0, l_0_2, l_0_3 = nil, nil, nil
  l_0_0 = safeJsonDeserialize(l_0_0)
  if not l_0_0 then
    return mp.CLEAN
  end
  l_0_2 = l_0_0.ParentName or "None"
  l_0_3 = l_0_0.ProcessName
  do
    local l_0_5 = nil
    -- DECOMPILER ERROR at PC27: freeLocal<0 in 'ReleaseLocals'

    -- DECOMPILER ERROR at PC27: Confused about usage of register: R2 in 'UnsetPending'

    if not l_0_3 then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC32: Confused about usage of register: R0 in 'UnsetPending'

    local l_0_6 = nil
    local l_0_7 = nil
    if not l_0_0.CommandlineScoreIndicator then
      local l_0_8 = nil
      if (bm.get_current_process_startup_info)() then
        local l_0_9 = nil
        if not (mp.GetProcessCommandLine)(((bm.get_current_process_startup_info)()).ppid) or (mp.GetProcessCommandLine)(((bm.get_current_process_startup_info)()).ppid) == "" then
          return mp.CLEAN
        end
        local l_0_10, l_0_11 = nil
        if CommandLineGrader((mp.GetProcessCommandLine)(((bm.get_current_process_startup_info)()).ppid)) < 5 then
          return mp.CLEAN
        end
        l_0_6.CommandlineScoreIndicator = (mp.GetProcessCommandLine)(((bm.get_current_process_startup_info)()).ppid)
        l_0_10 = ((mp.GetProcessCommandLine)(((bm.get_current_process_startup_info)()).ppid)).CommandlineTokens
      else
        do
          do
            do return mp.CLEAN end
            -- DECOMPILER ERROR at PC67: Confused about usage of register: R3 in 'UnsetPending'

            if l_0_9.Score < 5 then
              return mp.CLEAN
            end
            -- DECOMPILER ERROR at PC73: Confused about usage of register: R3 in 'UnsetPending'

            do
              if not l_0_6.AnomalyTableName then
                local l_0_12, l_0_13 = nil
              end
              -- DECOMPILER ERROR at PC89: Confused about usage of register: R2 in 'UnsetPending'

              local l_0_14 = nil
              local l_0_15, l_0_16, l_0_17 = nil
              if AnomalyTableCheck(not (MpCommon.IsSampled)(100000, true, true, true) or "Appomaly_ChildProcName_CmdLine", l_0_7 .. ";" .. l_0_12 .. ";" .. (table.concat)(l_0_9.CommandlineTokens, "|"), 30, "MarkerRecord_" .. l_0_7) and not not (MpCommon.IsSampled)(100000, true, true, true) or "Appomaly_ChildProcName_CmdLine" then
                add_parents()
                local l_0_18 = nil
                local l_0_19 = nil
                do
                  local l_0_20, l_0_21 = nil
                  ;
                  (bm.add_related_string)("AdditionalInfo", safeJsonSerialize({CmdLineInfo = l_0_6, TrackedProcess = l_0_7, AnomalyTableName = l_0_17, AnomalyTableInfo = l_0_7 .. ";" .. l_0_12 .. ";" .. (table.concat)(l_0_9.CommandlineTokens, "|"), ProcNameWeight = ({["cmd.exe"] = 10, ["powershell.exe"] = 10, ["reg.exe"] = 5, pwsh = 10, ["net.exe"] = 5, ["wmic.exe"] = 5, ["net1.exe"] = 5, ["rundll32.exe"] = 5})[(string.lower)(l_0_14)] or 0}), bm.RelatedStringBMReport)
                  local l_0_22 = nil
                  do
                    if not l_0_6.AttributeCategory then
                      local l_0_23, l_0_24 = nil
                    end
                    local l_0_25, l_0_26 = nil
                    if not startTrackingApp((GetPidFromParentImagePath(l_0_7)).ppid, l_0_7, not GetPidFromParentImagePath(l_0_7) or "generic", l_0_6.AttributeName) then
                      (bm.trigger_sig)("ProcAttribError", safeJsonSerialize(R20_PC165))
                    else
                      local l_0_27 = nil
                      IncreaseProcessAnomalyScore((GetPidFromParentImagePath(l_0_7)).ppid, 10, l_0_17 .. "[" .. ((GetPidFromParentImagePath(l_0_7)).ppid):match("pid:(%d+)") .. "]", l_0_6.AttributeName, l_0_26)
                    end
                    do
                      do
                        do return mp.INFECTED end
                        do
                          local l_0_28, l_0_29 = nil
                          local l_0_30 = nil
                          local l_0_31 = nil
                          local l_0_32 = nil
                          local l_0_33 = nil
                          local l_0_34 = (MpCommon.AnomalyEventLookup)(l_0_6.AnomalyTableName or "Appomaly_ChildProcName_CmdLine", "MarkerRecord_" .. l_0_7, 1)
                          local l_0_35, l_0_36 = , (MpCommon.GetCurrentTimeT)()
                          if l_0_34 and l_0_34.Count then
                            local l_0_37 = l_0_7 .. ";" .. l_0_30 .. ";" .. (table.concat)(l_0_32, "|")
                            local l_0_38 = {CmdLineInfo = l_0_6, TrackedProcess = l_0_7, AnomalyTableName = l_0_33}
                            if not (MpCommon.AnomalyEventLookup)(l_0_33, l_0_37, 1) then
                              if (l_0_35 - l_0_36) / 60 > 43200 then
                                add_parents()
                                local l_0_39 = nil
                                do
                                  local l_0_40, l_0_41 = nil
                                  l_0_38.ProcNameWeight = ({["cmd.exe"] = 10, ["powershell.exe"] = 10, ["reg.exe"] = 5, pwsh = 10, ["net.exe"] = 5, ["wmic.exe"] = 5, ["net1.exe"] = 5, ["rundll32.exe"] = 5})[(string.lower)(l_0_30)] or 0
                                  ;
                                  (bm.add_related_string)("AdditionalInfo", safeJsonSerialize(l_0_38), bm.RelatedStringBMReport)
                                  local l_0_42 = nil
                                  do
                                    if not l_0_6.AttributeCategory then
                                      local l_0_43, l_0_44 = nil
                                    end
                                    local l_0_45, l_0_46 = nil
                                    if not startTrackingApp((GetPidFromParentImagePath(l_0_7)).ppid, l_0_7, not GetPidFromParentImagePath(l_0_7) or "generic", l_0_6.AttributeName) then
                                      (bm.trigger_sig)("ProcAttribError", safeJsonSerialize(R24_PC287))
                                    else
                                      local l_0_47 = nil
                                      IncreaseProcessAnomalyScore((GetPidFromParentImagePath(l_0_7)).ppid, 10, l_0_33 .. "[" .. ((GetPidFromParentImagePath(l_0_7)).ppid):match("pid:(%d+)") .. "]", l_0_6.AttributeName, l_0_38)
                                    end
                                    do
                                      do
                                        do
                                          do
                                            do return mp.INFECTED end
                                            -- DECOMPILER ERROR at PC320: Confused about usage of register: R14 in 'UnsetPending'

                                            -- DECOMPILER ERROR at PC329: Overwrote pending register: R12 in 'AssignReg'

                                            -- DECOMPILER ERROR at PC330: Overwrote pending register: R11 in 'AssignReg'

                                            -- DECOMPILER ERROR at PC332: Overwrote pending register: R8 in 'AssignReg'

                                            -- DECOMPILER ERROR at PC343: Overwrote pending register: R12 in 'AssignReg'

                                            -- DECOMPILER ERROR at PC344: Overwrote pending register: R11 in 'AssignReg'

                                            -- DECOMPILER ERROR at PC351: Confused about usage of register: R10 in 'UnsetPending'

                                            if pcall(MpCommon.AnomalyEventUpdate, l_0_33, l_0_37, 1, 1) then
                                              (bm.trigger_sig)("AnomalyTableMarker_Rcr", safeJsonSerialize(l_0_38))
                                              -- DECOMPILER ERROR at PC358: Confused about usage of register: R9 in 'UnsetPending'

                                              -- DECOMPILER ERROR at PC362: Overwrote pending register: R12 in 'AssignReg'

                                            end
                                            -- DECOMPILER ERROR at PC366: Confused about usage of register: R10 in 'UnsetPending'

                                            -- DECOMPILER ERROR at PC366: Confused about usage of register: R10 in 'UnsetPending'

                                            if not pcall(MpCommon.AnomalyEventUpdate, l_0_33, l_0_37, 1, 1) then
                                              l_0_38.Error = R12_PC366
                                              -- DECOMPILER ERROR at PC371: Confused about usage of register: R10 in 'UnsetPending'

                                              ;
                                              (bm.trigger_sig)("AnomalyTable_Error", safeJsonSerialize(l_0_38))
                                            end
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
          end
        end
      end
    end
  end
end

