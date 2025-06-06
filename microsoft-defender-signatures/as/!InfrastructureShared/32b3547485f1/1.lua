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
  ;
  (bm.add_related_string)("AdditionalInfo", l_0_0, bm.RelatedStringBMReport)
  if l_0_1.Score and l_0_1.Score > 30 then
    local l_0_2 = function()
  -- function num : 0_0
  local l_1_0 = 0
  local l_1_1 = GetRollingQueue("RecentThreatsOnMachine")
  if (not l_1_1 or not next(l_1_1)) and not QueryPersistContextNoPath("LastTimeQueriedThreats", "true") then
    local l_1_2 = 1800
    local l_1_3 = 100
    l_1_1 = (MpCommon.EnumThreatHistory)("", l_1_2, 0)
    SetPersistContextNoPath("LastTimeQueriedThreats", "true", l_1_2)
    for l_1_7,l_1_8 in ipairs(l_1_1) do
      AppendToRollingQueue("RecentThreatsOnMachine", tostring(l_1_8.ThreatName), tostring(l_1_8.Severity), l_1_2, l_1_3)
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
    local l_1_9 = nil
    l_1_3 = ipairs
    l_1_9 = l_1_1
    l_1_3 = l_1_3(l_1_9)
    for l_1_13,l_1_14 in l_1_3 do
      local l_1_13, l_1_14 = nil
      l_1_13 = l_1_12.value
      l_1_0 = l_1_0 + l_1_13
      l_1_13 = pairs
      l_1_14, l_1_2 = l_1_2, {Exploit = 5, CVE = 5, SuspIIS = 5, HighRiskHasMotW = 2, ["Susp.*Discovery"] = 2}
      l_1_13 = l_1_13(l_1_14)
      for l_1_18,l_1_19 in l_1_13 do
        local l_1_18, l_1_19 = nil
        l_1_18 = string
        l_1_18 = l_1_18.find
        l_1_19 = l_1_12.key
        l_1_18 = l_1_18(l_1_19, l_1_16, 1, false)
        if l_1_18 then
          l_1_0 = l_1_0 + l_1_17
          break
        end
      end
    end
    do return l_1_1, l_1_0 end
    -- DECOMPILER ERROR at PC92: Confused about usage of register R4 for local variables in 'ReleaseLocals'

  end
end

    local l_0_3, l_0_4 = l_0_2()
    ;
    (bm.add_related_string)("RecentDetections", safeJsonSerialize(l_0_3), bm.RelatedStringBMReport)
    ;
    (bm.add_related_string)("RecentDetections_Score", l_0_4, bm.RelatedStringBMReport)
  end
  do
    local l_0_5 = (bm.get_current_process_startup_info)()
    if l_0_5 then
      add_related_anomalydetections(l_0_5.ppid)
    end
    local l_0_6 = add_parents_mp()
    if l_0_6 then
      (bm.add_related_string)("ParentsInfo", safeJsonSerialize(l_0_6), bm.RelatedStringBMReport)
    end
    reportRelevantUntrustedEntitiesForPid(l_0_5.ppid)
    local l_0_7 = l_0_1.Reason
    if l_0_7 and type(l_0_7) == "table" then
      for l_0_11,l_0_12 in pairs(l_0_7) do
        if (string.find)(l_0_11, "SuspDownload", 1, true) then
          local l_0_13 = l_0_12.CmdGradingInfo
          if l_0_13 and l_0_13.Evidence_L1 then
            local l_0_14 = (l_0_13.Evidence_L1).Urls
            for l_0_18,l_0_19 in pairs(l_0_14) do
              if l_0_19.BadUrlRep then
                do
                  local l_0_20 = {}
                  l_0_20.Remediation_Reason = "BadUrlRep"
                  l_0_20.Evidence = l_0_0
                  ;
                  (bm.trigger_sig)("Remediation_AnomalyMultiStage", safeJsonSerialize(l_0_20))
                  do break end
                  if l_0_19.Url_Score >= 30 then
                    do
                      do
                        local l_0_21 = {}
                        l_0_21.Remediation_Reason = "HighScoreUrl"
                        l_0_21.Evidence = l_0_0
                        ;
                        (bm.trigger_sig)("Remediation_AnomalyMultiStage", safeJsonSerialize(l_0_21))
                        do break end
                        -- DECOMPILER ERROR at PC138: LeaveBlock: unexpected jumping out DO_STMT

                        -- DECOMPILER ERROR at PC138: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC138: LeaveBlock: unexpected jumping out IF_STMT

                        -- DECOMPILER ERROR at PC138: LeaveBlock: unexpected jumping out DO_STMT

                        -- DECOMPILER ERROR at PC138: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC138: LeaveBlock: unexpected jumping out IF_STMT

                      end
                    end
                  end
                end
              end
            end
          end
        else
          do
            if (string.find)(l_0_11, "Base64Cmd_child", 1, true) then
              local l_0_22 = l_0_12.Base64GradingInfo
              for l_0_26 = 1, 3 do
                if l_0_22 and l_0_22["Evidence_L" .. l_0_26] then
                  local l_0_27 = (l_0_22["Evidence_L" .. l_0_26]).Urls
                  for l_0_31,l_0_32 in pairs(l_0_27) do
                    if l_0_32.BadUrlRep then
                      do
                        local l_0_33 = {}
                        l_0_33.Remediation_Reason = "BadUrlRep"
                        l_0_33.Evidence = l_0_0
                        ;
                        (bm.trigger_sig)("Remediation_AnomalyMultiStage", safeJsonSerialize(l_0_33))
                        do break end
                        if l_0_32.Url_Score >= 30 then
                          do
                            do
                              local l_0_34 = {}
                              l_0_34.Remediation_Reason = "HighScoreUrl"
                              l_0_34.Evidence = l_0_0
                              ;
                              (bm.trigger_sig)("Remediation_AnomalyMultiStage", safeJsonSerialize(l_0_34))
                              do break end
                              -- DECOMPILER ERROR at PC200: LeaveBlock: unexpected jumping out DO_STMT

                              -- DECOMPILER ERROR at PC200: LeaveBlock: unexpected jumping out IF_THEN_STMT

                              -- DECOMPILER ERROR at PC200: LeaveBlock: unexpected jumping out IF_STMT

                              -- DECOMPILER ERROR at PC200: LeaveBlock: unexpected jumping out DO_STMT

                              -- DECOMPILER ERROR at PC200: LeaveBlock: unexpected jumping out IF_THEN_STMT

                              -- DECOMPILER ERROR at PC200: LeaveBlock: unexpected jumping out IF_STMT

                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
              -- DECOMPILER ERROR at PC203: Confused about usage of register R11 for local variables in 'ReleaseLocals'

            end
            -- DECOMPILER ERROR at PC203: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC203: LeaveBlock: unexpected jumping out IF_ELSE_STMT

            -- DECOMPILER ERROR at PC203: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
    l_0_0 = mp
    l_0_0 = l_0_0.INFECTED
    return l_0_0
  end
end

