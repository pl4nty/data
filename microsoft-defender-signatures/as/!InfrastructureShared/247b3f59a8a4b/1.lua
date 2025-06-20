-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\247b3f59a8a4b\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC10: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched or (this_sigattrlog[7]).matched then
    local l_0_0 = nil
  else
  end
  -- DECOMPILER ERROR at PC34: Overwrote pending register: R0 in 'AssignReg'

  do
    if (((this_sigattrlog[2]).matched or (this_sigattrlog[8]).matched) and (this_sigattrlog[3]).matched) or (this_sigattrlog[9]).matched then
      local l_0_1 = "SysAid"
    else
    end
    -- DECOMPILER ERROR at PC58: Overwrote pending register: R0 in 'AssignReg'

    do
      if (((this_sigattrlog[4]).matched or (this_sigattrlog[10]).matched) and (this_sigattrlog[5]).matched) or (this_sigattrlog[11]).matched then
        local l_0_2, l_0_3, l_0_4 = "FortiSSLVPN"
      else
      end
      if (not (this_sigattrlog[6]).matched and not (this_sigattrlog[12]).matched) or not isEnabledApp("GoAnywhere") then
        return mp.CLEAN
      end
      local l_0_5 = nil
      if not ((bm.get_current_process_startup_info)()).ppid then
        return mp.CLEAN
      end
      local l_0_6 = nil
      local l_0_7 = ((bm.get_current_process_startup_info)()).ppid
      if not (bm.get_imagepath)() then
        return mp.CLEAN
      end
      local l_0_8, l_0_9 = ((bm.get_imagepath)()):match("([^\\]+)$"), (bm.get_process_relationships)()
      if l_0_9 then
        for l_0_13,l_0_14 in ipairs(l_0_9) do
          local l_0_10 = nil
          -- DECOMPILER ERROR at PC110: Confused about usage of register: R10 in 'UnsetPending'

          if R10_PC110.ppid and R10_PC110.image_path and (MpCommon.StringRegExpSearch)("\\\\(wlserver|sysaid|crushftpservice|fortisslvpndaemon|veeam|outlook|goanywhere)", (string.lower)(R10_PC110.image_path)) then
            do
              do
                l_0_7 = l_0_15.ppid
                do break end
                -- DECOMPILER ERROR at PC129: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC129: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC129: LeaveBlock: unexpected jumping out IF_STMT

              end
            end
          end
        end
      end
      local l_0_16, l_0_17 = , startTrackingApp(l_0_7, l_0_5, "programfiles_targeted", "PFAppTracked")
      if not l_0_17 then
        (bm.trigger_sig)("ProcAttribError", safeJsonSerialize(R11_PC144))
      else
        if l_0_7.IsNewApp then
          l_0_7.SignatureName = "Bm/PFA_Parent.B"
          ;
          (bm.trigger_sig)("SetProcessAttrib", safeJsonSerialize(R11_PC156))
        end
      end
      local l_0_18, l_0_19 = , nil
      local l_0_20 = nil
      if (mp.GetParentProcInfo)() and ((mp.GetParentProcInfo)()).image_path then
        l_0_19 = (((mp.GetParentProcInfo)()).image_path):match("([^\\]+)$")
        l_0_20 = NormalizeDirectory(((mp.GetParentProcInfo)()).image_path)
      end
      if not l_0_19 then
        l_0_19 = "None"
      end
      local l_0_21 = nil
      local l_0_22 = {ProcessName = l_0_8, ParentName = l_0_19, Source = "BM", SignatureName = "Bm/PFA_Parent.B", AttributeName = "PFAppTracked", AttributeCategory = "programfiles_targeted", ParentName = l_0_19, TrackedProcess = l_0_5}
      local l_0_23, l_0_24 = , CommandLineGrader((mp.GetProcessCommandLine)(l_0_6.ppid))
      l_0_22.CommandlineScoreIndicator = (mp.GetProcessCommandLine)(l_0_6.ppid)
      l_0_22.CommandlineScore = l_0_24
      local l_0_25 = nil
      -- DECOMPILER ERROR at PC217: Confused about usage of register: R15 in 'UnsetPending'

      do
        if not IsPotentiallyClean("CleanProcessChain", l_0_5, l_0_8) and IsPotentiallyClean("CleanProcessChain_ParentChild", l_0_5, l_0_19 .. "_" .. l_0_8) then
          local l_0_26, l_0_27, l_0_28 = , AnomalyTableCheck("Appomaly_ChildProcName", l_0_19 .. "_" .. l_0_8, 20, "MarkerRecord_" .. l_0_5)
          if l_0_27 and not l_0_28 then
            l_0_22.ProcNameWeight = GetProcessNameScore(l_0_8)
            l_0_22.AnomalyTableName = "Appomaly_ChildProcName"
            l_0_22.AnomalyTableInfo = l_0_19 .. "_" .. l_0_8
            ;
            (bm.trigger_sig)("PFAppChildProc_D", safeJsonSerialize(l_0_22))
          end
        end
        ;
        (bm.trigger_sig)("AnomalousChildCommandline", safeJsonSerialize(l_0_22))
        do
          if l_0_6.integrity_level and not IsPotentiallyClean("CleanProcessChainPriv", l_0_5, l_0_6.integrity_level) then
            local l_0_29, l_0_30, l_0_31 = , AnomalyTableCheck("Appomaly_ChildProcPriv", l_0_19 .. "_" .. l_0_8 .. "_" .. l_0_6.integrity_level, 20, "MarkerRecord_" .. l_0_5)
            if l_0_30 and not l_0_31 then
              l_0_22.AnomalyTableInfo = l_0_19 .. "_" .. l_0_8 .. "_" .. l_0_6.integrity_level
              l_0_22.AnomalyTableName = "Appomaly_ChildProcPriv"
              l_0_22.Key = l_0_29
              ;
              (bm.trigger_sig)("AnomalousChildPriv", safeJsonSerialize(l_0_22))
            end
          end
          do
            if l_0_20 then
              local l_0_32, l_0_33, l_0_34 = , AnomalyTableCheck("Appomaly_ParentProcName", l_0_20 .. "_" .. l_0_19 .. "_" .. l_0_8, 30, "MarkerRecord_" .. l_0_5)
              if l_0_33 and not l_0_34 then
                l_0_22.Key = l_0_32
                l_0_22.ProcNameWeight = GetProcessNameScore(l_0_8)
                l_0_22.AnomalyTableInfo = l_0_20 .. "_" .. l_0_19 .. "_" .. l_0_8
                ;
                (bm.trigger_sig)("PFAppParentProcDir", safeJsonSerialize(l_0_22))
              end
            end
            return mp.CLEAN
          end
        end
      end
    end
  end
end

