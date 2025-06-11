-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\fdd7ad5ff3f0\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
local l_0_1, l_0_2 = GetAppomalyProcessAttribute(l_0_0.ppid)
if l_0_1 then
  return mp.CLEAN
end
do
  local l_0_3, l_0_4, l_0_6 = (MpCommon.GetImagePathFromPid)(l_0_0.ppid) or ""
  -- DECOMPILER ERROR at PC18: Confused about usage of register: R3 in 'UnsetPending'

  do
    local l_0_5, l_0_7 = , l_0_3:match("([^\\]+)$") or ""
    local l_0_8 = nil
    -- DECOMPILER ERROR at PC25: Confused about usage of register: R4 in 'UnsetPending'

    local l_0_9 = nil
    if not (mp.GetScannedPPID)() then
      return mp.CLEAN
    end
    local l_0_10 = {ParentName = l_0_7}
    if not (mp.GetProcessCommandLine)((mp.GetScannedPPID)()) then
      return mp.CLEAN
    end
    local l_0_11 = nil
    l_0_10.Parents = add_parents_mp()
    local l_0_12 = nil
    if (mp.hstr_full_log)() and ((((mp.hstr_full_log)())[2]).matched or (((mp.hstr_full_log)())[3]).matched) and not hasBase64Content(l_0_12) then
      return mp.CLEAN
    end
    local l_0_13, l_0_14 = nil
    local l_0_15 = Base64Grader(l_0_12)
    if (mp.enum_mpattributesubstring)("Appomaly_BadUrlRep_Found") and #(mp.enum_mpattributesubstring)("Appomaly_BadUrlRep_Found") > 0 then
      (mp.set_mpattribute)("HSTR:PFApps_MaliciousCMD_C")
      return mp.CLEAN
    end
    if not l_0_12 then
      return mp.CLEAN
    end
    l_0_12.ML_score = CommandlineMLScore()
    l_0_10.Base64GradingInfo = l_0_12
    if (mp.get_mpattribute)("MpCmdLineFoundB64") then
      l_0_10.MpCmdLineFoundB64 = true
    else
      l_0_10.MpCmdLineFoundB64 = false
    end
    if l_0_12.Score <= 10 then
      (mp.ReportLowfi)(l_0_8, 3531094077)
      return mp.CLEAN
    else
      if not next((l_0_12.Evidence_L1).Urls) then
        return mp.CLEAN
      else
        if l_0_12.Score > 40 then
          local l_0_16, l_0_17, l_0_18 = , isInstalledApp(l_0_11)
          local l_0_19 = nil
          do
            local l_0_20, l_0_21, l_0_30, l_0_31, l_0_35 = , ((MpCommon.GetImagePathFromPid)(l_0_11)):match("([^\\]+)$") or ""
            if l_0_19 and l_0_16.CommandlineTokens then
              local l_0_22 = nil
              -- DECOMPILER ERROR at PC149: Confused about usage of register: R17 in 'UnsetPending'

              -- DECOMPILER ERROR at PC163: Confused about usage of register: R17 in 'UnsetPending'

              local l_0_23 = nil
              local l_0_24, l_0_25, l_0_26 = , {ParentName = l_0_19, ProcessName = l_0_30, Source = "CMD", SignatureName = "APML_SuspCommand.A", CommandlineScore = l_0_16.Score, CommandlineScoreIndicator = l_0_10.Base64GradingInfo, AnomalyTableName = "Appomaly_ChildProcName_CmdLine_Base64", TableAge = GetAnomalyTableAge("Appomaly_ChildProcName_CmdLine_Base64")}
              if AnomalyTableCheck("Appomaly_ChildProcName_CmdLine", l_0_19 .. ";" .. l_0_30 .. ";" .. (table.concat)(l_0_16.CommandlineTokens, "|"), 30) == false and "Appomaly_ChildProcName_CmdLine" == false then
                return mp.CLEAN
              else
                if AnomalyTableCheck("Appomaly_ChildProcName_CmdLine", l_0_19 .. ";" .. l_0_30 .. ";" .. (table.concat)(l_0_16.CommandlineTokens, "|"), 30) and not "Appomaly_ChildProcName_CmdLine" then
                  local l_0_27, l_0_28, l_0_29 = nil
                  if IsPotentiallyClean("CmdLine", l_0_19 .. ";" .. l_0_24, l_0_16.CommandlineTokens) then
                    l_0_10.IsPotentiallyClean = "CmdLine"
                  end
                  ;
                  (MpCommon.BmTriggerSig)(l_0_0.ppid, "AnomalousChildCommandline2", safeJsonSerialize(l_0_25))
                end
              end
            else
              do
                -- DECOMPILER ERROR at PC210: Confused about usage of register: R17 in 'UnsetPending'

                local l_0_32 = nil
                do
                  local l_0_33, l_0_34 = nil
                  if AnomalyTableCheck("Appomaly_Global_CmdLine", l_0_9 .. ";" .. l_0_24 .. ";" .. (table.concat)(l_0_16.CommandlineTokens, "|"), 20) == false and "Appomaly_Global_CmdLine" == false then
                    return mp.CLEAN
                  else
                    if AnomalyTableCheck("Appomaly_Global_CmdLine", l_0_9 .. ";" .. l_0_24 .. ";" .. (table.concat)(l_0_16.CommandlineTokens, "|"), 20) and not "Appomaly_Global_CmdLine" then
                      l_0_10.AnomalousCMD_Cached = l_0_9 .. ";" .. l_0_24 .. ";" .. (table.concat)(l_0_16.CommandlineTokens, "|")
                    end
                  end
                  do
                    local l_0_36 = nil
                    -- DECOMPILER ERROR at PC242: Confused about usage of register: R15 in 'UnsetPending'

                    if not l_0_36 then
                      local l_0_38 = nil
                      local l_0_39 = nil
                      if not startTrackingApp(l_0_0.ppid, l_0_19 or l_0_9, l_0_19 and "programfiles" or "generic") then
                        (l_0_0.ppid).SignatureName = "APML_SuspCommand.A"
                        -- DECOMPILER ERROR at PC257: Confused about usage of register: R19 in 'UnsetPending'

                        ;
                        (MpCommon.BmTriggerSig)(l_0_0.ppid, "ProcAttribError", safeJsonSerialize(R26_PC261))
                      else
                        if next(R23_PC266) and (l_0_0.ppid).IsNewApp then
                          (l_0_0.ppid).SignatureName = "APML_SuspCommand.A"
                          ;
                          (l_0_0.ppid).Score = l_0_16.Score
                          -- DECOMPILER ERROR at PC277: Confused about usage of register: R19 in 'UnsetPending'

                          ;
                          (MpCommon.BmTriggerSig)(R23_PC266, "SetProcessAttrib", safeJsonSerialize(R26_PC281))
                        end
                      end
                      -- DECOMPILER ERROR at PC284: Overwrote pending register: R23 in 'AssignReg'

                      do
                        local l_0_41 = nil
                        IncreaseProcessAnomalyScore(l_0_0.ppid, l_0_16.Score, "Base64Cmd_child[" .. R23_PC266 .. "][cmd/APML_SuspCommand.A]", "PFAppTracked", R23_PC266)
                        l_0_10.Concrete = false
                        l_0_10.Remediation_Reason = ""
                        local l_0_42 = nil
                        for l_0_46 = 1, 3 do
                          local l_0_43, l_0_44, l_0_45, l_0_46 = , l_0_10.Base64GradingInfo
                          -- DECOMPILER ERROR at PC323: Confused about usage of register: R17 in 'UnsetPending'

                          -- DECOMPILER ERROR at PC329: Confused about usage of register: R17 in 'UnsetPending'

                          if l_0_46 and l_0_46["Evidence_L" .. l_0_41] then
                            for l_0_51,R23_PC266 in pairs((l_0_46["Evidence_L" .. l_0_41]).Urls) do
                              local l_0_51 = nil
                              if R23_PC266.BadUrlRep then
                                l_0_10.Remediation_Reason = "BadUrlRep"
                                l_0_10.Concrete = true
                                break
                              end
                            end
                            do
                              do
                                -- DECOMPILER ERROR at PC346: Confused about usage of register: R17 in 'UnsetPending'

                                if (l_0_46["Evidence_L" .. l_0_50]).MultilayerEncoding then
                                  (mp.set_mpattribute)("HSTR:PFApps_MultilayerEncoded_B")
                                  return mp.CLEAN
                                end
                                -- DECOMPILER ERROR at PC359: LeaveBlock: unexpected jumping out DO_STMT

                                -- DECOMPILER ERROR at PC359: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                -- DECOMPILER ERROR at PC359: LeaveBlock: unexpected jumping out IF_STMT

                              end
                            end
                          end
                        end
                        -- DECOMPILER ERROR at PC360: Confused about usage of register: R11 in 'UnsetPending'

                        if l_0_44.Score > 45 then
                          l_0_10.Remediation_Reason = l_0_10.Remediation_Reason .. ";" .. "HighScore"
                        end
                        -- DECOMPILER ERROR at PC368: Confused about usage of register: R13 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC370: Confused about usage of register: R13 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC373: Confused about usage of register: R13 in 'UnsetPending'

                        do
                          if l_0_46 and l_0_46.Evidence_L1 then
                            local l_0_53 = nil
                            if (l_0_46.Evidence_L1).MultilayerEncoding then
                              l_0_10.Remediation_Reason = l_0_10.Remediation_Reason .. ";" .. "MultilayerEncoding"
                            end
                          end
                          local l_0_54 = nil
                          if (mp.enum_mpattributesubstring)("Appomaly_HighlySuspCmd_Pattern") and #(mp.enum_mpattributesubstring)("Appomaly_HighlySuspCmd_Pattern") > 0 then
                            (mp.set_mpattribute)("HSTR:PFApps_SuspPatterns_encoded2")
                            l_0_10.Remediation_Reason = l_0_10.Remediation_Reason .. ";" .. "SuspPattern"
                          end
                          -- DECOMPILER ERROR at PC407: Confused about usage of register: R14 in 'UnsetPending'

                          if (mp.enum_mpattributesubstring)("Appomaly_SuspUrl_Found") and #(mp.enum_mpattributesubstring)("Appomaly_SuspUrl_Found") > 0 then
                            (mp.set_mpattribute)("HSTR:PFApps_HighlySuspUrl")
                            l_0_10.Remediation_Reason = l_0_10.Remediation_Reason .. ";" .. "SuspUrl"
                          end
                          do
                            local l_0_55, l_0_56 = nil
                            if safeJsonSerialize(l_0_10, 150, nil, true) then
                              set_research_data("Evidence", (MpCommon.Base64Encode)(safeJsonSerialize(l_0_10, 150, nil, true)), false)
                              ;
                              (MpCommon.BmTriggerSig)(l_0_0.ppid, "SuspDownload3_BM_Capture", safeJsonSerialize(l_0_10, 150, nil, true))
                            else
                              if l_0_10 then
                                set_research_data("Error", (MpCommon.Base64Encode)(R20_PC449), R20_PC449)
                                return mp.INFECTED
                              end
                            end
                            do return mp.CLEAN end
                            -- DECOMPILER ERROR at PC458: freeLocal<0 in 'ReleaseLocals'

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

