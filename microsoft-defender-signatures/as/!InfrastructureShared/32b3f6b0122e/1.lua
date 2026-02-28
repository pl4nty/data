local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = "1bb146aa"
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = isnull
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.utf8p2
  L1_1 = L1_1(L2_1)
  if not L1_1 then
    L1_1 = safeJsonDeserialize
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L2_1 = L2_1.utf8p2
    L1_1 = L1_1(L2_1)
    L2_1 = "app_ext_"
    L3_1 = L1_1.Extension
    L2_1 = L2_1 .. L3_1
    L3_1 = MpCommon
    L3_1 = L3_1.AtomicCounterValueExNamespaced
    L4_1 = L2_1
    L5_1 = L0_1
    L3_1 = L3_1(L4_1, L5_1)
    if L3_1 ~= nil then
      L4_1 = L3_1.count
      L1_1.ACDelayedFilesEncrypted = L4_1
      L4_1 = L3_1.insert_time
      L1_1.ACDelayedCreationTime = L4_1
      L4_1 = L3_1.expire_time
      L1_1.ACDelayedExpirationTime = L4_1
      L4_1 = L3_1.update_time
      L1_1.ACDelayedRecentTime = L4_1
      L4_1 = MpCommon
      L4_1 = L4_1.AtomicCounterValueNamespaced
      L5_1 = "rcount_sig_count"
      L6_1 = L0_1
      L4_1 = L4_1(L5_1, L6_1)
      if L4_1 ~= nil then
        L1_1.SigCounter = L4_1
      else
        L1_1.SigCounter = 0
      end
      L5_1 = safeJsonSerialize
      L6_1 = L1_1
      L5_1 = L5_1(L6_1)
      L6_1 = SafeGetUrlReputation
      L7_1 = {}
      L8_1 = L1_1.ip
      L7_1[1] = L8_1
      L8_1 = {}
      L8_1.SIG_CONTEXT = "BM"
      L8_1.CONTEXT_SOURCE = "GenRansomData3"
      L8_1.TAG = "NOLOOKUP"
      L8_1.data = L5_1
      L9_1 = false
      L10_1 = 3000
      L11_1 = false
      L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1, L11_1)
      if L6_1 then
        L7_1 = L6_1.error
        if L7_1 == 3 then
          L1_1.CRReportError = "Failed the first attempt"
          L7_1 = SafeGetUrlReputation
          L8_1 = {}
          L9_1 = L1_1.ip
          L8_1[1] = L9_1
          L9_1 = {}
          L9_1.SIG_CONTEXT = "BM"
          L9_1.CONTEXT_SOURCE = "GenRansomData3"
          L9_1.TAG = "NOLOOKUP"
          L9_1.data = L5_1
          L10_1 = false
          L11_1 = 3000
          L12_1 = false
          L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1, L12_1)
          L6_1 = L7_1
        end
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
