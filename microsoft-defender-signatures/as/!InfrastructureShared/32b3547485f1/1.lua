-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b3547485f1\1.luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 then
  local l_0_0 = (this_sigattrlog[1]).utf8p2
  local l_0_1 = safeJsonDeserialize(l_0_0)
  if not l_0_1 then
    return mp.CLEAN
  end
  local l_0_2 = GetRollingQueueAsHashTable("ExtendedDeviceProperties")
  if l_0_2 then
    (bm.add_related_string)("DeviceInfo", safeJsonSerialize(l_0_2), bm.RelatedStringBMReport)
  end
  ;
  (bm.add_related_string)("AdditionalInfo", l_0_0, bm.RelatedStringBMReport)
  if l_0_1.Score and l_0_1.Score > 30 then
    local l_0_3 = function()
  -- function num : 0_0
  local l_1_0 = 0
  local l_1_1 = GetRollingQueue("RecentThreatsOnMachine")
  if (not l_1_1 or not next(l_1_1)) and not QueryPersistContextNoPath("LastTimeQueriedThreats", "true") then
    local l_1_2 = 1800
    local l_1_3 = 100
    l_1_1 = (MpCommon.EnumThreatHistory)("", l_1_2, 0)
    SetPersistContextNoPath("LastTimeQueriedThreats", "true", l_1_2)
    for l_1_7,l_1_8 in ipairs(l_1_1) do
      local l_1_9 = {}
      -- DECOMPILER ERROR at PC37: No list found for R9 , SetList fails

      -- DECOMPILER ERROR at PC38: Overwrote pending register: R10 in 'AssignReg'

      if not ("!#CMD:PowershellProcess")(l_1_8.ThreatName, l_1_9) then
        AppendToRollingQueue("RecentThreatsOnMachine", tostring(l_1_8.ThreatName), tostring(l_1_8.Severity), l_1_2, l_1_3)
      end
    end
  end
  do
    l_1_2 = #l_1_1
    if l_1_2 == 0 then
      l_1_3 = 0
      do return l_1_2, l_1_3 end
      l_1_2 = {}
    end
    l_1_2 = GetRollingQueue
    l_1_3 = "RecentThreatsOnMachine"
    l_1_2 = l_1_2(l_1_3)
    l_1_1 = l_1_2
    local l_1_10 = nil
    l_1_3 = ipairs
    l_1_10 = l_1_1
    l_1_3 = l_1_3(l_1_10)
    for l_1_14,l_1_15 in l_1_3 do
      local l_1_14, l_1_15 = nil
      l_1_14 = l_1_13.value
      l_1_0 = l_1_0 + l_1_14
      l_1_14 = pairs
      l_1_15, l_1_2 = l_1_2, {Exploit = 5, CVE = 5, SuspIIS = 5, HighRiskHasMotW = 2, ["Susp.*Discovery"] = 2}
      l_1_14 = l_1_14(l_1_15)
      for l_1_19,l_1_20 in l_1_14 do
        local l_1_19, l_1_20 = nil
        l_1_19 = string
        l_1_19 = l_1_19.find
        l_1_20 = l_1_13.key
        l_1_19 = l_1_19(l_1_20, l_1_17, 1, false)
        if l_1_19 then
          l_1_0 = l_1_0 + l_1_18
          break
        end
      end
    end
    do return l_1_1, l_1_0 end
    -- DECOMPILER ERROR at PC101: Confused about usage of register R4 for local variables in 'ReleaseLocals'

  end
end

    local l_0_4, l_0_5 = l_0_3()
    do
      do
        if l_0_5 > 5 and (string.find)(l_0_0, "Susfile_extension", 1, true) then
          local l_0_6 = {}
          l_0_6.Remediation_Reason = "RecentDetection"
          l_0_6.Evidence = l_0_0
          l_0_6.RecentDetections = l_0_4
          l_0_6.RecentDetections_Score = l_0_5
          ;
          (bm.trigger_sig)("Remediation_2_AnomalyMultiStage", safeJsonSerialize(l_0_6))
        end
        ;
        (bm.add_related_string)("RecentDetections", safeJsonSerialize(l_0_4), bm.RelatedStringBMReport)
        ;
        (bm.add_related_string)("RecentDetections_Score", l_0_5, bm.RelatedStringBMReport)
        local l_0_7 = (bm.get_current_process_startup_info)()
        if l_0_7 then
          add_related_anomalydetections(l_0_7.ppid)
        end
        local l_0_8 = add_parents_mp()
        if l_0_8 then
          (bm.add_related_string)("ParentsInfo", safeJsonSerialize(l_0_8), bm.RelatedStringBMReport)
        end
        reportRelevantUntrustedEntitiesForPid(l_0_7.ppid)
        local l_0_9 = l_0_1.Reason
        if l_0_9 and type(l_0_9) == "table" then
          for l_0_13,l_0_14 in pairs(l_0_9) do
            if (string.find)(l_0_13, "SuspDownload", 1, true) then
              local l_0_15 = l_0_14.CmdGradingInfo
              if l_0_15 and l_0_15.Evidence_L1 then
                local l_0_16 = (l_0_15.Evidence_L1).Urls
                for l_0_20,l_0_21 in pairs(l_0_16) do
                  if l_0_21.BadUrlRep then
                    do
                      local l_0_22 = {}
                      l_0_22.Remediation_Reason = "BadUrlRep"
                      l_0_22.Evidence = l_0_0
                      ;
                      (bm.trigger_sig)("Remediation_AnomalyMultiStage", safeJsonSerialize(l_0_22))
                      do break end
                      if l_0_21.Url_Score >= 30 then
                        do
                          do
                            local l_0_23 = {}
                            l_0_23.Remediation_Reason = "HighScoreUrl"
                            l_0_23.Evidence = l_0_0
                            ;
                            (bm.trigger_sig)("Remediation_AnomalyMultiStage", safeJsonSerialize(l_0_23))
                            do break end
                            -- DECOMPILER ERROR at PC175: LeaveBlock: unexpected jumping out DO_STMT

                            -- DECOMPILER ERROR at PC175: LeaveBlock: unexpected jumping out IF_THEN_STMT

                            -- DECOMPILER ERROR at PC175: LeaveBlock: unexpected jumping out IF_STMT

                            -- DECOMPILER ERROR at PC175: LeaveBlock: unexpected jumping out DO_STMT

                            -- DECOMPILER ERROR at PC175: LeaveBlock: unexpected jumping out IF_THEN_STMT

                            -- DECOMPILER ERROR at PC175: LeaveBlock: unexpected jumping out IF_STMT

                          end
                        end
                      end
                    end
                  end
                end
              end
            else
              do
                if (string.find)(l_0_13, "Base64Cmd_child", 1, true) then
                  local l_0_24 = l_0_14.Base64GradingInfo
                  for l_0_28 = 1, 3 do
                    if l_0_24 and l_0_24["Evidence_L" .. l_0_28] then
                      local l_0_29 = (l_0_24["Evidence_L" .. l_0_28]).Urls
                      for l_0_33,l_0_34 in pairs(l_0_29) do
                        if l_0_34.BadUrlRep then
                          do
                            local l_0_35 = {}
                            l_0_35.Remediation_Reason = "BadUrlRep"
                            l_0_35.Evidence = l_0_0
                            ;
                            (bm.trigger_sig)("Remediation_AnomalyMultiStage", safeJsonSerialize(l_0_35))
                            do break end
                            if l_0_34.Url_Score >= 30 then
                              do
                                do
                                  local l_0_36 = {}
                                  l_0_36.Remediation_Reason = "HighScoreUrl"
                                  l_0_36.Evidence = l_0_0
                                  ;
                                  (bm.trigger_sig)("Remediation_AnomalyMultiStage", safeJsonSerialize(l_0_36))
                                  do break end
                                  -- DECOMPILER ERROR at PC237: LeaveBlock: unexpected jumping out DO_STMT

                                  -- DECOMPILER ERROR at PC237: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                  -- DECOMPILER ERROR at PC237: LeaveBlock: unexpected jumping out IF_STMT

                                  -- DECOMPILER ERROR at PC237: LeaveBlock: unexpected jumping out DO_STMT

                                  -- DECOMPILER ERROR at PC237: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                  -- DECOMPILER ERROR at PC237: LeaveBlock: unexpected jumping out IF_STMT

                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                  -- DECOMPILER ERROR at PC240: Confused about usage of register R12 for local variables in 'ReleaseLocals'

                end
                -- DECOMPILER ERROR at PC240: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC240: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                -- DECOMPILER ERROR at PC240: LeaveBlock: unexpected jumping out IF_STMT

              end
            end
          end
        end
        l_0_0 = mp
        l_0_0 = l_0_0.INFECTED
        return l_0_0
      end
    end
  end
end

