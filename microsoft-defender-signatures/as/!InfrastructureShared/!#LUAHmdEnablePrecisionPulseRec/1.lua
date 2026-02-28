local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1
L0_1 = MpCommon
L0_1 = L0_1.NidSearch
L1_1 = mp
L1_1 = L1_1.NID_ENABLE_EXTENDED_BAFS
L2_1 = 7
L0_1 = L0_1(L1_1, L2_1)
if L0_1 then
  L0_1 = "hmdprecisionpulse"
  L1_1 = "scan_counter"
  L2_1 = "max_scan"
  L3_1 = "run_tracker"
  L4_1 = 60
  L5_1 = 500
  L6_1 = MpCommon
  L6_1 = L6_1.AtomicCounterValueNamespaced
  L7_1 = L3_1
  L8_1 = L0_1
  L6_1 = L6_1(L7_1, L8_1)
  if L6_1 ~= nil then
    L7_1 = mp
    L7_1 = L7_1.CLEAN
    return L7_1
  end
  L7_1 = MpCommon
  L7_1 = L7_1.AtomicCounterValueNamespaced
  L8_1 = L1_1
  L9_1 = L0_1
  L7_1 = L7_1(L8_1, L9_1)
  if L7_1 == nil then
    L8_1 = MpCommon
    L8_1 = L8_1.AtomicCounterSetNamespaced
    L9_1 = L1_1
    L10_1 = L0_1
    L11_1 = 0
    L12_1 = L4_1
    L8_1(L9_1, L10_1, L11_1, L12_1)
  end
  L8_1 = MpCommon
  L8_1 = L8_1.AtomicCounterValueNamespaced
  L9_1 = L2_1
  L10_1 = L0_1
  L8_1 = L8_1(L9_1, L10_1)
  if L8_1 == nil then
    L9_1 = MpCommon
    L9_1 = L9_1.AtomicCounterSetNamespaced
    L10_1 = L2_1
    L11_1 = L0_1
    L12_1 = L5_1
    L13_1 = L4_1
    L9_1(L10_1, L11_1, L12_1, L13_1)
  end
  if L6_1 == nil then
    L9_1 = pcall
    L10_1 = MpCommon
    L10_1 = L10_1.AtomicCounterSetNamespaced
    L11_1 = L3_1
    L12_1 = L0_1
    L13_1 = 1
    L14_1 = L4_1
    L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
    L9_1(L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1)
  end
  L9_1 = "http://962b56e5-5eb2-4ed3-8757-3f22f190d202.info"
  L10_1 = {}
  L10_1[1] = L9_1
  L11_1 = {}
  L11_1.SIG_CONTEXT = "LUA_GENERIC"
  L11_1.CONTENT_SOURCE = "HEIMDALL_PRECISION_PULSE"
  L11_1.TAG = "NOLOOKUP"
  L12_1 = pcall
  L13_1 = mp
  L13_1 = L13_1.GetUrlReputation
  L14_1 = L10_1
  L15_1 = L11_1
  L12_1, L13_1 = L12_1(L13_1, L14_1, L15_1)
  if L12_1 and L13_1 then
    L14_1 = L13_1.urls
    if L14_1 then
      goto lbl_87
    end
  end
  L14_1 = mp
  L14_1 = L14_1.CLEAN
  do return L14_1 end
  ::lbl_87::
  L14_1 = ipairs
  L15_1 = L13_1.urls
  L14_1, L15_1, L16_1 = L14_1(L15_1)
  for L17_1, L18_1 in L14_1, L15_1, L16_1 do
    L19_1 = L18_1.determination
    if L19_1 == 4 then
      L19_1 = L18_1.urlresponsecontext
      L20_1 = ""
      if L19_1 then
        L21_1 = ipairs
        L22_1 = L19_1
        L21_1, L22_1, L23_1 = L21_1(L22_1)
        for L24_1, L25_1 in L21_1, L22_1, L23_1 do
          L26_1 = L25_1.key
          L27_1 = L25_1.value
          if L26_1 == "Payload" then
            L20_1 = L27_1
            L28_1 = EnablePrecisionPulse
            L29_1 = L20_1
            L30_1 = "HmdEnablePrecisionPulseRecurring"
            L31_1 = L0_1
            L32_1 = L1_1
            L33_1 = L2_1
            L28_1(L29_1, L30_1, L31_1, L32_1, L33_1)
            break
          end
        end
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
