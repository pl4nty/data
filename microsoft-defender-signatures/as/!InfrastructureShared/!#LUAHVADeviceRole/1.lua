local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1
L0_1 = "hvadevicerole"
L1_1 = "hvatracker"
L2_1 = MpCommon
L2_1 = L2_1.AtomicCounterValueNamespaced
L3_1 = L1_1
L4_1 = L0_1
L2_1 = L2_1(L3_1, L4_1)
if L2_1 ~= nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = "hva_counter"
L4_1 = "hva_max_scan"
L5_1 = "ExtendedHvaDeviceProperties"
L6_1 = 604800
L7_1 = 1
L8_1 = MpCommon
L8_1 = L8_1.AtomicCounterValueNamespaced
L9_1 = L3_1
L10_1 = L0_1
L8_1 = L8_1(L9_1, L10_1)
if L8_1 == nil then
  L9_1 = MpCommon
  L9_1 = L9_1.AtomicCounterSetNamespaced
  L10_1 = L3_1
  L11_1 = L0_1
  L12_1 = 0
  L13_1 = L6_1
  L9_1(L10_1, L11_1, L12_1, L13_1)
  L8_1 = 0
end
L9_1 = MpCommon
L9_1 = L9_1.AtomicCounterValueNamespaced
L10_1 = L4_1
L11_1 = L0_1
L9_1 = L9_1(L10_1, L11_1)
if L9_1 == nil then
  L10_1 = MpCommon
  L10_1 = L10_1.AtomicCounterSetNamespaced
  L11_1 = L4_1
  L12_1 = L0_1
  L13_1 = L7_1
  L14_1 = L6_1
  L10_1(L11_1, L12_1, L13_1, L14_1)
  L9_1 = L7_1
end
if L8_1 >= L9_1 then
  if L2_1 == nil then
    L10_1 = pcall
    L11_1 = MpCommon
    L11_1 = L11_1.AtomicCounterSetNamespaced
    L12_1 = L1_1
    L13_1 = L0_1
    L14_1 = 1
    L15_1 = L6_1
    L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
    L10_1(L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1)
  end
  L10_1 = mp
  L10_1 = L10_1.CLEAN
  return L10_1
end
L10_1 = "http://67dda214-3ec7-4d14-aac7-7d3658a8c8ea-001.info"
L11_1 = {}
L11_1[1] = L10_1
L12_1 = {}
L12_1.SIG_CONTEXT = "LUA_GENERIC"
L12_1.CONTENT_SOURCE = "HVA_PAYLOAD_LOOKUP"
L12_1.TAG = "NOLOOKUP"
L13_1 = false
L14_1 = nil
L15_1 = pcall
L16_1 = mp
L16_1 = L16_1.GetUrlReputation
L17_1 = L11_1
L18_1 = L12_1
L15_1, L16_1 = L15_1(L16_1, L17_1, L18_1)
if L15_1 and L16_1 ~= nil then
  L17_1 = L16_1.urls
  if L17_1 ~= nil then
    L17_1 = ipairs
    L18_1 = L16_1.urls
    L17_1, L18_1, L19_1 = L17_1(L18_1)
    for L20_1, L21_1 in L17_1, L18_1, L19_1 do
      L22_1 = L21_1.determination
      if L22_1 == 4 then
        L22_1 = L21_1.urlresponsecontext
        if L22_1 then
          L23_1 = ipairs
          L24_1 = L22_1
          L23_1, L24_1, L25_1 = L23_1(L24_1)
          for L26_1, L27_1 in L23_1, L24_1, L25_1 do
            L28_1 = L27_1.key
            L29_1 = L27_1.value
            if L28_1 == "HvaPayload" then
              L14_1 = L29_1
              if L14_1 ~= nil then
                L13_1 = true
                break
              end
            end
          end
        end
      end
    end
  end
end
L17_1 = MpCommon
L17_1 = L17_1.AtomicCounterAddNamespaced
L18_1 = L3_1
L19_1 = L0_1
L20_1 = 1
L17_1 = L17_1(L18_1, L19_1, L20_1)
if L9_1 <= L17_1 and L2_1 == nil then
  L18_1 = pcall
  L19_1 = MpCommon
  L19_1 = L19_1.AtomicCounterSetNamespaced
  L20_1 = L1_1
  L21_1 = L0_1
  L22_1 = 1
  L23_1 = L6_1
  L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1 = L19_1(L20_1, L21_1, L22_1, L23_1)
  L18_1(L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1)
end
if L13_1 and L14_1 then
  L19_1 = L14_1
  L18_1 = L14_1.gsub
  L20_1 = "^|[^|]*|"
  L21_1 = ""
  L18_1 = L18_1(L19_1, L20_1, L21_1)
  L14_1 = L18_1
  L19_1 = L14_1
  L18_1 = L14_1.gmatch
  L20_1 = "[^|]+"
  L18_1, L19_1, L20_1 = L18_1(L19_1, L20_1)
  for L21_1 in L18_1, L19_1, L20_1 do
    L23_1 = L21_1
    L22_1 = L21_1.match
    L24_1 = "([^=]+)=(.*)"
    L22_1, L23_1 = L22_1(L23_1, L24_1)
    if L22_1 then
      L24_1 = AppendToRollingQueue
      L25_1 = L5_1
      L26_1 = L22_1
      L27_1 = L23_1
      L28_1 = L6_1
      L29_1 = 100
      L24_1(L25_1, L26_1, L27_1, L28_1, L29_1)
    end
  end
  L18_1 = "http://67dda214-3ec7-4d14-aac7-7d3658a8c8ea-001.report"
  L19_1 = {}
  L19_1[1] = L18_1
  L20_1 = {}
  L20_1.SIG_CONTEXT = "LUA_GENERIC"
  L20_1.CONTENT_SOURCE = "HVA_PAYLOAD_REPORT"
  L20_1.HVAREPORT = L14_1
  L20_1.TAG = "NOLOOKUP"
  L21_1 = pcall
  L22_1 = mp
  L22_1 = L22_1.GetUrlReputation
  L23_1 = L19_1
  L24_1 = L20_1
  L21_1(L22_1, L23_1, L24_1)
end
L18_1 = mp
L18_1 = L18_1.CLEAN
return L18_1
