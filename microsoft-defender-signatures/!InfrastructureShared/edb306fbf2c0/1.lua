-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\edb306fbf2c0\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC10: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched or (this_sigattrlog[3]).matched then
    local l_0_0, l_0_1 = nil
  else
  end
  if (this_sigattrlog[2]).matched or (this_sigattrlog[4]).matched then
    local l_0_2 = "SysAid"
    if not ((bm.get_current_process_startup_info)()).ppid then
      return mp.CLEAN
    end
    local l_0_3 = nil
    local l_0_4 = ((bm.get_current_process_startup_info)()).ppid
    if not (bm.get_imagepath)() then
      return mp.CLEAN
    end
    local l_0_5, l_0_6 = ((bm.get_imagepath)()):match("([^\\]+)$"), (bm.get_process_relationships)()
    if l_0_6 then
      for l_0_10,l_0_11 in ipairs(l_0_6) do
        local l_0_7 = nil
        -- DECOMPILER ERROR at PC54: Confused about usage of register: R10 in 'UnsetPending'

        if (l_0_2 == "WebLogic" and (string.find)((string.lower)(R10_PC54.image_path), "\\wlserver", 1, true)) or l_0_2 == "SysAid" and (string.find)((string.lower)(R10_PC54.image_path), "\\program files\\sysaid", 1, true) then
          do
            do
              l_0_4 = l_0_12.ppid
              do break end
              -- DECOMPILER ERROR at PC88: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC88: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC88: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      end
    end
    local l_0_13, l_0_14 = , startTrackingApp(l_0_4, l_0_2, "programfiles_targeted", "PFAppTracked")
    if not l_0_14 then
      (bm.trigger_sig)("ProcAttribError", safeJsonSerialize(R11_PC103))
    else
      if l_0_4.IsNewApp then
        l_0_4.SignatureName = "Bm/PFA_Parent.B"
        ;
        (bm.trigger_sig)("SetProcessAttrib", safeJsonSerialize(R11_PC115))
      end
    end
    local l_0_15, l_0_16 = , nil
    local l_0_17 = nil
    if (mp.GetParentProcInfo)() and ((mp.GetParentProcInfo)()).image_path then
      l_0_16 = (((mp.GetParentProcInfo)()).image_path):match("([^\\]+)$")
      l_0_17 = NormalizeDirectory(((mp.GetParentProcInfo)()).image_path)
    end
    if not l_0_16 then
      l_0_16 = "None"
    end
    local l_0_18 = nil
    local l_0_19 = {ProcessName = l_0_5, ParentName = l_0_16, Source = "BM", SignatureName = "Bm/PFA_Parent.B", AttributeName = "PFAppTracked", AttributeCategory = "programfiles_targeted", ParentName = l_0_16, TrackedProcess = l_0_2}
    local l_0_20, l_0_21 = , CommandLineGrader((mp.GetProcessCommandLine)(l_0_3.ppid))
    l_0_19.CommandlineScoreIndicator = (mp.GetProcessCommandLine)(l_0_3.ppid)
    l_0_19.CommandlineScore = l_0_21
    local l_0_22 = nil
    -- DECOMPILER ERROR at PC176: Confused about usage of register: R15 in 'UnsetPending'

    do
      if not IsPotentiallyClean("CleanProcessChain", l_0_2, l_0_5) and IsPotentiallyClean("CleanProcessChain_ParentChild", l_0_2, l_0_16 .. "_" .. l_0_5) then
        local l_0_23, l_0_24, l_0_25 = , AnomalyTableCheck("Appomaly_ChildProcName", l_0_16 .. "_" .. l_0_5, 20, "MarkerRecord_" .. l_0_2)
        if l_0_24 and not l_0_25 then
          l_0_19.ProcNameWeight = GetProcessNameScore(l_0_5)
          l_0_19.AnomalyTableName = "Appomaly_ChildProcName"
          l_0_19.AnomalyTableInfo = l_0_16 .. "_" .. l_0_5
          ;
          (bm.trigger_sig)("PFAppChildProc_D", safeJsonSerialize(l_0_19))
        end
      end
      ;
      (bm.trigger_sig)("AnomalousChildCommandline", safeJsonSerialize(l_0_19))
      do
        if l_0_3.integrity_level and not IsPotentiallyClean("CleanProcessChainPriv", l_0_2, l_0_3.integrity_level) then
          local l_0_26, l_0_27, l_0_28 = , AnomalyTableCheck("Appomaly_ChildProcPriv", l_0_16 .. "_" .. l_0_5 .. "_" .. l_0_3.integrity_level, 20, "MarkerRecord_" .. l_0_2)
          if l_0_27 and not l_0_28 then
            l_0_19.AnomalyTableInfo = l_0_16 .. "_" .. l_0_5 .. "_" .. l_0_3.integrity_level
            l_0_19.AnomalyTableName = "Appomaly_ChildProcPriv"
            l_0_19.Key = l_0_26
            ;
            (bm.trigger_sig)("AnomalousChildPriv", safeJsonSerialize(l_0_19))
          end
        end
        do
          if l_0_17 then
            local l_0_29, l_0_30, l_0_31 = , AnomalyTableCheck("Appomaly_ParentProcName", l_0_17 .. "_" .. l_0_16 .. "_" .. l_0_5, 30, "MarkerRecord_" .. l_0_2)
            if l_0_30 and not l_0_31 then
              l_0_19.Key = l_0_29
              l_0_19.ProcNameWeight = GetProcessNameScore(l_0_5)
              l_0_19.AnomalyTableInfo = l_0_17 .. "_" .. l_0_16 .. "_" .. l_0_5
              ;
              (bm.trigger_sig)("PFAppParentProcDir", safeJsonSerialize(l_0_19))
            end
          end
          return mp.CLEAN
        end
      end
    end
  end
end

