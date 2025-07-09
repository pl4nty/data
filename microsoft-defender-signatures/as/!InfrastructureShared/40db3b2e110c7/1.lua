-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\40db3b2e110c7\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC10: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched or (this_sigattrlog[10]).matched then
    local l_0_0 = nil
  else
  end
  -- DECOMPILER ERROR at PC44: Overwrote pending register: R0 in 'AssignReg'

  do
    -- DECOMPILER ERROR at PC45: Unhandled construct in 'MakeBoolean' P3

    -- DECOMPILER ERROR at PC45: Unhandled construct in 'MakeBoolean' P3

    if (((this_sigattrlog[2]).matched or (this_sigattrlog[11]).matched) and (this_sigattrlog[3]).matched) or (this_sigattrlog[12]).matched then
      local l_0_1 = "SysAid"
    else
    end
    -- DECOMPILER ERROR at PC68: Overwrote pending register: R0 in 'AssignReg'

    do
      if (((this_sigattrlog[4]).matched or (this_sigattrlog[13]).matched) and (this_sigattrlog[5]).matched) or (this_sigattrlog[14]).matched then
        local l_0_2 = "CrushFTP"
      else
      end
      -- DECOMPILER ERROR at PC92: Overwrote pending register: R0 in 'AssignReg'

      do
        if (((this_sigattrlog[6]).matched or (this_sigattrlog[15]).matched) and (this_sigattrlog[7]).matched) or (this_sigattrlog[16]).matched then
          local l_0_3 = "Veeam"
        else
        end
        -- DECOMPILER ERROR at PC116: Overwrote pending register: R0 in 'AssignReg'

        do
          if (((this_sigattrlog[8]).matched or (this_sigattrlog[17]).matched) and (this_sigattrlog[9]).matched) or (this_sigattrlog[18]).matched then
            local l_0_4, l_0_5 = "Fortinet"
          end
          -- DECOMPILER ERROR at PC118: Confused about usage of register: R0 in 'UnsetPending'

          if not isEnabledApp(l_0_4) then
            return mp.CLEAN
          end
          local l_0_6 = nil
          if not ((bm.get_current_process_startup_info)()).ppid then
            return mp.CLEAN
          end
          local l_0_7 = nil
          local l_0_8 = ((bm.get_current_process_startup_info)()).ppid
          if not (bm.get_imagepath)() then
            return mp.CLEAN
          end
          local l_0_9 = nil
          local l_0_10, l_0_11 = ((bm.get_imagepath)()):match("([^\\]+)$"), (bm.get_process_relationships)()
          if l_0_11 then
            for l_0_15,l_0_16 in ipairs(l_0_11) do
              local l_0_12 = nil
              -- DECOMPILER ERROR at PC155: Confused about usage of register: R11 in 'UnsetPending'

              if R11_PC155.ppid and R11_PC155.image_path and (MpCommon.StringRegExpSearch)("\\\\(wlserver|sysaid|crushftpservice|fortisslvpndaemon|veeam|outlook|goanywhere|fortinet)", (string.lower)(R11_PC155.image_path)) then
                do
                  do
                    l_0_8 = l_0_17.ppid
                    do break end
                    -- DECOMPILER ERROR at PC174: LeaveBlock: unexpected jumping out DO_STMT

                    -- DECOMPILER ERROR at PC174: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC174: LeaveBlock: unexpected jumping out IF_STMT

                  end
                end
              end
            end
          end
          if l_0_8 == l_0_7.ppid and not (MpCommon.StringRegExpSearch)("\\\\(wlserver|sysaid|crushftpservice|fortisslvpndaemon|veeam|outlook|goanywhere|fortinet)", l_0_9) then
            return mp.CLEAN
          end
          local l_0_18, l_0_19 = , startTrackingApp(l_0_8, l_0_6, "programfiles_targeted", "PFAppTracked")
          if not l_0_19 then
            (bm.trigger_sig)("ProcAttribError", safeJsonSerialize(R12_PC202))
          else
            if l_0_8.IsNewApp then
              l_0_8.SignatureName = "Bm/PFA_Parent.B"
              ;
              (bm.trigger_sig)("SetProcessAttrib", safeJsonSerialize(R12_PC214))
            end
          end
          local l_0_20, l_0_21 = , nil
          local l_0_22 = nil
          if (mp.GetParentProcInfo)() and ((mp.GetParentProcInfo)()).image_path then
            l_0_21 = (((mp.GetParentProcInfo)()).image_path):match("([^\\]+)$")
            l_0_22 = NormalizeDirectory(((mp.GetParentProcInfo)()).image_path)
          end
          if not l_0_21 then
            l_0_21 = "None"
          end
          local l_0_23 = nil
          local l_0_24 = {ProcessName = l_0_10, ParentName = l_0_21, Source = "BM", SignatureName = "Bm/PFA_Parent.B", AttributeName = "PFAppTracked", AttributeCategory = "programfiles_targeted", ParentName = l_0_21, TrackedProcess = l_0_6}
          local l_0_25, l_0_26 = , CommandLineGrader((mp.GetProcessCommandLine)(l_0_7.ppid))
          l_0_24.CommandlineScoreIndicator = (mp.GetProcessCommandLine)(l_0_7.ppid)
          l_0_24.CommandlineScore = l_0_26
          local l_0_27 = nil
          -- DECOMPILER ERROR at PC275: Confused about usage of register: R16 in 'UnsetPending'

          do
            if not IsPotentiallyClean("CleanProcessChain", l_0_6, l_0_10) and IsPotentiallyClean("CleanProcessChain_ParentChild", l_0_6, l_0_21 .. "_" .. l_0_10) then
              local l_0_28, l_0_29, l_0_30 = , AnomalyTableCheck("Appomaly_ChildProcName", l_0_21 .. "_" .. l_0_10, 20, "MarkerRecord_" .. l_0_6)
              if l_0_29 and not l_0_30 then
                l_0_24.ProcNameWeight = GetProcessNameScore(l_0_10)
                l_0_24.AnomalyTableName = "Appomaly_ChildProcName"
                l_0_24.AnomalyTableInfo = l_0_21 .. "_" .. l_0_10
                ;
                (bm.trigger_sig)("PFAppChildProc_D", safeJsonSerialize(l_0_24))
              end
            end
            ;
            (bm.trigger_sig)("AnomalousChildCommandline", safeJsonSerialize(l_0_24))
            do
              if l_0_7.integrity_level and not IsPotentiallyClean("CleanProcessChainPriv", l_0_6, l_0_7.integrity_level) then
                local l_0_31, l_0_32, l_0_33 = , AnomalyTableCheck("Appomaly_ChildProcPriv", l_0_21 .. "_" .. l_0_10 .. "_" .. l_0_7.integrity_level, 20, "MarkerRecord_" .. l_0_6)
                if l_0_32 and not l_0_33 then
                  l_0_24.AnomalyTableInfo = l_0_21 .. "_" .. l_0_10 .. "_" .. l_0_7.integrity_level
                  l_0_24.AnomalyTableName = "Appomaly_ChildProcPriv"
                  l_0_24.Key = l_0_31
                  ;
                  (bm.trigger_sig)("AnomalousChildPriv", safeJsonSerialize(l_0_24))
                end
              end
              do
                if l_0_22 then
                  local l_0_34, l_0_35, l_0_36 = , AnomalyTableCheck("Appomaly_ParentProcName", l_0_22 .. "_" .. l_0_21 .. "_" .. l_0_10, 30, "MarkerRecord_" .. l_0_6)
                  if l_0_35 and not l_0_36 then
                    l_0_24.Key = l_0_34
                    l_0_24.ProcNameWeight = GetProcessNameScore(l_0_10)
                    l_0_24.AnomalyTableInfo = l_0_22 .. "_" .. l_0_21 .. "_" .. l_0_10
                    ;
                    (bm.trigger_sig)("PFAppParentProcDir", safeJsonSerialize(l_0_24))
                  end
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

