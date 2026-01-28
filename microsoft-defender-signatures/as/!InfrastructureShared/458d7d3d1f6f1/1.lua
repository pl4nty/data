-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\458d7d3d1f6f1\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = {}
local l_0_2, l_0_3, l_0_4 = nil, nil, nil
local l_0_5, l_0_6 = GetAppomalyProcessAttribute(l_0_0)
if l_0_6 then
  local l_0_7 = safeJsonDeserialize(l_0_6)
  if l_0_7 then
    l_0_2 = l_0_7.AppName
    l_0_3 = l_0_7.Pid
    l_0_4 = l_0_7.AppCategory
  end
else
  do
    do
      local l_0_8 = nil
      l_0_8 = isInstalledApp(l_0_0)
      l_0_4 = not l_0_8 or "programfiles"
      l_0_1.AppName = l_0_2
      l_0_1.AppCategory = l_0_4
      local l_0_9 = (mp.hstr_full_log)()
      local l_0_10 = (mp.GetProcessCommandLine)(l_0_0)
      if l_0_9 and ((l_0_9[1]).matched or (l_0_9[2]).matched or mp.HSTR_WEIGHT > 30) then
        local l_0_11 = false
        if l_0_2 then
          l_0_11 = true
        end
        local l_0_12, l_0_13 = CommandLineGrader(l_0_10, l_0_11, 2)
        local l_0_14 = (mp.GetParentProcInfo)()
        do
          local l_0_15 = (MpCommon.GetImagePathFromPid)(l_0_14.ppid) or ""
          local l_0_16 = nil
          if (mp.enum_mpattributesubstring)("Appomaly_BadUrlRep_Found") and #(mp.enum_mpattributesubstring)("Appomaly_BadUrlRep_Found") > 0 then
            (mp.set_mpattribute)("HSTR:PFApps_MaliciousCMD_A")
            ;
            (MpCommon.BmTriggerSig)(l_0_14.ppid, "BM_PFApps_MaliciousCMD_A", safeJsonSerialize(l_0_13) or "")
          end
          if not l_0_12 or l_0_12 < 20 then
            return mp.CLEAN
          end
          if not l_0_13 or not next(l_0_13) then
            return mp.CLEAN
          end
          if (not l_0_13.Evidence_L1 or not next((l_0_13.Evidence_L1).Urls)) and not hasTamperingCmd(l_0_10) then
            return mp.CLEAN
          end
          l_0_13.ML_score = CommandlineMLScore()
          l_0_1.CmdGradingInfo = l_0_13
          l_0_1.Score = l_0_12
          l_0_1.Parents = add_parents_mp()
          l_0_1.CurrentProcess = (MpCommon.GetImagePathFromPid)(l_0_0)
          if l_0_13.ML_score > 0 and l_0_13.ML_score + l_0_12 > 170 then
            (mp.set_mpattribute)("HSTR:PFApps_MaliciousCMD_ML_B")
          end
          AppendToRollingQueue("PFApp_PotentialDownload_Ppid", l_0_14.ppid, safeJsonSerialize(l_0_13), 300, 500, 0)
          do
            if not l_0_16:match("([^\\]+)$") then
              local l_0_17 = nil
            end
            local l_0_18 = nil
            do
              local l_0_19 = l_0_12 < 20 or ""
              local l_0_20 = nil
              if l_0_13.CommandlineTokens and l_0_2 then
                local l_0_21 = nil
                -- DECOMPILER ERROR at PC209: Confused about usage of register: R17 in 'UnsetPending'

                -- DECOMPILER ERROR at PC213: Confused about usage of register: R18 in 'UnsetPending'

                local l_0_22 = nil
                local l_0_23, l_0_24, l_0_25 = , {ParentName = l_0_2, ProcessName = ((MpCommon.GetImagePathFromPid)(l_0_0)):match("([^\\]+)$") or "", Source = "CMD", SignatureName = "PFApps.A", CommandlineScore = l_0_1.Score, CommandlineScoreIndicator = l_0_1.CmdGradingInfo, AnomalyTableName = "Appomaly_ChildProcName_CmdLine", TableAge = GetAnomalyTableAge("Appomaly_ChildProcName_CmdLine")}
                if AnomalyTableCheck("Appomaly_ChildProcName_CmdLine", l_0_2 .. ";" .. (((MpCommon.GetImagePathFromPid)(l_0_0)):match("([^\\]+)$") or "") .. ";" .. (table.concat)(l_0_13.CommandlineTokens, "|"), 30) == false and "Appomaly_ChildProcName_CmdLine" == false then
                  return mp.CLEAN
                else
                  if AnomalyTableCheck("Appomaly_ChildProcName_CmdLine", l_0_2 .. ";" .. (((MpCommon.GetImagePathFromPid)(l_0_0)):match("([^\\]+)$") or "") .. ";" .. (table.concat)(l_0_13.CommandlineTokens, "|"), 30) and not "Appomaly_ChildProcName_CmdLine" then
                    local l_0_26, l_0_27, l_0_28 = nil
                    if IsPotentiallyClean("CmdLine", l_0_2 .. ";" .. l_0_22, l_0_23) then
                      l_0_1.IsPotentiallyClean = "CmdLine"
                    end
                    ;
                    (MpCommon.BmTriggerSig)(l_0_14.ppid, "AnomalousChildCommandline", safeJsonSerialize(l_0_24))
                  end
                end
                do
                  if not l_0_3 then
                    local l_0_31 = nil
                    local l_0_32 = nil
                    if not startTrackingApp(l_0_14.ppid, l_0_2 or l_0_20, l_0_4 or "generic") then
                      (l_0_14.ppid).SignatureName = "PFApps.A"
                      -- DECOMPILER ERROR at PC271: Confused about usage of register: R25 in 'UnsetPending'

                      ;
                      (MpCommon.BmTriggerSig)(l_0_14.ppid, "ProcAttribError", safeJsonSerialize(R32_PC275))
                    else
                      local l_0_34 = nil
                      IncreaseProcessAnomalyScore(l_0_14.ppid, l_0_12, "SuspDownload[" .. l_0_0:match("pid:(%d+)") .. "][CMD/PFApps.A]", l_0_5, {ProcessName = l_0_21, IsProcessFriendly = (MpCommon.IsFriendlyProcess)(l_0_0), Pid = l_0_0, CmdGradingInfo = l_0_1.CmdGradingInfo, IndicatorScore = l_0_12, Parents = l_0_1.Parents})
                      if next(R31_PC306) and (l_0_14.ppid).IsNewApp then
                        (l_0_14.ppid).SignatureName = "PFApps.A"
                        ;
                        (l_0_14.ppid).Score = l_0_12
                        -- DECOMPILER ERROR at PC316: Confused about usage of register: R25 in 'UnsetPending'

                        ;
                        (MpCommon.BmTriggerSig)(R31_PC306, "SetProcessAttrib", safeJsonSerialize(R34_PC320))
                      end
                    end
                    do
                      -- DECOMPILER ERROR at PC323: Confused about usage of register: R15 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC325: Confused about usage of register: R17 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC329: Confused about usage of register: R18 in 'UnsetPending'

                      local l_0_35 = nil
                      local l_0_36, l_0_37, l_0_38 = nil
                      if AnomalyTableCheck("Appomaly_Global_CmdLine", l_0_20 .. ";" .. l_0_22 .. ";" .. (table.concat)(l_0_23, "|"), 20) == false and "Appomaly_Global_CmdLine" == false then
                        return mp.CLEAN
                      else
                        -- DECOMPILER ERROR at PC354: Confused about usage of register: R17 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC356: Confused about usage of register: R18 in 'UnsetPending'

                        if AnomalyTableCheck("Appomaly_Global_CmdLine", l_0_20 .. ";" .. l_0_22 .. ";" .. (table.concat)(l_0_23, "|"), 20) and not "Appomaly_Global_CmdLine" then
                          local l_0_39, l_0_57 = nil
                          if IsPotentiallyClean("CmdLine", l_0_37 .. ";" .. l_0_22, l_0_23) then
                            l_0_1.IsPotentiallyClean = "CmdLine"
                          end
                          l_0_1.AnomalousCMD_Cached = true
                          l_0_1.AnomalousCMD_Cached_TblInfo = l_0_20 .. ";" .. l_0_22 .. ";" .. (table.concat)(l_0_23, "|")
                        end
                      end
                      do
                        l_0_1.Concrete = false
                        l_0_1.Remediation_Reason = ""
                        local l_0_40 = nil
                        -- DECOMPILER ERROR at PC368: Confused about usage of register: R15 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC371: Confused about usage of register: R15 in 'UnsetPending'

                        if l_0_1.CmdGradingInfo and (l_0_1.CmdGradingInfo).Evidence_L1 then
                          local l_0_41 = nil
                          for l_0_45,l_0_46 in pairs(((l_0_1.CmdGradingInfo).Evidence_L1).Urls) do
                            local l_0_42, l_0_43, l_0_44, l_0_45 = nil
                            if ("Appomaly_Global_CmdLine").BadUrlRep then
                              l_0_1.Remediation_Reason = "BadUrlRep"
                              l_0_1.Concrete = true
                              break
                            end
                          end
                        end
                        do
                          if l_0_1.Score > 45 then
                            l_0_1.Remediation_Reason = l_0_1.Remediation_Reason .. ";" .. "HighScore"
                          else
                            return mp.CLEAN
                          end
                          -- DECOMPILER ERROR at PC404: Confused about usage of register: R14 in 'UnsetPending'

                          if (mp.enum_mpattributesubstring)("Appomaly_HighlySuspCmd_Pattern_") and #(mp.enum_mpattributesubstring)("Appomaly_HighlySuspCmd_Pattern_") > 0 then
                            (mp.set_mpattribute)("HSTR:PFApps_SuspPatterns3")
                            l_0_1.Remediation_Reason = l_0_1.Remediation_Reason .. ";" .. "SuspPattern"
                          end
                          -- DECOMPILER ERROR at PC423: Confused about usage of register: R14 in 'UnsetPending'

                          if (mp.enum_mpattributesubstring)("Appomaly_SuspUrl_Found") and #(mp.enum_mpattributesubstring)("Appomaly_SuspUrl_Found") > 0 then
                            (mp.set_mpattribute)("HSTR:PFApps_HighlySuspUrl")
                            local l_0_47 = nil
                            -- DECOMPILER ERROR at PC440: Confused about usage of register: R15 in 'UnsetPending'

                            if l_0_2 and #l_0_44.CommandlineTokens < 6 and contains(l_0_2, {"WebLogic", "sqlservr", "tomcat", "w3wp.exe", "hfs.exe", "httpd.exe"}) then
                              (mp.set_mpattribute)("HSTR:PFApps_HighlySuspUrl_B")
                              l_0_1.Remediation_Reason = l_0_1.Remediation_Reason .. ";" .. "SuspUrl_ToBlock"
                            else
                              l_0_1.Remediation_Reason = l_0_1.Remediation_Reason .. ";" .. "SuspUrl"
                            end
                          end
                          do
                            -- DECOMPILER ERROR at PC472: Confused about usage of register: R14 in 'UnsetPending'

                            -- DECOMPILER ERROR at PC476: Confused about usage of register: R14 in 'UnsetPending'

                            if (mp.enum_mpattributesubstring)("Appomaly_") and #(mp.enum_mpattributesubstring)("Appomaly_") > 0 then
                              l_0_1.Attributes = table_dedup((mp.enum_mpattributesubstring)("Appomaly_"))
                            end
                            local l_0_48 = nil
                            local l_0_49 = nil
                            local l_0_50 = nil
                            for l_0_54,l_0_55 in ipairs(GetExecutablesFromParentsCommandLine()) do
                              local l_0_51, l_0_52, l_0_53 = , {}, 0
                              if IsFileRecentlyDropped(IsPotentiallyClean("CmdLine", l_0_37 .. ";" .. l_0_22, l_0_23)) then
                                (table.insert)(l_0_52, R29_PC496)
                                l_0_53 = l_0_53 + IsPotentiallyClean("CmdLine", l_0_37 .. ";" .. l_0_22, l_0_23)
                              end
                              if IsFileDroppedByTrackedApp(l_0_59) then
                                (table.insert)(l_0_52, R29_PC496)
                                l_0_53 = l_0_53 + 10
                              end
                            end
                            -- DECOMPILER ERROR at PC513: Confused about usage of register: R17 in 'UnsetPending'

                            l_0_1.RecentlyDroppedParents = l_0_52
                            -- DECOMPILER ERROR at PC514: Confused about usage of register: R18 in 'UnsetPending'

                            l_0_1.ParentScore = l_0_53
                            do
                              do
                                local l_0_60, l_0_61 = nil
                                if safeJsonSerialize(l_0_1, 150, nil, true) then
                                  (MpCommon.BmTriggerSig)(l_0_41.ppid, "SuspDownload_BM_Capture", safeJsonSerialize(l_0_1, 150, nil, true))
                                else
                                  if l_0_1 then
                                    set_research_data("Error", (MpCommon.Base64Encode)(R24_PC537), R24_PC537)
                                    return mp.INFECTED
                                  end
                                end
                                do return mp.CLEAN end
                                -- DECOMPILER ERROR at PC546: freeLocal<0 in 'ReleaseLocals'

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

