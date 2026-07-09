-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\4ab3d6a415bb\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = nil
local l_0_1, l_0_2 = , (bm.get_process_relationships)()
if l_0_2 then
  for l_0_6,l_0_7 in ipairs(l_0_2) do
    local l_0_3 = nil
    -- DECOMPILER ERROR at PC9: Confused about usage of register: R7 in 'UnsetPending'

    if R7_PC9.ppid and R7_PC9.image_path and (string.find)((string.lower)(R7_PC9.image_path), "code.exe", 1, true) then
      do
        do
          local l_0_9 = nil
          if (sysio.GetPEVersionInfo)((string.lower)(R7_PC9.image_path)) and ((sysio.GetPEVersionInfo)((string.lower)(R7_PC9.image_path))).ProductName and not (string.find)(((sysio.GetPEVersionInfo)((string.lower)(R7_PC9.image_path))).ProductName, "Visual Studio Code", 1, true) then
            return mp.CLEAN
          end
          l_0_1 = l_0_8.ppid
          do break end
          -- DECOMPILER ERROR at PC51: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC51: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC51: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
end
if l_0_1 then
  local l_0_10, l_0_11 = , startTrackingApp(l_0_1, "VSCode", "programfiles_targeted", "PFAppTracked")
  if not l_0_11 then
    (bm.trigger_sig)("ProcAttribError", safeJsonSerialize(R8_PC68))
  else
    if l_0_1.IsNewApp then
      l_0_1.SignatureName = "Bm/PFApp_SuspChildVS.A"
      ;
      (bm.trigger_sig)("SetProcessAttrib", safeJsonSerialize(R8_PC80))
    end
  end
  do
    local l_0_12, l_0_13 = , (bm.get_imagepath)() or ""
    -- DECOMPILER ERROR at PC88: Confused about usage of register: R5 in 'UnsetPending'

    local l_0_14 = nil
    if l_0_13:match("([^\\]+)$") then
      local l_0_15 = nil
      local l_0_16 = nil
      if (bm.get_current_process_startup_info)() and ((bm.get_current_process_startup_info)()).ppid then
        local l_0_17 = {ProcessName = l_0_13:match("([^\\]+)$"), ParentName = "code.exe", SignatureName = "Bm/PFApp_SuspChildVS.A", AttributeName = "PFAppTracked", AttributeCategory = "programfiles_targeted", TrackedProcess = "VSCode"}
        local l_0_18 = nil
        l_0_17.CommandlineScore = CommandLineGrader((mp.GetProcessCommandLine)(((bm.get_current_process_startup_info)()).ppid))
      end
      do
        local l_0_19 = nil
        do
          local l_0_20, l_0_21, l_0_22 = , AnomalyTableCheck("Appomaly_ChildProcName_2", "Code.exe" .. "_" .. l_0_16, 30, "MarkerRecord_VSCode")
          if l_0_22 and not "Appomaly_ChildProcName_2" then
            l_0_19.AnomalyTableName = "Appomaly_ChildProcName_2"
            l_0_19.AnomalyTableInfo = "Code.exe" .. "_" .. l_0_16
            ;
            (bm.trigger_sig)("PFAppChildProc_G", safeJsonSerialize(l_0_19))
          end
          ;
          (bm.trigger_sig)("AnomalousChildCommandline", safeJsonSerialize(l_0_19))
          return mp.CLEAN
        end
      end
    end
  end
end

