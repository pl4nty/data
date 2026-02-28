local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1
L0_1 = this_sigattrlog
L0_1 = L0_1[1]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[1]
  L0_1 = L0_1.utf8p2
  if L0_1 then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[1]
    L0_1 = L0_1.utf8p2
    L1_1 = safeJsonDeserialize
    L2_1 = L0_1
    L1_1 = L1_1(L2_1)
    if not L1_1 then
      L2_1 = mp
      L2_1 = L2_1.CLEAN
      return L2_1
    end
    L2_1 = GetRollingQueueAsHashTable
    L3_1 = "ExtendedDeviceProperties"
    L2_1 = L2_1(L3_1)
    if L2_1 then
      L3_1 = bm
      L3_1 = L3_1.add_related_string
      L4_1 = "DeviceInfo"
      L5_1 = safeJsonSerialize
      L6_1 = L2_1
      L5_1 = L5_1(L6_1)
      L6_1 = bm
      L6_1 = L6_1.RelatedStringBMReport
      L3_1(L4_1, L5_1, L6_1)
    end
    L3_1 = bm
    L3_1 = L3_1.add_related_string
    L4_1 = "AdditionalInfo"
    L5_1 = L0_1
    L6_1 = bm
    L6_1 = L6_1.RelatedStringBMReport
    L3_1(L4_1, L5_1, L6_1)
    L3_1 = L1_1.Score
    if L3_1 then
      L3_1 = L1_1.Score
      if 30 < L3_1 then
        function L3_1()
          local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
          
          L0_2 = 0
          L1_2 = GetRollingQueue
          L2_2 = "RecentThreatsOnMachine"
          L1_2 = L1_2(L2_2)
          if L1_2 then
            L2_2 = next
            L3_2 = L1_2
            L2_2 = L2_2(L3_2)
            if L2_2 then
              goto lbl_58
            end
          end
          L2_2 = QueryPersistContextNoPath
          L3_2 = "LastTimeQueriedThreats"
          L4_2 = "true"
          L2_2 = L2_2(L3_2, L4_2)
          if not L2_2 then
            L2_2 = 1800
            L3_2 = 100
            L4_2 = MpCommon
            L4_2 = L4_2.EnumThreatHistory
            L5_2 = ""
            L6_2 = L2_2
            L7_2 = 0
            L4_2 = L4_2(L5_2, L6_2, L7_2)
            L1_2 = L4_2
            L4_2 = SetPersistContextNoPath
            L5_2 = "LastTimeQueriedThreats"
            L6_2 = "true"
            L7_2 = L2_2
            L4_2(L5_2, L6_2, L7_2)
            L4_2 = ipairs
            L5_2 = L1_2
            L4_2, L5_2, L6_2 = L4_2(L5_2)
            for L7_2, L8_2 in L4_2, L5_2, L6_2 do
              L9_2 = {}
              L10_2 = "!#CMD:PowershellProcess"
              L9_2[1] = L10_2
              L10_2 = contains
              L11_2 = L8_2.ThreatName
              L12_2 = L9_2
              L10_2 = L10_2(L11_2, L12_2)
              if not L10_2 then
                L10_2 = AppendToRollingQueue
                L11_2 = "RecentThreatsOnMachine"
                L12_2 = tostring
                L13_2 = L8_2.ThreatName
                L12_2 = L12_2(L13_2)
                L13_2 = tostring
                L14_2 = L8_2.Severity
                L13_2 = L13_2(L14_2)
                L14_2 = L2_2
                L15_2 = L3_2
                L10_2(L11_2, L12_2, L13_2, L14_2, L15_2)
              end
            end
          end
          ::lbl_58::
          L2_2 = #L1_2
          if L2_2 == 0 then
            L2_2 = {}
            L3_2 = 0
            return L2_2, L3_2
          end
          L2_2 = GetRollingQueue
          L3_2 = "RecentThreatsOnMachine"
          L2_2 = L2_2(L3_2)
          L1_2 = L2_2
          L2_2 = {}
          L2_2.Exploit = 5
          L2_2.CVE = 5
          L2_2.SuspIIS = 5
          L2_2.HighRiskHasMotW = 2
          L2_2["Susp.*Discovery"] = 2
          L3_2 = ipairs
          L4_2 = L1_2
          L3_2, L4_2, L5_2 = L3_2(L4_2)
          for L6_2, L7_2 in L3_2, L4_2, L5_2 do
            L8_2 = L7_2.value
            if L8_2 ~= 1 then
              L8_2 = L7_2.value
              L0_2 = L0_2 + L8_2
            end
            L8_2 = pairs
            L9_2 = L2_2
            L8_2, L9_2, L10_2 = L8_2(L9_2)
            for L11_2, L12_2 in L8_2, L9_2, L10_2 do
              L13_2 = string
              L13_2 = L13_2.find
              L14_2 = L7_2.key
              L15_2 = L11_2
              L16_2 = 1
              L17_2 = false
              L13_2 = L13_2(L14_2, L15_2, L16_2, L17_2)
              if L13_2 then
                L0_2 = L0_2 + L12_2
                break
              end
            end
          end
          L3_2 = L1_2
          L4_2 = L0_2
          return L3_2, L4_2
        end
        
        L4_1 = L3_1
        L4_1, L5_1 = L4_1()
        if 5 < L5_1 then
          L6_1 = string
          L6_1 = L6_1.find
          L7_1 = L0_1
          L8_1 = "Susfile_extension"
          L9_1 = 1
          L10_1 = true
          L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
          if L6_1 then
            L6_1 = {}
            L6_1.Remediation_Reason = "RecentDetection"
            L6_1.Evidence = L0_1
            L7_1 = convert_to_hashtable
            L8_1 = L4_1
            L7_1 = L7_1(L8_1)
            L6_1.RecentDetections = L7_1
            L6_1.RecentDetections_Score = L5_1
            L7_1 = bm
            L7_1 = L7_1.trigger_sig
            L8_1 = "Remediation_2_AnomalyMultiStage"
            L9_1 = safeJsonSerialize
            L10_1 = L6_1
            L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1 = L9_1(L10_1)
            L7_1(L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1)
          end
        end
        L6_1 = bm
        L6_1 = L6_1.add_related_string
        L7_1 = "RecentDetections"
        L8_1 = safeJsonSerialize
        L9_1 = L4_1
        L8_1 = L8_1(L9_1)
        L9_1 = bm
        L9_1 = L9_1.RelatedStringBMReport
        L6_1(L7_1, L8_1, L9_1)
        L6_1 = bm
        L6_1 = L6_1.add_related_string
        L7_1 = "RecentDetections_Score"
        L8_1 = L5_1
        L9_1 = bm
        L9_1 = L9_1.RelatedStringBMReport
        L6_1(L7_1, L8_1, L9_1)
      end
    end
    L3_1 = bm
    L3_1 = L3_1.get_current_process_startup_info
    L3_1 = L3_1()
    if L3_1 then
      L4_1 = add_related_anomalydetections
      L5_1 = L3_1.ppid
      L4_1(L5_1)
    end
    L4_1 = add_parents_mp
    L4_1 = L4_1()
    if L4_1 then
      L5_1 = bm
      L5_1 = L5_1.add_related_string
      L6_1 = "ParentsInfo"
      L7_1 = safeJsonSerialize
      L8_1 = L4_1
      L7_1 = L7_1(L8_1)
      L8_1 = bm
      L8_1 = L8_1.RelatedStringBMReport
      L5_1(L6_1, L7_1, L8_1)
    end
    L5_1 = reportRelevantUntrustedEntitiesForPid
    L6_1 = L3_1.ppid
    L5_1(L6_1)
    L5_1 = L1_1.Reason
    if L5_1 then
      L6_1 = type
      L7_1 = L5_1
      L6_1 = L6_1(L7_1)
      if L6_1 == "table" then
        L6_1 = pairs
        L7_1 = L5_1
        L6_1, L7_1, L8_1 = L6_1(L7_1)
        for L9_1, L10_1 in L6_1, L7_1, L8_1 do
          L11_1 = string
          L11_1 = L11_1.find
          L12_1 = L9_1
          L13_1 = "SuspDownload"
          L14_1 = 1
          L15_1 = true
          L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
          if L11_1 then
            L11_1 = L10_1.CmdGradingInfo
            if L11_1 then
              L12_1 = L11_1.Evidence_L1
              if L12_1 then
                L12_1 = L11_1.Evidence_L1
                L12_1 = L12_1.Urls
                L13_1 = pairs
                L14_1 = L12_1
                L13_1, L14_1, L15_1 = L13_1(L14_1)
                for L16_1, L17_1 in L13_1, L14_1, L15_1 do
                  L18_1 = L17_1.BadUrlRep
                  if L18_1 then
                    L18_1 = {}
                    L18_1.Remediation_Reason = "BadUrlRep"
                    L18_1.Evidence = L0_1
                    L19_1 = bm
                    L19_1 = L19_1.trigger_sig
                    L20_1 = "Remediation_AnomalyMultiStage"
                    L21_1 = safeJsonSerialize
                    L22_1 = L18_1
                    L21_1, L22_1, L23_1, L24_1, L25_1, L26_1 = L21_1(L22_1)
                    L19_1(L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1)
                    break
                  end
                  L18_1 = L17_1.Url_Score
                  if 30 <= L18_1 then
                    L18_1 = {}
                    L18_1.Remediation_Reason = "HighScoreUrl"
                    L18_1.Evidence = L0_1
                    L19_1 = bm
                    L19_1 = L19_1.trigger_sig
                    L20_1 = "Remediation_AnomalyMultiStage"
                    L21_1 = safeJsonSerialize
                    L22_1 = L18_1
                    L21_1, L22_1, L23_1, L24_1, L25_1, L26_1 = L21_1(L22_1)
                    L19_1(L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1)
                    break
                  end
                end
              end
            end
          else
            L11_1 = string
            L11_1 = L11_1.find
            L12_1 = L9_1
            L13_1 = "Base64Cmd_child"
            L14_1 = 1
            L15_1 = true
            L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
            if L11_1 then
              L11_1 = L10_1.Base64GradingInfo
              L12_1 = 1
              L13_1 = 3
              L14_1 = 1
              for L15_1 = L12_1, L13_1, L14_1 do
                if L11_1 then
                  L16_1 = "Evidence_L"
                  L17_1 = L15_1
                  L16_1 = L16_1 .. L17_1
                  L16_1 = L11_1[L16_1]
                  if L16_1 then
                    L16_1 = "Evidence_L"
                    L17_1 = L15_1
                    L16_1 = L16_1 .. L17_1
                    L16_1 = L11_1[L16_1]
                    L16_1 = L16_1.Urls
                    L17_1 = pairs
                    L18_1 = L16_1
                    L17_1, L18_1, L19_1 = L17_1(L18_1)
                    for L20_1, L21_1 in L17_1, L18_1, L19_1 do
                      L22_1 = L21_1.BadUrlRep
                      if L22_1 then
                        L22_1 = {}
                        L22_1.Remediation_Reason = "BadUrlRep"
                        L22_1.Evidence = L0_1
                        L23_1 = bm
                        L23_1 = L23_1.trigger_sig
                        L24_1 = "Remediation_AnomalyMultiStage"
                        L25_1 = safeJsonSerialize
                        L26_1 = L22_1
                        L25_1, L26_1 = L25_1(L26_1)
                        L23_1(L24_1, L25_1, L26_1)
                        break
                      end
                      L22_1 = L21_1.Url_Score
                      if 30 <= L22_1 then
                        L22_1 = {}
                        L22_1.Remediation_Reason = "HighScoreUrl"
                        L22_1.Evidence = L0_1
                        L23_1 = bm
                        L23_1 = L23_1.trigger_sig
                        L24_1 = "Remediation_AnomalyMultiStage"
                        L25_1 = safeJsonSerialize
                        L26_1 = L22_1
                        L25_1, L26_1 = L25_1(L26_1)
                        L23_1(L24_1, L25_1, L26_1)
                        break
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
L0_1 = mp
L0_1 = L0_1.INFECTED
return L0_1
