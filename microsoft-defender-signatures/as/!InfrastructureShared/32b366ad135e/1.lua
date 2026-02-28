local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1

function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = ""
  L3_2 = A1_2.context
  L3_2 = L3_2.attemptedFWBlock
  if L3_2 == true then
    L3_2 = A1_2.context
    L3_2 = L3_2.WFBlockSucceeded
    if L3_2 == true then
      L3_2 = "The ip["
      L4_2 = A1_2.ip
      L5_2 = "] is blocked by firewall rule, Based on the user's Remote Encryption config and aggressiveness level."
      L2_2 = L3_2 .. L4_2 .. L5_2
  end
  else
    L3_2 = A1_2.context
    L3_2 = L3_2.attemptedFWBlock
    if L3_2 == true then
      L3_2 = A1_2.context
      L3_2 = L3_2.WFBlockSucceeded
      if L3_2 == false then
        L3_2 = A0_2.State
        L4_2 = MpCommon
        L4_2 = L4_2.MP_BEHAVIORAL_NETWORK_BLOCK_ENABLED
        if L3_2 == L4_2 then
          L3_2 = "The ip["
          L4_2 = A1_2.ip
          L5_2 = "] is should be blocked but failed to add firewall rule!"
          L2_2 = L3_2 .. L4_2 .. L5_2
      end
    end
    else
      L3_2 = A1_2.context
      L3_2 = L3_2.attemptedFWBlock
      if L3_2 == true then
        L3_2 = A0_2.State
        L4_2 = MpCommon
        L4_2 = L4_2.MP_BEHAVIORAL_NETWORK_BLOCK_AUDIT
        if L3_2 == L4_2 then
          L3_2 = "The ip["
          L4_2 = A1_2.ip
          L5_2 = "] should get blocked, skipped due to audit mode"
          L2_2 = L3_2 .. L4_2 .. L5_2
        end
      end
    end
  end
  return L2_2
end

L1_1 = 0
L2_1 = 1
L3_1 = 2
L4_1 = 1
L5_1 = 2
L6_1 = 900
L7_1 = this_sigattrlog
L7_1 = L7_1[1]
L7_1 = L7_1.matched
if L7_1 then
  L7_1 = this_sigattrlog
  L7_1 = L7_1[1]
  L7_1 = L7_1.utf8p2
  if L7_1 then
    L7_1 = mp
    L7_1 = L7_1.CLEAN
    L8_1 = safeJsonDeserialize
    L9_1 = this_sigattrlog
    L9_1 = L9_1[1]
    L9_1 = L9_1.utf8p2
    L8_1 = L8_1(L9_1)
    L9_1 = isnull
    L10_1 = L8_1
    L9_1 = L9_1(L10_1)
    if not L9_1 then
      L9_1 = L8_1.ip
      if L9_1 then
        L9_1 = L8_1.confidence
        if L9_1 then
          L9_1 = L8_1.determination
          if L9_1 ~= L3_1 then
            L9_1 = L8_1.determination
            if L9_1 ~= L2_1 then
              goto lbl_193
            end
          end
          L9_1 = L8_1.context
          L9_1.attemptedFWBlock = false
          L9_1 = reportSessionInformationInclusive
          L9_1 = L9_1()
          L8_1.sessionInfo = L9_1
          L9_1 = L8_1.context
          if L9_1 then
            L10_1 = tonumber
            L11_1 = L9_1.ForTest
            L10_1 = L10_1(L11_1)
            if L10_1 == 1 then
              L10_1 = 1
              L11_1 = tonumber
              L12_1 = L9_1.FWBlock
              L11_1 = L11_1(L12_1)
              if L11_1 == L10_1 then
                L11_1 = tonumber
                L12_1 = L8_1.action
                L12_1 = L12_1.parameter
                L11_1 = L11_1(L12_1)
                L12_1 = pcall
                L13_1 = bm
                L13_1 = L13_1.add_blocking_firewall_rule
                L14_1 = L8_1.ip
                L15_1 = L8_1.action
                L15_1 = L15_1.ttl
                if not L15_1 then
                  L15_1 = L6_1
                end
                L16_1 = mp
                L16_1 = L16_1.bitand
                L17_1 = L11_1
                L18_1 = L4_1
                L16_1 = L16_1(L17_1, L18_1)
                L16_1 = L16_1 == L4_1
                L17_1 = mp
                L17_1 = L17_1.bitand
                L18_1 = L11_1
                L19_1 = L5_1
                L17_1 = L17_1(L18_1, L19_1)
                L17_1 = L17_1 == L5_1
                L18_1 = MpCommon
                L18_1 = L18_1.MP_BEHAVIORAL_NETWORK_BLOCK_REMOTE_ENCRYPTION
                L19_1 = true
                L20_1 = false
                L21_1 = "445"
                L12_1, L13_1 = L12_1(L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1)
                L14_1 = pcall
                L15_1 = bm
                L15_1 = L15_1.add_blocking_firewall_rule
                L16_1 = L8_1.ip
                L17_1 = L8_1.action
                L17_1 = L17_1.ttl
                if not L17_1 then
                  L17_1 = L6_1
                end
                L18_1 = mp
                L18_1 = L18_1.bitand
                L19_1 = L11_1
                L20_1 = L4_1
                L18_1 = L18_1(L19_1, L20_1)
                L18_1 = L18_1 == L4_1
                L19_1 = mp
                L19_1 = L19_1.bitand
                L20_1 = L11_1
                L21_1 = L5_1
                L19_1 = L19_1(L20_1, L21_1)
                L19_1 = L19_1 == L5_1
                L20_1 = MpCommon
                L20_1 = L20_1.MP_BEHAVIORAL_NETWORK_BLOCK_REMOTE_ENCRYPTION
                L21_1 = true
                L22_1 = false
                L23_1 = "139"
                L14_1, L15_1 = L14_1(L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1)
                L16_1 = L8_1.context
                L16_1.attemptedFWBlock = true
                L16_1 = L8_1.context
                L16_1.WFBlockSucceeded = L12_1
                L16_1 = L8_1.context
                L17_1 = tostring
                L18_1 = L13_1
                L17_1 = L17_1(L18_1)
                L16_1.firewallBlockerror = L17_1
                L16_1 = L8_1.context
                L16_1.WFBlockSucceeded2 = L14_1
                L16_1 = L8_1.context
                L17_1 = tostring
                L18_1 = L15_1
                L17_1 = L17_1(L18_1)
                L16_1.firewallBlockerror2 = L17_1
                L16_1 = L8_1.context
                L17_1 = L0_1
                L18_1 = L8_1.UserConfig
                L19_1 = L8_1
                L17_1 = L17_1(L18_1, L19_1)
                L16_1.EDRMsg = L17_1
                L16_1 = versioning
                L16_1 = L16_1.IsSeville
                L16_1 = L16_1()
                if L16_1 then
                  L16_1 = tonumber
                  L17_1 = L9_1.notifyEDR
                  L16_1 = L16_1(L17_1)
                  if not L16_1 then
                    L16_1 = tonumber
                    L17_1 = L9_1.alertEDR
                    L16_1 = L16_1(L17_1)
                    if not L16_1 then
                      goto lbl_174
                    end
                  end
                  L16_1 = bm
                  L16_1 = L16_1.set_detection_string
                  L17_1 = safeJsonSerialize
                  L18_1 = L8_1
                  L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1 = L17_1(L18_1)
                  L16_1(L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1)
                end
                ::lbl_174::
                L16_1 = mp
                L7_1 = L16_1.INFECTED
              else
                L8_1.client_reason = "CloudActionNoBlockNotset"
              end
          end
          else
            L10_1 = isnull
            L11_1 = L9_1
            L10_1 = L10_1(L11_1)
            if L10_1 then
              L8_1.reason = "Error: context not found"
            else
              L10_1 = tonumber
              L11_1 = L9_1.ForTest
              L10_1 = L10_1(L11_1)
              if L10_1 == 0 then
                L8_1.reason = "Test is not enabled from cloud"
              end
            end
          end
      end
    end
    else
      ::lbl_193::
      L9_1 = {}
      L10_1 = isnull
      L11_1 = L8_1
      L10_1 = L10_1(L11_1)
      if L10_1 then
        L9_1.error = "Error: Remote Data is empty"
        L9_1.ip = "0.0.0.0"
        L10_1 = this_sigattrlog
        L10_1 = L10_1[1]
        L10_1 = L10_1.utf8p2
        L9_1.p2 = L10_1
        L8_1 = L9_1
      else
        L10_1 = L8_1.determination
        if L10_1 == L1_1 then
          L8_1.reason = "CleanDetermination"
        end
      end
      L10_1 = mp
      L7_1 = L10_1.CLEAN
    end
    L9_1 = SafeGetUrlReputation
    L10_1 = {}
    L11_1 = L8_1.ip
    L10_1[1] = L11_1
    L11_1 = {}
    L11_1.SIG_CONTEXT = "BM"
    L11_1.CONTEXT_SOURCE = "GenRansomRemoteFWReport"
    L11_1.TAG = "NOLOOKUP"
    L12_1 = safeJsonSerialize
    L13_1 = L8_1
    L12_1 = L12_1(L13_1)
    L11_1.data = L12_1
    L12_1 = false
    L13_1 = 3000
    L14_1 = false
    L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1, L14_1)
    if L9_1 then
      L10_1 = L9_1.error
      if L10_1 == 3 then
        L8_1.CRReportError = "Failed the first attempt"
        L10_1 = SafeGetUrlReputation
        L11_1 = {}
        L12_1 = L8_1.ip
        L11_1[1] = L12_1
        L12_1 = {}
        L12_1.SIG_CONTEXT = "BM"
        L12_1.CONTEXT_SOURCE = "GenRansomRemoteFWReport"
        L12_1.TAG = "NOLOOKUP"
        L13_1 = safeJsonSerialize
        L14_1 = L8_1
        L13_1 = L13_1(L14_1)
        L12_1.data = L13_1
        L13_1 = false
        L14_1 = 3000
        L15_1 = false
        L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1, L15_1)
        L9_1 = L10_1
      end
    end
    L10_1 = mp
    L10_1 = L10_1.INFECTED
    if L7_1 == L10_1 then
      L10_1 = mp
      L10_1 = L10_1.INFECTED
      return L10_1
    end
  end
end
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
