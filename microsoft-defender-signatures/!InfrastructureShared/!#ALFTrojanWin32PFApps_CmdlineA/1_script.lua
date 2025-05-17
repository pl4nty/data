-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanWin32PFApps_CmdlineA\1_luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_CONTENTNAME)
do
  if l_0_1 then
    local l_0_2 = {}
    -- DECOMPILER ERROR at PC15: No list found for R2 , SetList fails

    -- DECOMPILER ERROR at PC16: Overwrote pending register: R3 in 'AssignReg'

    -- DECOMPILER ERROR at PC17: Overwrote pending register: R4 in 'AssignReg'

    -- DECOMPILER ERROR at PC18: Overwrote pending register: R5 in 'AssignReg'

    if ("C:\\WINDOWS\\CCM\\")("C:\\WINDOWS\\IMECache\\", "\\Nexthink\\", true) then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC33: Overwrote pending register: R7 in 'AssignReg'

    if hasSeenBefore((string.lower)(l_0_1), "", 20, "WindowsDefenderExploitGuard\\Modules") and (string.lower)(l_0_1) > 2 then
      return mp.CLEAN
    end
  end
  local l_0_3 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
  if l_0_3 and not (string.find)(l_0_3, "^powershell", 1, false) and not (string.find)(l_0_3, "pwsh.exe", 1, true) then
    return mp.CLEAN
  end
  do
    local l_0_4, l_0_5 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSDEVICEPATH) or ""
    -- DECOMPILER ERROR at PC85: Confused about usage of register: R3 in 'UnsetPending'

    if (string.find)(l_0_4, "\\WindowsApps\\", 1, true) then
      return mp.CLEAN
    end
    local l_0_6 = nil
    local l_0_7, l_0_8 = , CommandLineGrader((string.lower)(tostring(headerpage) .. tostring(footerpage)), true, 2)
    if not l_0_8 or not (string.lower)(tostring(headerpage) .. tostring(footerpage)) or not next(R8_PC118) then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC129: Overwrote pending register: R8 in 'AssignReg'

    -- DECOMPILER ERROR at PC134: Overwrote pending register: R8 in 'AssignReg'

    if ((string.lower)(tostring(headerpage) .. tostring(footerpage))).Evidence_L1 and not next(R8_PC118) and not hasTamperingCmd(R8_PC118) then
      return mp.CLEAN
    end
    local l_0_9 = nil
    -- DECOMPILER ERROR at PC145: Overwrote pending register: R8 in 'AssignReg'

    -- DECOMPILER ERROR at PC146: Overwrote pending register: R8 in 'AssignReg'

    if not GetCurrentPPID() then
      return R8_PC118
    end
    -- DECOMPILER ERROR at PC148: Overwrote pending register: R8 in 'AssignReg'

    -- DECOMPILER ERROR at PC149: Overwrote pending register: R8 in 'AssignReg'

    R8_PC118 = R8_PC118(GetCurrentPPID())
    local l_0_10 = nil
    if hasBase64Content(l_0_7) or hasBase64Content(R8_PC118) or hasURLEncodedContent(R8_PC118) then
      l_0_8 = l_0_8 + 10
    end
    if l_0_8 < 10 then
      return mp.CLEAN
    end
    local l_0_11 = nil
    local l_0_12 = {CmdGradingInfo = l_0_9, Score = l_0_8, ScriptName = l_0_1}
    local l_0_13 = nil
    if (mp.GetParentProcInfo)(l_0_10) and ((mp.GetParentProcInfo)(l_0_10)).ppid then
      l_0_13 = (MpCommon.GetImagePathFromPid)(((mp.GetParentProcInfo)(l_0_10)).ppid)
    end
    if l_0_9.CommandlineTokens then
      if IsPotentiallyClean("CmdLine_Basic", "", (table.concat)(l_0_9.CommandlineTokens, "|")) then
        return mp.CLEAN
      end
      local l_0_14 = nil
      local l_0_15 = IsPotentiallyClean
      if not l_0_13 then
        do
          l_0_15 = l_0_15("CmdLine", "" .. ";powershell.exe", l_0_9.CommandlineTokens)
          if l_0_15 then
            l_0_12.IsPotentiallyClean = "CmdLine"
          end
          -- DECOMPILER ERROR at PC225: Confused about usage of register: R10 in 'UnsetPending'

          l_0_12.Parents = add_parents_mp() or l_0_13
          local l_0_17, l_0_18 = nil
          local l_0_19 = GetAppomalyProcessAttribute(l_0_10)
          if safeJsonDeserialize(R15_PC232) then
            R15_PC232 = (safeJsonDeserialize(R15_PC232)).AppName
            local l_0_20 = nil
            local l_0_21 = nil
            local l_0_22 = nil
            do
              local l_0_23 = nil
              local l_0_24 = nil
              local l_0_25 = nil
              local l_0_26 = (((mp.GetParentProcInfo)(l_0_10)).image_path):match("([^\\]+)$") or ""
              -- DECOMPILER ERROR at PC267: Confused about usage of register: R20 in 'UnsetPending'

              local l_0_27 = nil
              local l_0_28 = nil
              local l_0_29, l_0_30, l_0_31 = {ParentName = l_0_26, TrackedProcess = l_0_22, ProcessName = "powershell.exe", Source = "AMSI", SignatureName = "PFApps_Cmdline.A", CommandlineTokens = l_0_9.CommandlineTokens, CommandlineScore = l_0_12.Score, CommandlineScoreIndicator = l_0_12.CmdGradingInfo, AnomalyTableName = "Appomaly_ChildProcName_CmdLine", TableAge = GetAnomalyTableAge("Appomaly_ChildProcName_CmdLine")}
              if AnomalyTableCheck("Appomaly_ChildProcName_CmdLine", l_0_22 .. ";" .. l_0_27 .. ";" .. (table.concat)(l_0_9.CommandlineTokens, "|"), 30, "MarkerRecord_" .. l_0_22) == false and "Appomaly_ChildProcName_CmdLine" == false then
                return mp.CLEAN
              else
                if AnomalyTableCheck("Appomaly_ChildProcName_CmdLine", l_0_22 .. ";" .. l_0_27 .. ";" .. (table.concat)(l_0_9.CommandlineTokens, "|"), 30, "MarkerRecord_" .. l_0_22) and not "Appomaly_ChildProcName_CmdLine" then
                  local l_0_32, l_0_33, l_0_34 = nil
                  if IsPotentiallyClean("CmdLine", l_0_22 .. ";" .. l_0_27, l_0_30) then
                    l_0_12.IsPotentiallyClean = "CmdLine"
                  end
                  ;
                  (MpCommon.BmTriggerSig)(l_0_24.ppid, "AnomalousChildCommandline2", safeJsonSerialize(l_0_29))
                end
              end
              do
                local l_0_35 = nil
                do
                  local l_0_36 = nil
                  IncreaseProcessAnomalyScore(l_0_10, l_0_8, "SuspAMSICmd[" .. l_0_10:match("pid:(%d+)"), l_0_19, {Pid = l_0_10, CmdGradingInfo = l_0_9, IndicatorScore = l_0_8, Parents = l_0_25})
                  l_0_12.Concrete = false
                  l_0_12.Remediation_Reason = ""
                  local l_0_37 = nil
                  -- DECOMPILER ERROR at PC337: Confused about usage of register: R15 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC340: Confused about usage of register: R15 in 'UnsetPending'

                  if l_0_12.CmdGradingInfo and (l_0_12.CmdGradingInfo).Evidence_L1 then
                    local l_0_38 = nil
                    for l_0_42,l_0_43 in pairs(((l_0_12.CmdGradingInfo).Evidence_L1).Urls) do
                      local l_0_39, l_0_40 = nil
                      -- DECOMPILER ERROR at PC346: Confused about usage of register: R21 in 'UnsetPending'

                      if l_0_29.BadUrlRep then
                        l_0_12.Remediation_Reason = "BadUrlRep"
                        l_0_12.Concrete = true
                        break
                      end
                    end
                  end
                  do
                    if l_0_12.Score > 45 then
                      l_0_12.Remediation_Reason = l_0_12.Remediation_Reason .. ";" .. "HighScore"
                    end
                    local l_0_44, l_0_45 = , safeJsonSerialize(l_0_12, 150, nil, true)
                    if not l_0_45 then
                      set_research_data("Error", "Error Serializing Evidence Data" .. (MpCommon.Base64Encode)(R22_PC376), false)
                      return mp.INFECTED
                    else
                      set_research_data("Evidence", (MpCommon.Base64Encode)(l_0_45), false)
                      ;
                      (MpCommon.BmTriggerSig)(l_0_10, "LUA:PFApps_Cmdline", l_0_45)
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

