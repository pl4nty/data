local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1
L0_1 = this_sigattrlog
L0_1 = L0_1[1]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = isnull
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.utf8p2
  L0_1 = L0_1(L1_1)
  if not L0_1 then
    L0_1 = safeJsonDeserialize
    L1_1 = this_sigattrlog
    L1_1 = L1_1[1]
    L1_1 = L1_1.utf8p2
    L0_1 = L0_1(L1_1)
    if L0_1 then
      L1_1 = L0_1.context
      if L1_1 then
        L1_1 = tonumber
        L2_1 = L0_1.context
        L2_1 = L2_1.ForTest
        L1_1 = L1_1(L2_1)
        if L1_1 == 1 then
          L1_1 = L0_1.context
          L2_1 = 0
          L3_1 = 1
          L4_1 = 2
          L5_1 = nil
          L6_1 = nil
          L7_1 = pcall
          L8_1 = MpCommon
          L8_1 = L8_1.GetBehavioralNetworkBlocksSettings
          L9_1 = MpCommon
          L9_1 = L9_1.MP_BEHAVIORAL_NETWORK_BLOCK_REMOTE_ENCRYPTION
          L7_1, L8_1 = L7_1(L8_1, L9_1)
          L6_1 = L8_1
          L5_1 = L7_1
          if not L5_1 or not L6_1 then
            L7_1 = {}
            L7_1.State = 0
            L7_1.MaxTimeout = 0
            L7_1.Exclusions = ""
            L7_1.AggressiveLevel = 0
            L6_1 = L7_1
            L0_1.client_error = "Failed to get data from user config, setting default configuration"
          end
          L0_1.UserConfig = L6_1
          L7_1 = L0_1.context
          L7_1.attemptedFWBlock = false
          L7_1 = reportSessionInformationInclusive
          L7_1 = L7_1()
          L0_1.sessionInfo = L7_1
          L7_1 = mp
          L7_1 = L7_1.CLEAN
          L8_1 = tonumber
          L9_1 = L1_1.FWBlock
          L8_1 = L8_1(L9_1)
          L9_1 = nil
          L10_1 = isnull
          L11_1 = L6_1.Exclusions
          L10_1 = L10_1(L11_1)
          if not L10_1 then
            L10_1 = split
            L11_1 = L6_1.Exclusions
            L12_1 = "|"
            L10_1 = L10_1(L11_1, L12_1)
            L11_1 = convert_to_hashtable
            L12_1 = L10_1
            L11_1 = L11_1(L12_1)
            L10_1 = L11_1
          end
          L10_1 = isIPInExclusionList
          L11_1 = L0_1.ip
          L12_1 = L9_1
          L13_1 = true
          L10_1 = L10_1(L11_1, L12_1, L13_1)
          if L10_1 == true then
            L11_1 = "The ip ["
            L12_1 = L0_1.ip
            L13_1 = "] is in excluded list"
            L11_1 = L11_1 .. L12_1 .. L13_1
            L0_1.client_reason = L11_1
            if L8_1 == L3_1 then
              L11_1 = "Remote encryption would have blocked but the ip ["
              L12_1 = L0_1.ip
              L13_1 = "] is in excluded list"
              L11_1 = L11_1 .. L12_1 .. L13_1
              L0_1.client_reason = L11_1
            elseif L8_1 == L4_1 then
              L11_1 = "Remote encryption configuration is in audit mode and the ip ["
              L12_1 = L0_1.ip
              L13_1 = "] is in excluded list, Otheriwse it would have been blocked"
              L11_1 = L11_1 .. L12_1 .. L13_1
              L0_1.client_reason = L11_1
            end
          else
            if L8_1 == L2_1 then
              L0_1.client_reason = "CloudNoBlock"
              L11_1 = versioning
              L11_1 = L11_1.IsSeville
              L11_1 = L11_1()
              if L11_1 then
                L11_1 = tonumber
                L12_1 = L1_1.notifyEDR
                L11_1 = L11_1(L12_1)
                if L11_1 then
                  L11_1 = bm
                  L11_1 = L11_1.set_detection_string
                  L12_1 = safeJsonSerialize
                  L13_1 = L0_1
                  L12_1, L13_1, L14_1, L15_1, L16_1, L17_1 = L12_1(L13_1)
                  L11_1(L12_1, L13_1, L14_1, L15_1, L16_1, L17_1)
                end
              end
            elseif L8_1 == L3_1 then
              L11_1 = L6_1.State
              L12_1 = MpCommon
              L12_1 = L12_1.MP_BEHAVIORAL_NETWORK_BLOCK_ENABLED
              if L11_1 == L12_1 then
                L11_1 = bm
                L11_1 = L11_1.trigger_sig
                L12_1 = "GenericRansomwareRemoteEncryption"
                L13_1 = this_sigattrlog
                L13_1 = L13_1[1]
                L13_1 = L13_1.utf8p2
                L11_1(L12_1, L13_1)
                L11_1 = mp
                L11_1 = L11_1.CLEAN
                return L11_1
              else
                L11_1 = "CloudAsksBlockButUserConfigStateDiffers:"
                L12_1 = tostring
                L13_1 = L6_1.State
                L12_1 = L12_1(L13_1)
                L11_1 = L11_1 .. L12_1
                L0_1.client_reason = L11_1
              end
            elseif L8_1 == L4_1 then
              L11_1 = versioning
              L11_1 = L11_1.IsSeville
              L11_1 = L11_1()
              if L11_1 then
                L11_1 = tonumber
                L12_1 = L1_1.notifyEDR
                L11_1 = L11_1(L12_1)
                if L11_1 then
                  L11_1 = bm
                  L11_1 = L11_1.set_detection_string
                  L12_1 = safeJsonSerialize
                  L13_1 = L0_1
                  L12_1, L13_1, L14_1, L15_1, L16_1, L17_1 = L12_1(L13_1)
                  L11_1(L12_1, L13_1, L14_1, L15_1, L16_1, L17_1)
                end
              end
              L0_1.client_reason = "UserConfigAuditMode"
            end
            L11_1 = mp
            L7_1 = L11_1.INFECTED
          end
          L11_1 = SafeGetUrlReputation
          L12_1 = {}
          L13_1 = L0_1.ip
          L12_1[1] = L13_1
          L13_1 = {}
          L13_1.SIG_CONTEXT = "BM"
          L13_1.CONTEXT_SOURCE = "GenRansomRemoteFWReport"
          L13_1.TAG = "NOLOOKUP"
          L14_1 = safeJsonSerialize
          L15_1 = L0_1
          L14_1 = L14_1(L15_1)
          L13_1.data = L14_1
          L14_1 = false
          L15_1 = 3000
          L16_1 = false
          L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1, L16_1)
          if L11_1 then
            L12_1 = L11_1.error
            if L12_1 == 3 then
              L0_1.CRReportError = "Failed the first attempt"
              L12_1 = SafeGetUrlReputation
              L13_1 = {}
              L14_1 = L0_1.ip
              L13_1[1] = L14_1
              L14_1 = {}
              L14_1.SIG_CONTEXT = "BM"
              L14_1.CONTEXT_SOURCE = "GenRansomRemoteFWReport"
              L14_1.TAG = "NOLOOKUP"
              L15_1 = safeJsonSerialize
              L16_1 = L0_1
              L15_1 = L15_1(L16_1)
              L14_1.data = L15_1
              L15_1 = false
              L16_1 = 3000
              L17_1 = false
              L12_1 = L12_1(L13_1, L14_1, L15_1, L16_1, L17_1)
              L11_1 = L12_1
            end
          end
          L12_1 = mp
          L12_1 = L12_1.INFECTED
          if L7_1 == L12_1 then
            L12_1 = mp
            L12_1 = L12_1.INFECTED
            return L12_1
          end
      end
    end
    else
      L0_1.ppID = nil
      L0_1.imagePath = nil
      L1_1 = reportSessionInformationInclusive
      L1_1 = L1_1()
      L0_1.sessionInfo = L1_1
      L1_1 = versioning
      L1_1 = L1_1.IsSeville
      L1_1 = L1_1()
      if L1_1 then
        L1_1 = bm
        L1_1 = L1_1.set_detection_string
        L2_1 = safeJsonSerialize
        L3_1 = L0_1
        L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1 = L2_1(L3_1)
        L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1)
      end
      L1_1 = mp
      L1_1 = L1_1.INFECTED
      return L1_1
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
