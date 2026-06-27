-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\eeb31b0c3866\1.luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1, l_0_2 = nil, nil, nil
local l_0_3 = nil
do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 then
    local l_0_4 = nil
  end
  -- DECOMPILER ERROR at PC37: Overwrote pending register: R0 in 'AssignReg'

  -- DECOMPILER ERROR at PC41: Overwrote pending register: R0 in 'AssignReg'

  do
    if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 then
      local l_0_5 = l_0_4
      -- DECOMPILER ERROR at PC55: Confused about usage of register: R4 in 'UnsetPending'

    end
    -- DECOMPILER ERROR at PC79: Overwrote pending register: R0 in 'AssignReg'

    -- DECOMPILER ERROR at PC83: Overwrote pending register: R0 in 'AssignReg'

    do
      if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p2 then
        local l_0_6 = l_0_5
        -- DECOMPILER ERROR at PC97: Confused about usage of register: R4 in 'UnsetPending'

      end
      -- DECOMPILER ERROR at PC121: Overwrote pending register: R0 in 'AssignReg'

      -- DECOMPILER ERROR at PC125: Overwrote pending register: R0 in 'AssignReg'

      do
        if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p2 then
          local l_0_7 = l_0_6
          -- DECOMPILER ERROR at PC138: Overwrote pending register: R3 in 'AssignReg'

        end
        -- DECOMPILER ERROR at PC151: Overwrote pending register: R0 in 'AssignReg'

        -- DECOMPILER ERROR at PC155: Overwrote pending register: R0 in 'AssignReg'

        do
          if (this_sigattrlog[5]).matched and (this_sigattrlog[5]).utf8p2 then
            local l_0_8 = l_0_7
            -- DECOMPILER ERROR at PC168: Overwrote pending register: R3 in 'AssignReg'

          end
          if not l_0_3 then
            return mp.CLEAN
          end
          local l_0_9 = l_0_8
          local l_0_10 = l_0_6:match("==(.*)") or ""
          local l_0_11, l_0_12 = "pip", {
PackageInfo = {name = l_0_9, version = l_0_10}
, ParentName = l_0_3}
          if (bm.get_process_relationships)() then
            for l_0_16,l_0_17 in ipairs((bm.get_process_relationships)()) do
              local l_0_13, l_0_14, l_0_15 = nil
              -- DECOMPILER ERROR at PC190: Confused about usage of register: R12 in 'UnsetPending'

              if R12_PC190.ppid and R12_PC190.image_path and ((string.find)((string.lower)(R12_PC190.image_path), "pip.exe", 1, true) or (string.find)((string.lower)(R12_PC190.image_path), "pip3.exe", 1, true) or (string.find)((string.lower)(R12_PC190.image_path), "cargo.exe", 1, true)) then
                do
                  do
                    l_0_13 = R12_PC190.ppid
                    do break end
                    -- DECOMPILER ERROR at PC229: LeaveBlock: unexpected jumping out DO_STMT

                    -- DECOMPILER ERROR at PC229: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC229: LeaveBlock: unexpected jumping out IF_STMT

                  end
                end
              end
            end
          end
          -- DECOMPILER ERROR at PC231: Confused about usage of register: R5 in 'UnsetPending'

          -- DECOMPILER ERROR at PC234: Confused about usage of register: R5 in 'UnsetPending'

          if l_0_13 then
            local l_0_19, l_0_20 = nil
            if not startTrackingApp(l_0_13, "pip", "programfiles_targeted", "PFAppTracked") then
              (bm.trigger_sig)("ProcAttribError", safeJsonSerialize(R13_PC246))
            else
              if l_0_13.IsNewApp then
                l_0_13.SignatureName = "Bm/PFApp_SuspChildPip.A"
                ;
                (bm.trigger_sig)("SetProcessAttrib", safeJsonSerialize(R13_PC258))
              end
            end
            do
              local l_0_21, l_0_22 = nil
              local l_0_23 = nil
              if ((bm.get_imagepath)() or ""):match("([^\\]+)$") then
                local l_0_24 = nil
                local l_0_25 = nil
                if (bm.get_current_process_startup_info)() and ((bm.get_current_process_startup_info)()).ppid then
                  local l_0_26 = nil
                  local l_0_27 = nil
                end
                do
                  -- DECOMPILER ERROR at PC297: Confused about usage of register: R11 in 'UnsetPending'

                  local l_0_28 = nil
                  local l_0_29, l_0_30, l_0_31 = , {ProcessName = ((bm.get_imagepath)() or ""):match("([^\\]+)$"), ParentName = l_0_3, SignatureName = "Bm/PFApp_SuspChildPip.A", AttributeName = "PFAppTracked", AttributeCategory = "programfiles_targeted", TrackedProcess = l_0_11, CommandlineScoreIndicator = (mp.GetProcessCommandLine)(((bm.get_current_process_startup_info)()).ppid), CommandlineScore = CommandLineGrader((mp.GetProcessCommandLine)(((bm.get_current_process_startup_info)()).ppid))}
                  if AnomalyTableCheck("Appomaly_ChildProcName", l_0_3 .. "_" .. l_0_27, 30, "MarkerRecord_Pip") and not "Appomaly_ChildProcName" then
                    l_0_30.AnomalyTableName = "Appomaly_ChildProcName"
                    l_0_30.AnomalyTableInfo = l_0_3 .. "_" .. l_0_27
                    -- DECOMPILER ERROR at PC311: Confused about usage of register: R14 in 'UnsetPending'

                    l_0_30.Key = l_0_3 .. "_" .. l_0_27
                    ;
                    (bm.trigger_sig)("PFAppChildProc_F", safeJsonSerialize(l_0_30))
                  end
                  if l_0_9 then
                    local l_0_32 = nil
                    local l_0_33, l_0_34, l_0_35 = nil
                    if AnomalyTableCheck("Appomaly_ChildProcName", l_0_3 .. "_" .. l_0_29 .. "_" .. l_0_9, 30, "MarkerRecord_Pip_" .. l_0_9) and not "Appomaly_ChildProcName" then
                      l_0_30.AnomalyTableName = "Appomaly_ChildProcName"
                      l_0_30.AnomalyTableInfo = l_0_3 .. "_" .. l_0_29 .. "_" .. l_0_9
                      -- DECOMPILER ERROR at PC341: Confused about usage of register: R18 in 'UnsetPending'

                      l_0_30.Key = l_0_3 .. "_" .. l_0_29 .. "_" .. l_0_9
                      ;
                      (bm.trigger_sig)("PFAppChildProc_F", safeJsonSerialize(l_0_30))
                    end
                  end
                  do
                    do
                      ;
                      (bm.trigger_sig)("AnomalousChildCommandline", safeJsonSerialize(l_0_30))
                      local l_0_36, l_0_37 = nil
                      local l_0_38 = nil
                      local l_0_39 = safeJsonSerialize(l_0_12)
                      do
                        ;
                        (bm.add_related_string)("Evidence", l_0_39 or l_0_12 or "", bm.RelatedStringBMReport)
                        add_parents()
                        do return mp.INFECTED end
                        -- DECOMPILER ERROR at PC375: freeLocal<0 in 'ReleaseLocals'

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

