-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\115d717bf9d3a\1.luac 

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
local l_0_14 = (mp.enum_mpattributesubstring)("Appomaly_HighlySuspCmd_Pattern")
if l_0_14 and #l_0_14 > 0 then
  (mp.set_mpattribute)("HSTR:PFApps_SuspPatterns_encoded")
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
if l_0_12.Score <= 15 and not next((l_0_12.Evidence_L1).Urls) and not hasTamperingCmd(l_0_9) then
  return mp.CLEAN
end
if l_0_12.Score > 30 then
  if l_0_12.CommandlineTokens then
    local l_0_15 = (MpCommon.GetImagePathFromPid)(l_0_0)
    do
      local l_0_16, l_0_17 = l_0_15:match("([^\\]+)$") or ""
      local l_0_18 = nil
      local l_0_19 = {ParentName = l_0_6, ProcessName = l_0_18, Source = "CMD", SignatureName = "PFApps.C", CommandlineScore = l_0_12.Score, CommandlineScoreIndicator = l_0_1.Base64GradingInfo, AnomalyTableName = "Appomaly_ChildProcName_CmdLine_Base64", TableAge = GetAnomalyTableAge("Appomaly_ChildProcName_CmdLine_Base64"), AttributeName = "PFApp_Parent", AttributeCategory = "PFServers"}
      local l_0_20, l_0_21, l_0_22 = , AnomalyTableCheck("Appomaly_ChildProcName_CmdLine", l_0_6 .. ";" .. l_0_18 .. ";" .. (table.concat)(l_0_12.CommandlineTokens, "|"), 30)
      if l_0_21 == false and l_0_22 == false then
        return mp.CLEAN
      else
        if l_0_21 and not l_0_22 then
          local l_0_23, l_0_24, l_0_25 = , IsPotentiallyClean("CmdLine", l_0_6 .. ";" .. l_0_18, l_0_12.CommandlineTokens)
          if l_0_24 then
            l_0_1.IsPotentiallyClean = l_0_25
          end
          ;
          (MpCommon.BmTriggerSig)(l_0_2.ppid, "AnomalousChildCommandline", safeJsonSerialize(l_0_19))
        end
      end
      do
        local l_0_26, l_0_27 = startTrackingApp(l_0_7, l_0_6, "PFServers", "PFApp_Parent")
        if not l_0_26 then
          l_0_27.SignatureName = "PFApps.C"
          ;
          (MpCommon.BmTriggerSig)(l_0_7, "ProcAttribError", safeJsonSerialize(l_0_27))
        else
          local l_0_28 = "Base64Cmd_child[" .. l_0_0:match("pid:(%d+)") .. "][cmd/PFApps.C]"
          local l_0_29 = {}
          l_0_29.ProcessName = (MpCommon.GetImagePathFromPid)(l_0_0)
          l_0_29.IsProcessFriendly = (MpCommon.IsFriendlyProcess)(l_0_0)
          l_0_29.Pid = l_0_0
          l_0_29.Base64GradingInfo = l_0_1.Base64GradingInfo
          l_0_29.IndicatorScore = l_0_12.Score
          l_0_29.Parents = l_0_8
          IncreaseProcessAnomalyScore(l_0_2.ppid, l_0_12.Score, l_0_28, "PFApp_Parent", l_0_29)
          if next(l_0_27) and l_0_27.IsNewApp then
            l_0_27.SignatureName = "PFApps.C"
            l_0_27.Score = l_0_12.Score
            ;
            (MpCommon.BmTriggerSig)(l_0_7, "SetProcessAttrib", safeJsonSerialize(l_0_27))
          end
        end
        do
          l_0_1.Concrete = false
          l_0_1.Remediation_Reason = ""
          local l_0_30 = l_0_1.Base64GradingInfo
          for l_0_34 = 1, 3 do
            if l_0_30 and l_0_30["Evidence_L" .. l_0_34] then
              local l_0_35 = (l_0_30["Evidence_L" .. l_0_34]).Urls
              for l_0_39,l_0_40 in pairs(l_0_35) do
                if l_0_40.BadUrlRep then
                  l_0_1.Remediation_Reason = "BadUrlRep"
                  l_0_1.Concrete = true
                  break
                end
              end
              do
                do
                  if (l_0_30["Evidence_L" .. l_0_34]).MultilayerEncoding then
                    (mp.set_mpattribute)("HSTR:PFApps_MultilayerEncoded_A")
                    l_0_1.Concrete = true
                    return mp.CLEAN
                  end
                  -- DECOMPILER ERROR at PC335: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC335: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC335: LeaveBlock: unexpected jumping out IF_STMT

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
          do
            if l_0_30 and l_0_30.Evidence_L1 then
              local l_0_41 = l_0_30.Evidence_L1
              if l_0_41.MultilayerEncoding then
                l_0_1.Remediation_Reason = l_0_1.Remediation_Reason .. ";" .. "MultilayerEncoding"
              end
            end
            local l_0_42, l_0_43 = safeJsonSerialize(l_0_1, 150, nil, true)
            if l_0_42 then
              set_research_data("Evidence", (MpCommon.Base64Encode)(l_0_42), false)
              ;
              (MpCommon.BmTriggerSig)(l_0_2.ppid, "SuspDownload2_BM_Capture", l_0_42)
            else
              if l_0_43 then
                set_research_data("Error", (MpCommon.Base64Encode)(l_0_43), false)
                return mp.INFECTED
              else
                set_research_data("Error", "Failed Serialization w/o error", false)
              end
            end
            return mp.CLEAN
          end
        end
      end
    end
  end
end

