-- Threat: !InfrastructureShared
-- Name: 32b3547485f1
-- Type: 21
-- Includes: BMLuaLib, AppomalyHelpers, LuaFuncHelper

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 then
  local l_0_0 = this_sigattrlog[1].utf8p2
  local l_0_1 = safeJsonDeserialize(l_0_0)
  if not l_0_1 then
    return mp.CLEAN
  end
  local l_0_2 = GetRollingQueueAsHashTable("ExtendedDeviceProperties")
  if l_0_2 then
    bm.add_related_string("DeviceInfo", safeJsonSerialize(l_0_2), bm.RelatedStringBMReport)
  end
  if l_0_1.AppName and contains(l_0_1.AppName, "VSCode") then
    l_0_1.InstalledExtensions = GetRollingQueueKeysAsString("InstalledExtensions_VSCode")
  end
  bm.add_related_string("AdditionalInfo", safeJsonSerialize(l_0_1), bm.RelatedStringBMReport)
  if l_0_1.Score and l_0_1.Score > 30 then
    local function l_0_3()
      local l_1_0 = 0
      
      local l_1_1 = GetRollingQueue("RecentThreatsOnMachine")
      if (not l_1_1 or not next(l_1_1)) and not QueryPersistContextNoPath("LastTimeQueriedThreats", "true") then
        local l_1_2 = 1800
        local l_1_3 = 100
        l_1_1 = MpCommon.EnumThreatHistory("", l_1_2, 0)
        SetPersistContextNoPath("LastTimeQueriedThreats", "true", l_1_2)
        for l_1_4, l_1_5 in ipairs(l_1_1) do
          local l_1_6 = {
            "!#CMD:PowershellProcess"
          }
          if not contains(l_1_5.ThreatName, l_1_6) then
            AppendToRollingQueue("RecentThreatsOnMachine", tostring(l_1_5.ThreatName), tostring(l_1_5.Severity), l_1_2, l_1_3)
          end
        end
      end
      if #l_1_1 == 0 then
        return {}, 0
      end
      l_1_1 = GetRollingQueue("RecentThreatsOnMachine")
      local l_1_7 = {
        Exploit = 5,
        CVE = 5,
        SuspIIS = 5,
        HighRiskHasMotW = 2,
        ["Susp.*Discovery"] = 2
      }
      for l_1_8, l_1_9 in ipairs(l_1_1) do
        if l_1_9.value ~= 1 then
          l_1_0 = l_1_0 + l_1_9.value
        end
        for l_1_10, l_1_11 in pairs(l_1_7) do
          if string.find(l_1_9.key, l_1_10, 1, false) then
            l_1_0 = l_1_0 + l_1_11
            break
          end
        end
      end
      return l_1_1, l_1_0
    end
    
    local l_0_4, l_0_5 = l_0_3()
    if 5 < l_0_5 and string.find(l_0_0, "Susfile_extension", 1, true) then
      local l_0_6 = {}
      l_0_6.Remediation_Reason = "RecentDetection"
      l_0_6.Evidence = l_0_0
      l_0_6.RecentDetections = convert_to_hashtable(l_0_4)
      l_0_6.RecentDetections_Score = l_0_5
      bm.trigger_sig("Remediation_2_AnomalyMultiStage", safeJsonSerialize(l_0_6))
    end
    bm.add_related_string("RecentDetections", safeJsonSerialize(l_0_4), bm.RelatedStringBMReport)
    bm.add_related_string("RecentDetections_Score", l_0_5, bm.RelatedStringBMReport)
  end
  local l_0_7 = bm.get_current_process_startup_info()
  if l_0_7 then
    add_related_anomalydetections(l_0_7.ppid)
  end
  local l_0_8 = add_parents_mp()
  if l_0_8 then
    bm.add_related_string("ParentsInfo", safeJsonSerialize(l_0_8), bm.RelatedStringBMReport)
  end
  reportRelevantUntrustedEntitiesForPid(l_0_7.ppid)
  local l_0_9 = l_0_1.Reason
  if l_0_9 and type(l_0_9) == "table" then
    for l_0_10, l_0_11 in pairs(l_0_9) do
      if string.find(l_0_10, "SuspDownload", 1, true) then
        do
          local l_0_12 = l_0_11.CmdGradingInfo
          if l_0_12 and l_0_12.Evidence_L1 then
            local l_0_13 = l_0_12.Evidence_L1.Urls
            for l_0_14, l_0_15 in pairs(l_0_13) do
              if l_0_15.BadUrlRep then
                local l_0_16 = {}
                l_0_16.Remediation_Reason = "BadUrlRep"
                l_0_16.Evidence = l_0_0
                bm.trigger_sig("Remediation_AnomalyMultiStage", safeJsonSerialize(l_0_16))
                break
              end
              if 30 <= l_0_15.Url_Score then
                local l_0_17 = {}
                l_0_17.Remediation_Reason = "HighScoreUrl"
                l_0_17.Evidence = l_0_0
                bm.trigger_sig("Remediation_AnomalyMultiStage", safeJsonSerialize(l_0_17))
                break
              end
            end
          end
        end
      elseif string.find(l_0_10, "Base64Cmd_child", 1, true) then
        local l_0_18 = l_0_11.Base64GradingInfo
        for l_0_19 = 1, 3 do
          if l_0_18 and l_0_18["Evidence_L" .. l_0_19] then
            local l_0_20 = l_0_18["Evidence_L" .. l_0_19].Urls
            for l_0_21, l_0_22 in pairs(l_0_20) do
              if l_0_22.BadUrlRep then
                local l_0_23 = {}
                l_0_23.Remediation_Reason = "BadUrlRep"
                l_0_23.Evidence = l_0_0
                bm.trigger_sig("Remediation_AnomalyMultiStage", safeJsonSerialize(l_0_23))
                break
              end
              if 30 <= l_0_22.Url_Score then
                local l_0_24 = {}
                l_0_24.Remediation_Reason = "HighScoreUrl"
                l_0_24.Evidence = l_0_0
                bm.trigger_sig("Remediation_AnomalyMultiStage", safeJsonSerialize(l_0_24))
                break
              end
            end
          end
        end
      end
    end
  end
end
local l_0_25, l_0_26 = pcall(reportBmInfo)
if not l_0_25 and l_0_26 then
  bm.add_related_string("bmInfoFailReason", tostring(l_0_26), bm.RelatedStringBMReport)
end
return mp.INFECTED
