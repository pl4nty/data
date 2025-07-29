-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\101d77b5a07c4\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = {}
local l_0_2 = (mp.GetParentProcInfo)()
local l_0_3, l_0_4 = GetAppomalyProcessAttribute(l_0_2.ppid)
if not l_0_3 then
  return mp.CLEAN
end
local l_0_5 = safeJsonDeserialize(l_0_4)
if not l_0_5 then
  return mp.CLEAN
end
local l_0_6 = l_0_5.AppName
local l_0_7 = l_0_5.Pid
if not l_0_7 or not l_0_6 then
  return mp.CLEAN
end
local l_0_8 = add_parents_mp()
l_0_1.Parents = l_0_8
l_0_1.AppName = l_0_6
l_0_1.AppCategory = l_0_5.AppCategory
local l_0_9 = (mp.GetProcessCommandLine)(l_0_0)
if not l_0_9 then
  return mp.CLEAN
end
local l_0_10 = (mp.hstr_full_log)()
if l_0_10 and ((l_0_10[2]).matched or (l_0_10[3]).matched) and not hasBase64Content(l_0_9) then
  return mp.CLEAN
end
local l_0_11, l_0_12 = Base64Grader(l_0_9)
local l_0_13 = (mp.enum_mpattributesubstring)("Appomaly_BadUrlRep_Found")
if l_0_13 and #l_0_13 > 0 then
  (mp.set_mpattribute)("HSTR:PFApps_MaliciousCMD_B")
  return mp.CLEAN
end
if not l_0_12 or l_0_12.Score == 0 then
  return mp.CLEAN
end
l_0_12.ML_score = CommandlineMLScore()
l_0_1.Base64GradingInfo = l_0_12
if (mp.get_mpattribute)("MpCmdLineFoundB64") then
  l_0_1.MpCmdLineFoundB64 = true
else
  l_0_1.MpCmdLineFoundB64 = false
end
if l_0_12.Evidence_L1 and ((l_0_12.Evidence_L1).MultilayerEncoding or (l_0_12.Evidence_L1).Obfuscated_FailedToDecode) and l_0_12.Score > 0 then
  local l_0_14, l_0_15 = safeJsonSerialize(l_0_12, 150, nil, true)
  do
    local l_0_16, l_0_17 = (l_0_12.Evidence_L1).MultilayerEncoding and "Appomaly_MultilayerEncoded_Tracked" or "Appomaly_Encoded_Obfuscated_Tracked"
    local l_0_18 = nil
    local l_0_19 = MpCommon.BmTriggerSig
    local l_0_20 = l_0_2.ppid
    do
      l_0_19(l_0_20, l_0_18, l_0_14 or l_0_15)
      if l_0_12.Score <= 15 and not next((l_0_12.Evidence_L1).Urls) and not hasTamperingCmd(l_0_9) then
        return mp.CLEAN
      end
      if l_0_12.Score > 30 then
        if l_0_12.CommandlineTokens then
          local l_0_22 = nil
          do
            local l_0_23, l_0_24 = , ((MpCommon.GetImagePathFromPid)(l_0_0)):match("([^\\]+)$") or ""
            local l_0_25 = nil
            -- DECOMPILER ERROR at PC186: Confused about usage of register: R15 in 'UnsetPending'

            -- DECOMPILER ERROR at PC202: Confused about usage of register: R15 in 'UnsetPending'

            local l_0_26 = nil
            local l_0_27, l_0_28, l_0_29 = {ParentName = l_0_6, ProcessName = l_0_24, Source = "CMD", SignatureName = "PFApps.C", CommandlineScore = l_0_12.Score, CommandlineScoreIndicator = l_0_1.Base64GradingInfo, AnomalyTableName = "Appomaly_ChildProcName_CmdLine_Base64", TableAge = GetAnomalyTableAge("Appomaly_ChildProcName_CmdLine_Base64"), AttributeName = "PFApp_Parent", AttributeCategory = "PFServers"}, AnomalyTableCheck("Appomaly_ChildProcName_CmdLine", l_0_6 .. ";" .. l_0_24 .. ";" .. (table.concat)(l_0_12.CommandlineTokens, "|"), 30)
            if l_0_29 == false and "Appomaly_ChildProcName_CmdLine" == false then
              return mp.CLEAN
            else
              if l_0_29 and not "Appomaly_ChildProcName_CmdLine" then
                local l_0_30, l_0_31, l_0_32 = , IsPotentiallyClean("CmdLine", l_0_6 .. ";" .. l_0_26, l_0_12.CommandlineTokens)
                if l_0_32 then
                  l_0_1.IsPotentiallyClean = "CmdLine"
                end
                ;
                (MpCommon.BmTriggerSig)(l_0_2.ppid, "AnomalousChildCommandline", safeJsonSerialize(l_0_27))
              end
            end
            do
              local l_0_33, l_0_34 = , startTrackingApp(l_0_7, l_0_6, "PFServers", "PFApp_Parent")
              if not l_0_34 then
                l_0_7.SignatureName = "PFApps.C"
                ;
                (MpCommon.BmTriggerSig)(l_0_7, "ProcAttribError", safeJsonSerialize(R20_PC261))
              else
                local l_0_35 = nil
                local l_0_36 = "Base64Cmd_child[" .. l_0_0:match("pid:(%d+)") .. "][cmd/PFApps.C]"
                IncreaseProcessAnomalyScore(l_0_2.ppid, l_0_12.Score, l_0_36, "PFApp_Parent", {ProcessName = (MpCommon.GetImagePathFromPid)(l_0_0), IsProcessFriendly = (MpCommon.IsFriendlyProcess)(l_0_0), Pid = l_0_0, Base64GradingInfo = l_0_1.Base64GradingInfo, IndicatorScore = l_0_12.Score, Parents = l_0_8})
                if next(l_0_35) and l_0_35.IsNewApp then
                  l_0_35.SignatureName = "PFApps.C"
                  l_0_35.Score = l_0_12.Score
                  ;
                  (MpCommon.BmTriggerSig)(l_0_7, "SetProcessAttrib", safeJsonSerialize(l_0_35))
                end
              end
              do
                l_0_1.Concrete = false
                l_0_1.Remediation_Reason = ""
                local l_0_37 = nil
                for l_0_41 = 1, 3 do
                  local l_0_38 = l_0_1.Base64GradingInfo
                  -- DECOMPILER ERROR at PC323: Confused about usage of register: R18 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC329: Confused about usage of register: R18 in 'UnsetPending'

                  if l_0_38 and l_0_38["Evidence_L" .. MpCommon.BmTriggerSig] then
                    for l_0_46,l_0_47 in pairs((l_0_38["Evidence_L" .. MpCommon.BmTriggerSig]).Urls) do
                      local l_0_43 = nil
                      -- DECOMPILER ERROR at PC337: Confused about usage of register: R24 in 'UnsetPending'

                      if (MpCommon.BmTriggerSig).BadUrlRep then
                        l_0_1.Remediation_Reason = "BadUrlRep"
                        l_0_1.Concrete = true
                        break
                      end
                    end
                    do
                      do
                        if (l_0_38["Evidence_L" .. l_0_42]).MultilayerEncoding then
                          (mp.set_mpattribute)("HSTR:PFApps_MultilayerEncoded_A")
                          l_0_1.Concrete = true
                        end
                        -- DECOMPILER ERROR at PC357: LeaveBlock: unexpected jumping out DO_STMT

                        -- DECOMPILER ERROR at PC357: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC357: LeaveBlock: unexpected jumping out IF_STMT

                      end
                    end
                  end
                end
                if not next((l_0_12.Evidence_L1).Urls) then
                  return mp.CLEAN
                end
                if l_0_12.Score > 45 then
                  l_0_1.Remediation_Reason = l_0_1.Remediation_Reason .. ";" .. "HighScore"
                end
                -- DECOMPILER ERROR at PC375: Confused about usage of register: R14 in 'UnsetPending'

                -- DECOMPILER ERROR at PC377: Confused about usage of register: R14 in 'UnsetPending'

                -- DECOMPILER ERROR at PC380: Confused about usage of register: R14 in 'UnsetPending'

                do
                  if l_0_38 and l_0_38.Evidence_L1 then
                    local l_0_48 = nil
                    if (l_0_38.Evidence_L1).MultilayerEncoding then
                      l_0_1.Remediation_Reason = l_0_1.Remediation_Reason .. ";" .. "MultilayerEncoding"
                    end
                  end
                  local l_0_49 = nil
                  if (mp.enum_mpattributesubstring)("Appomaly_HighlySuspCmd_Pattern_") and #(mp.enum_mpattributesubstring)("Appomaly_HighlySuspCmd_Pattern_") > 0 then
                    (mp.set_mpattribute)("HSTR:PFApps_SuspPatterns_encoded3")
                    l_0_1.Remediation_Reason = l_0_1.Remediation_Reason .. ";" .. "SuspPattern"
                  end
                  -- DECOMPILER ERROR at PC414: Confused about usage of register: R15 in 'UnsetPending'

                  if (mp.enum_mpattributesubstring)("Appomaly_SuspUrl_Found") and #(mp.enum_mpattributesubstring)("Appomaly_SuspUrl_Found") > 0 then
                    (mp.set_mpattribute)("HSTR:PFApps_HighlySuspUrl")
                    l_0_1.Remediation_Reason = l_0_1.Remediation_Reason .. ";" .. "SuspUrl"
                  end
                  -- DECOMPILER ERROR at PC433: Confused about usage of register: R15 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC437: Confused about usage of register: R15 in 'UnsetPending'

                  if (mp.enum_mpattributesubstring)("Appomaly_") and #(mp.enum_mpattributesubstring)("Appomaly_") > 0 then
                    l_0_1.Attributes = table_dedup((mp.enum_mpattributesubstring)("Appomaly_"))
                  end
                  local l_0_50 = nil
                  local l_0_51 = {}
                  for l_0_55,l_0_56 in ipairs(l_0_1.Parents) do
                    local l_0_52 = 0
                    local l_0_58, l_0_59 = IsFileRecentlyDropped(l_0_46.ImagePath)
                    if l_0_58 then
                      (table.insert)(l_0_51, R28_PC455)
                      l_0_52 = l_0_52 + l_0_59
                    end
                  end
                  l_0_1.RecentlyDroppedParents = l_0_51
                  -- DECOMPILER ERROR at PC460: Confused about usage of register: R17 in 'UnsetPending'

                  l_0_1.ParentScore = l_0_52
                  do
                    local l_0_60, l_0_61 = , safeJsonSerialize(l_0_1, 150, nil, true)
                    if l_0_61 then
                      set_research_data("Evidence", (MpCommon.Base64Encode)(l_0_61), false)
                      ;
                      (MpCommon.BmTriggerSig)(l_0_2.ppid, "SuspDownload2_BM_Capture", l_0_61)
                    else
                      if l_0_1 then
                        set_research_data("Error", (MpCommon.Base64Encode)(R23_PC491), R23_PC491)
                        return mp.INFECTED
                      else
                        -- DECOMPILER ERROR at PC501: Overwrote pending register: R23 in 'AssignReg'

                        set_research_data("Error", "Failed Serialization w/o error", R23_PC491)
                      end
                    end
                    do return mp.CLEAN end
                    -- DECOMPILER ERROR at PC506: freeLocal<0 in 'ReleaseLocals'

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

