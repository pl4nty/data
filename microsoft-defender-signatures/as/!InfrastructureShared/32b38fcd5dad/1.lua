local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.utf8p2
  if L1_1 then
    L1_1 = safeJsonDeserialize
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L2_1 = L2_1.utf8p2
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1
  end
end
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = UrlGrader
L2_1 = L0_1.Url
L3_1 = "FAppAnomalousOutbound.A"
L4_1 = false
L1_1 = L1_1(L2_1, L3_1, L4_1)
if L1_1 == 0 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = nil
L3_1 = L0_1.AttributeValue
L4_1 = safeJsonDeserialize
L5_1 = L3_1
L4_1 = L4_1(L5_1)
if L4_1 then
  L2_1 = L4_1.AppName
else
  L6_1 = L3_1
  L5_1 = L3_1.match
  L7_1 = "[^|]+"
  L5_1 = L5_1(L6_1, L7_1)
  L2_1 = L5_1
end
if not L2_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = {}
L6_1 = "Appomaly_Network_HOST"
L7_1 = "Appomaly_Network_UserAgent"
L5_1[1] = L6_1
L5_1[2] = L7_1
L6_1 = MpCommon
L6_1 = L6_1.IsSampled
L7_1 = 100000
L8_1 = true
L9_1 = true
L10_1 = true
L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
if L6_1 then
  L6_1 = ipairs
  L7_1 = L5_1
  L6_1, L7_1, L8_1 = L6_1(L7_1)
  for L9_1, L10_1 in L6_1, L7_1, L8_1 do
    L11_1 = {}
    L11_1.SignatureName = "Behavior:Win32/PFAppAnomalousOutbound.A"
    L12_1 = L0_1.Url
    L11_1.Url = L12_1
    L11_1.AnomalyTableName = L10_1
    L12_1 = nil
    L13_1 = nil
    L14_1 = bm
    L14_1 = L14_1.get_current_process_startup_info
    L14_1 = L14_1()
    if L10_1 == "Appomaly_Network_HOST" then
      L15_1 = L2_1
      L16_1 = "_"
      L17_1 = L0_1.HostName
      L12_1 = L15_1 .. L16_1 .. L17_1
      L15_1 = L10_1
      L16_1 = "["
      L17_1 = L14_1.ppid
      L18_1 = L17_1
      L17_1 = L17_1.match
      L19_1 = "pid:(%d+)"
      L17_1 = L17_1(L18_1, L19_1)
      L18_1 = "]["
      L19_1 = L0_1.HostName
      L20_1 = "]"
      L13_1 = L15_1 .. L16_1 .. L17_1 .. L18_1 .. L19_1 .. L20_1
    elseif L10_1 == "Appomaly_Network_UserAgent" then
      L15_1 = L0_1.UserAgent
      if L15_1 ~= "" then
        L15_1 = L2_1
        L16_1 = "_"
        L17_1 = L0_1.UserAgent
        L12_1 = L15_1 .. L16_1 .. L17_1
        L15_1 = L10_1
        L16_1 = "["
        L17_1 = L14_1.ppid
        L18_1 = L17_1
        L17_1 = L17_1.match
        L19_1 = "pid:(%d+)"
        L17_1 = L17_1(L18_1, L19_1)
        L18_1 = "]["
        L19_1 = L0_1.UserAgent
        L20_1 = "]"
        L13_1 = L15_1 .. L16_1 .. L17_1 .. L18_1 .. L19_1 .. L20_1
      end
    end
    if L12_1 then
      L15_1 = AnomalyTableCheck
      L16_1 = L10_1
      L17_1 = L12_1
      L18_1 = 30
      L19_1 = "MarkerRecord_"
      L20_1 = L2_1
      L19_1 = L19_1 .. L20_1
      L15_1, L16_1, L17_1 = L15_1(L16_1, L17_1, L18_1, L19_1)
      if L15_1 and not L16_1 then
        L11_1.AnomalyTableInfo = L17_1
        L18_1 = bm
        L18_1 = L18_1.add_related_string
        L19_1 = "AdditionalInfo"
        L20_1 = safeJsonSerialize
        L21_1 = L11_1
        L20_1 = L20_1(L21_1)
        L21_1 = bm
        L21_1 = L21_1.RelatedStringBMReport
        L18_1(L19_1, L20_1, L21_1)
        L18_1 = bm
        L18_1 = L18_1.trigger_sig
        L19_1 = L10_1
        L20_1 = safeJsonSerialize
        L21_1 = L11_1
        L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1 = L20_1(L21_1)
        L18_1(L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1)
        if L14_1 then
          L18_1 = L0_1.AttributeName
          if L18_1 then
            L18_1 = UrlGrader
            L19_1 = L0_1.Url
            L20_1 = "BM_PFAppAnomalousOutbound.A"
            L18_1, L19_1 = L18_1(L19_1, L20_1)
            if L18_1 == 0 and L19_1 then
              L20_1 = L19_1.URL_CLEAN
              if L20_1 then
                L20_1 = mp
                L20_1 = L20_1.CLEAN
                return L20_1
              end
            end
            L11_1.Url_ScoringInfo = L19_1
            L20_1 = IncreaseProcessAnomalyScore
            L21_1 = L14_1.ppid
            L22_1 = 10 + L18_1
            L23_1 = L13_1
            L24_1 = L0_1.AttributeName
            L25_1 = L11_1
            L20_1(L21_1, L22_1, L23_1, L24_1, L25_1)
          end
        end
      end
    end
  end
else
  L6_1 = MpCommon
  L6_1 = L6_1.GetCurrentTimeT
  L6_1 = L6_1()
  L7_1 = ipairs
  L8_1 = L5_1
  L7_1, L8_1, L9_1 = L7_1(L8_1)
  for L10_1, L11_1 in L7_1, L8_1, L9_1 do
    L12_1 = {}
    L12_1.SignatureName = "Behavior:Win32/PFAppAnomalousOutbound.A"
    L13_1 = L0_1.Url
    L12_1.Url = L13_1
    L12_1.AnomalyTableName = L11_1
    L13_1 = GetAnomalyTableAge
    L14_1 = L11_1
    L13_1 = L13_1(L14_1)
    L12_1.TableAge = L13_1
    L13_1 = MpCommon
    L13_1 = L13_1.AnomalyEventLookup
    L14_1 = L11_1
    L15_1 = "MarkerRecord_"
    L16_1 = L2_1
    L15_1 = L15_1 .. L16_1
    L16_1 = 1
    L13_1 = L13_1(L14_1, L15_1, L16_1)
    L14_1 = L6_1
    if L13_1 then
      L15_1 = L13_1.Count
      if L15_1 then
        L15_1 = L13_1.Count
        if L15_1 ~= -1 then
          L14_1 = L13_1.Count
      end
      else
        L15_1 = {}
        L15_1.SignatureName = "PFAppAnomalousOutbound.A"
        L15_1.Error = "Record has been added with value -1."
        L15_1.AnomalyTableName = L11_1
        L16_1 = "MarkerRecord_"
        L17_1 = L2_1
        L16_1 = L16_1 .. L17_1
        L15_1.Key = L16_1
        L16_1 = bm
        L16_1 = L16_1.trigger_sig
        L17_1 = "AnomalyTable_Error"
        L18_1 = safeJsonSerialize
        L19_1 = L15_1
        L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1 = L18_1(L19_1)
        L16_1(L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1)
        L16_1 = pcall
        L17_1 = MpCommon
        L17_1 = L17_1.AnomalyEventUpdate
        L18_1 = L11_1
        L19_1 = "MarkerRecord_"
        L20_1 = L2_1
        L19_1 = L19_1 .. L20_1
        L20_1 = L6_1
        L21_1 = 1
        L16_1(L17_1, L18_1, L19_1, L20_1, L21_1)
      end
    else
      L15_1 = pcall
      L16_1 = MpCommon
      L16_1 = L16_1.AnomalyEventUpdate
      L17_1 = L11_1
      L18_1 = "MarkerRecord_"
      L19_1 = L2_1
      L18_1 = L18_1 .. L19_1
      L19_1 = L6_1
      L20_1 = 1
      L15_1, L16_1 = L15_1(L16_1, L17_1, L18_1, L19_1, L20_1)
      if L15_1 then
        L12_1.AnomalyTableName = L11_1
        L17_1 = bm
        L17_1 = L17_1.trigger_sig
        L18_1 = "AnomalyTableMarker_Rcr"
        L19_1 = safeJsonSerialize
        L20_1 = L12_1
        L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1 = L19_1(L20_1)
        L17_1(L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1)
      else
        L17_1 = tostring
        L18_1 = L16_1
        L17_1 = L17_1(L18_1)
        L18_1 = "Failed to set the marker record for the first time"
        L17_1 = L17_1 .. L18_1
        L12_1.Error = L17_1
        L17_1 = bm
        L17_1 = L17_1.trigger_sig
        L18_1 = "AnomalyTable_Error"
        L19_1 = safeJsonSerialize
        L20_1 = L12_1
        L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1 = L19_1(L20_1)
        L17_1(L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1)
      end
    end
    L15_1 = nil
    L16_1 = nil
    L17_1 = bm
    L17_1 = L17_1.get_current_process_startup_info
    L17_1 = L17_1()
    if L11_1 == "Appomaly_Network_HOST" then
      L18_1 = L2_1
      L19_1 = "_"
      L20_1 = L0_1.HostName
      L15_1 = L18_1 .. L19_1 .. L20_1
      L18_1 = L11_1
      L19_1 = "["
      L20_1 = L17_1.ppid
      L21_1 = L20_1
      L20_1 = L20_1.match
      L22_1 = "pid:(%d+)"
      L20_1 = L20_1(L21_1, L22_1)
      L21_1 = "]["
      L22_1 = L0_1.HostName
      L23_1 = "]"
      L16_1 = L18_1 .. L19_1 .. L20_1 .. L21_1 .. L22_1 .. L23_1
    elseif L11_1 == "Appomaly_Network_UserAgent" then
      L18_1 = L0_1.UserAgent
      if L18_1 ~= "" then
        L18_1 = L2_1
        L19_1 = "_"
        L20_1 = L0_1.UserAgent
        L15_1 = L18_1 .. L19_1 .. L20_1
        L18_1 = L11_1
        L19_1 = "["
        L20_1 = L17_1.ppid
        L21_1 = L20_1
        L20_1 = L20_1.match
        L22_1 = "pid:(%d+)"
        L20_1 = L20_1(L21_1, L22_1)
        L21_1 = "]["
        L22_1 = L0_1.UserAgent
        L23_1 = "]"
        L16_1 = L18_1 .. L19_1 .. L20_1 .. L21_1 .. L22_1 .. L23_1
      end
    end
    if L15_1 then
      L18_1 = nil
      L19_1 = nil
      L20_1 = MpCommon
      L20_1 = L20_1.AnomalyEventLookup
      L21_1 = L11_1
      L22_1 = L15_1
      L23_1 = 1
      L20_1 = L20_1(L21_1, L22_1, L23_1)
      if not L20_1 then
        L21_1 = L6_1 - L14_1
        L21_1 = L21_1 / 60
        L22_1 = L21_1 / 1440
        if 30 < L22_1 then
          L12_1.Days_elapsed = L22_1
          L23_1 = bm
          L23_1 = L23_1.add_related_string
          L24_1 = "AdditionalInfo"
          L25_1 = safeJsonSerialize
          L26_1 = L12_1
          L25_1 = L25_1(L26_1)
          L26_1 = bm
          L26_1 = L26_1.RelatedStringBMReport
          L23_1(L24_1, L25_1, L26_1)
          L23_1 = bm
          L23_1 = L23_1.trigger_sig
          L24_1 = L11_1
          L25_1 = safeJsonSerialize
          L26_1 = L12_1
          L25_1, L26_1, L27_1, L28_1, L29_1, L30_1 = L25_1(L26_1)
          L23_1(L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1)
          if L17_1 then
            L23_1 = L0_1.AttributeName
            if L23_1 then
              L23_1 = UrlGrader
              L24_1 = L0_1.Url
              L25_1 = "BM_PFAppAnomalousOutbound.A"
              L23_1, L24_1 = L23_1(L24_1, L25_1)
              if L23_1 == 0 and L24_1 then
                L25_1 = L24_1.URL_CLEAN
                if L25_1 then
                  L25_1 = mp
                  L25_1 = L25_1.CLEAN
                  return L25_1
                end
              end
              L12_1.Url_ScoringInfo = L24_1
              L25_1 = IncreaseProcessAnomalyScore
              L26_1 = L17_1.ppid
              L27_1 = 10 + L23_1
              L28_1 = L16_1
              L29_1 = L0_1.AttributeName
              L30_1 = L12_1
              L25_1(L26_1, L27_1, L28_1, L29_1, L30_1)
            end
          end
        else
          L23_1 = pcall
          L24_1 = MpCommon
          L24_1 = L24_1.AnomalyEventUpdate
          L25_1 = L11_1
          L26_1 = L15_1
          L27_1 = 1
          L28_1 = 1
          L23_1, L24_1 = L23_1(L24_1, L25_1, L26_1, L27_1, L28_1)
          L19_1 = L24_1
          L18_1 = L23_1
          L23_1 = tostring
          L24_1 = L19_1
          L23_1 = L23_1(L24_1)
          L24_1 = ";Failed to add the key"
          L23_1 = L23_1 .. L24_1
          L12_1.Error = L23_1
        end
      else
        L21_1 = L20_1.Count
        L21_1 = L21_1 + 1
        L22_1 = pcall
        L23_1 = MpCommon
        L23_1 = L23_1.AnomalyEventUpdate
        L24_1 = L11_1
        L25_1 = L15_1
        L26_1 = L21_1
        L27_1 = 1
        L22_1, L23_1 = L22_1(L23_1, L24_1, L25_1, L26_1, L27_1)
        L19_1 = L23_1
        L18_1 = L22_1
        L22_1 = tostring
        L23_1 = L19_1
        L22_1 = L22_1(L23_1)
        L23_1 = ";Failed to update the key"
        L22_1 = L22_1 .. L23_1
        L12_1.Error = L22_1
      end
      if not L18_1 then
        L21_1 = bm
        L21_1 = L21_1.trigger_sig
        L22_1 = "AnomalyTable_Error"
        L23_1 = safeJsonSerialize
        L24_1 = L12_1
        L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1 = L23_1(L24_1)
        L21_1(L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1)
      end
    end
  end
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
