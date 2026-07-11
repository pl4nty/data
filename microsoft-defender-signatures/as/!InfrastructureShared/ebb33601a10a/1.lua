-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\ebb33601a10a\1.luac 

-- params : ...
-- function num : 0
local l_0_1, l_0_2 = nil, nil
local l_0_3 = nil
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 then
  local l_0_0 = nil
  -- DECOMPILER ERROR at PC17: Overwrote pending register: R0 in 'AssignReg'

  local l_0_4 = nil
  -- DECOMPILER ERROR at PC31: Confused about usage of register: R4 in 'UnsetPending'

end
do
  -- DECOMPILER ERROR at PC55: Overwrote pending register: R0 in 'AssignReg'

  -- DECOMPILER ERROR at PC59: Overwrote pending register: R0 in 'AssignReg'

  do
    if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 then
      local l_0_5 = l_0_0
      -- DECOMPILER ERROR at PC73: Confused about usage of register: R4 in 'UnsetPending'

    end
    -- DECOMPILER ERROR at PC97: Overwrote pending register: R0 in 'AssignReg'

    -- DECOMPILER ERROR at PC101: Overwrote pending register: R0 in 'AssignReg'

    do
      if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p2 then
        local l_0_6 = l_0_5
        -- DECOMPILER ERROR at PC114: Overwrote pending register: R3 in 'AssignReg'

      end
      -- DECOMPILER ERROR at PC127: Overwrote pending register: R0 in 'AssignReg'

      -- DECOMPILER ERROR at PC131: Overwrote pending register: R0 in 'AssignReg'

      do
        if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p2 then
          local l_0_7 = l_0_6
          -- DECOMPILER ERROR at PC144: Overwrote pending register: R3 in 'AssignReg'

        end
        if not l_0_3 then
          return mp.CLEAN
        end
        local l_0_8 = l_0_7
        local l_0_9 = l_0_5:match("==(.*)") or ""
        local l_0_10, l_0_11 = "pip", {
PackageInfo = {name = l_0_8, version = l_0_9}
, ParentName = l_0_3}
        if (bm.get_process_relationships)() then
          for l_0_15,l_0_16 in ipairs((bm.get_process_relationships)()) do
            local l_0_12, l_0_13, l_0_14 = nil
            -- DECOMPILER ERROR at PC166: Confused about usage of register: R12 in 'UnsetPending'

            if R12_PC166.ppid and R12_PC166.image_path and ((string.find)((string.lower)(R12_PC166.image_path), "pip.exe", 1, true) or (string.find)((string.lower)(R12_PC166.image_path), "pip3.exe", 1, true) or (string.find)((string.lower)(R12_PC166.image_path), "cargo.exe", 1, true)) then
              do
                do
                  l_0_12 = R12_PC166.ppid
                  do break end
                  -- DECOMPILER ERROR at PC205: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC205: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC205: LeaveBlock: unexpected jumping out IF_STMT

                end
              end
            end
          end
        end
        -- DECOMPILER ERROR at PC207: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC210: Confused about usage of register: R5 in 'UnsetPending'

        if l_0_12 then
          local l_0_18, l_0_19 = nil
          if not startTrackingApp(l_0_12, "pip", "programfiles_targeted", "PFAppTracked") then
            (bm.trigger_sig)("ProcAttribError", safeJsonSerialize(R13_PC222))
          else
            if l_0_12.IsNewApp then
              l_0_12.SignatureName = "Bm/PFApp_SuspChildPip.A"
              ;
              (bm.trigger_sig)("SetProcessAttrib", safeJsonSerialize(R13_PC234))
            end
          end
          do
            local l_0_20, l_0_21 = nil
            local l_0_22 = nil
            if ((bm.get_imagepath)() or ""):match("([^\\]+)$") then
              local l_0_23 = nil
              local l_0_24 = nil
              if (bm.get_current_process_startup_info)() and ((bm.get_current_process_startup_info)()).ppid then
                local l_0_25 = nil
                local l_0_26 = nil
              end
              do
                -- DECOMPILER ERROR at PC273: Confused about usage of register: R11 in 'UnsetPending'

                local l_0_27 = nil
                local l_0_28, l_0_29, l_0_30 = , {ProcessName = ((bm.get_imagepath)() or ""):match("([^\\]+)$"), ParentName = l_0_3, SignatureName = "Bm/PFApp_SuspChildPip.A", AttributeName = "PFAppTracked", AttributeCategory = "programfiles_targeted", TrackedProcess = l_0_10, CommandlineScoreIndicator = (mp.GetProcessCommandLine)(((bm.get_current_process_startup_info)()).ppid), CommandlineScore = CommandLineGrader((mp.GetProcessCommandLine)(((bm.get_current_process_startup_info)()).ppid))}
                if AnomalyTableCheck("Appomaly_ChildProcName", l_0_3 .. "_" .. l_0_26, 30, "MarkerRecord_Pip") and not "Appomaly_ChildProcName" then
                  l_0_29.AnomalyTableName = "Appomaly_ChildProcName"
                  l_0_29.AnomalyTableInfo = l_0_3 .. "_" .. l_0_26
                  -- DECOMPILER ERROR at PC287: Confused about usage of register: R14 in 'UnsetPending'

                  l_0_29.Key = l_0_3 .. "_" .. l_0_26
                  ;
                  (bm.trigger_sig)("PFAppChildProc_F", safeJsonSerialize(l_0_29))
                end
                if l_0_8 then
                  local l_0_31 = nil
                  local l_0_32, l_0_33, l_0_34 = nil
                  if AnomalyTableCheck("Appomaly_ChildProcName", l_0_3 .. "_" .. l_0_28 .. "_" .. l_0_8, 30, "MarkerRecord_Pip_" .. l_0_8) and not "Appomaly_ChildProcName" then
                    l_0_29.AnomalyTableName = "Appomaly_ChildProcName"
                    l_0_29.AnomalyTableInfo = l_0_3 .. "_" .. l_0_28 .. "_" .. l_0_8
                    -- DECOMPILER ERROR at PC317: Confused about usage of register: R18 in 'UnsetPending'

                    l_0_29.Key = l_0_3 .. "_" .. l_0_28 .. "_" .. l_0_8
                    ;
                    (bm.trigger_sig)("PFAppChildProc_F", safeJsonSerialize(l_0_29))
                  end
                end
                do
                  do
                    ;
                    (bm.trigger_sig)("AnomalousChildCommandline", safeJsonSerialize(l_0_29))
                    local l_0_35, l_0_36 = nil
                    local l_0_37 = nil
                    local l_0_38 = safeJsonSerialize(l_0_11)
                    do
                      ;
                      (bm.add_related_string)("Evidence", l_0_38 or l_0_11 or "", bm.RelatedStringBMReport)
                      add_parents()
                      do return mp.INFECTED end
                      -- DECOMPILER ERROR at PC351: freeLocal<0 in 'ReleaseLocals'

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

