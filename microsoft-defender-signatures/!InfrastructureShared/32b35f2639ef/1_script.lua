-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b35f2639ef\1_luac 

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
              local l_0_12, l_0_13 = nil
              local l_0_14 = nil
              local l_0_15 = nil
              local l_0_16 = l_0_9.CommandlineTokens
              local l_0_17 = nil
              local l_0_18 = (MpCommon.AnomalyEventLookup)(l_0_6.AnomalyTableName or "Appomaly_ChildProcName_CmdLine", "MarkerRecord_" .. l_0_7, 1)
              local l_0_19, l_0_20 = , (MpCommon.GetCurrentTimeT)()
              if l_0_18 and l_0_18.Count then
                local l_0_21 = l_0_7 .. ";" .. l_0_14 .. ";" .. (table.concat)(l_0_16, "|")
                local l_0_22 = {CmdLineInfo = l_0_6, TrackedProcess = l_0_7, AnomalyTableName = l_0_17}
                if not (MpCommon.AnomalyEventLookup)(l_0_17, l_0_21, 1) then
                  if (l_0_19 - l_0_20) / 60 > 43200 then
                    add_parents()
                    local l_0_23 = nil
                    do
                      local l_0_24, l_0_25 = nil
                      l_0_22.ProcNameWeight = ({["cmd.exe"] = 10, ["powershell.exe"] = 10, ["reg.exe"] = 5, pwsh = 10, ["net.exe"] = 5, ["wmic.exe"] = 5, ["net1.exe"] = 5, ["rundll32.exe"] = 5})[(string.lower)(l_0_14)] or 0
                      ;
                      (bm.add_related_string)("AdditionalInfo", safeJsonSerialize(l_0_22), bm.RelatedStringBMReport)
                      local l_0_26 = nil
                      do
                        if not l_0_6.AttributeCategory then
                          local l_0_27, l_0_28 = nil
                        end
                        local l_0_29, l_0_30 = nil
                        if not startTrackingApp((GetPidFromParentImagePath(l_0_7)).ppid, l_0_7, not GetPidFromParentImagePath(l_0_7) or "generic", l_0_6.AttributeName) then
                          (bm.trigger_sig)("ProcAttribError", safeJsonSerialize(R24_PC174))
                        else
                          local l_0_31 = nil
                          IncreaseProcessAnomalyScore((GetPidFromParentImagePath(l_0_7)).ppid, 10, l_0_17 .. "[" .. ((GetPidFromParentImagePath(l_0_7)).ppid):match("pid:(%d+)") .. "]", l_0_6.AttributeName, l_0_22)
                        end
                        do
                          do
                            do
                              do return mp.INFECTED end
                              -- DECOMPILER ERROR at PC207: Confused about usage of register: R14 in 'UnsetPending'

                              -- DECOMPILER ERROR at PC216: Overwrote pending register: R12 in 'AssignReg'

                              -- DECOMPILER ERROR at PC217: Overwrote pending register: R11 in 'AssignReg'

                              -- DECOMPILER ERROR at PC219: Overwrote pending register: R8 in 'AssignReg'

                              -- DECOMPILER ERROR at PC230: Overwrote pending register: R12 in 'AssignReg'

                              -- DECOMPILER ERROR at PC231: Overwrote pending register: R11 in 'AssignReg'

                              -- DECOMPILER ERROR at PC238: Confused about usage of register: R10 in 'UnsetPending'

                              if pcall(MpCommon.AnomalyEventUpdate, l_0_17, l_0_21, 1, 1) then
                                (bm.trigger_sig)("AnomalyTableMarker_Rcr", safeJsonSerialize(l_0_22))
                                -- DECOMPILER ERROR at PC245: Confused about usage of register: R9 in 'UnsetPending'

                                -- DECOMPILER ERROR at PC249: Overwrote pending register: R12 in 'AssignReg'

                              end
                              -- DECOMPILER ERROR at PC253: Confused about usage of register: R10 in 'UnsetPending'

                              -- DECOMPILER ERROR at PC253: Confused about usage of register: R10 in 'UnsetPending'

                              if not pcall(MpCommon.AnomalyEventUpdate, l_0_17, l_0_21, 1, 1) then
                                l_0_22.Error = R12_PC253
                                -- DECOMPILER ERROR at PC258: Confused about usage of register: R10 in 'UnsetPending'

                                ;
                                (bm.trigger_sig)("AnomalyTable_Error", safeJsonSerialize(l_0_22))
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

