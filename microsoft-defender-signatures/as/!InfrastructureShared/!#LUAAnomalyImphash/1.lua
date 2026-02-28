local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1
L0_1 = mp
L0_1 = L0_1.enum_mpattributesubstring
L1_1 = "MpInternal_imphash="
L0_1 = L0_1(L1_1)
if L0_1 ~= nil then
  L1_1 = #L0_1
  if 0 < L1_1 then
    L1_1 = ipairs
    L2_1 = L0_1
    L1_1, L2_1, L3_1 = L1_1(L2_1)
    for L4_1, L5_1 in L1_1, L2_1, L3_1 do
      L6_1 = string
      L6_1 = L6_1.match
      L7_1 = L5_1
      L8_1 = "MpInternal_imphash=(%w+)$"
      L6_1 = L6_1(L7_1, L8_1)
      if L6_1 == nil then
        L7_1 = mp
        L7_1 = L7_1.CLEAN
        return L7_1
      end
      L7_1 = MpCommon
      L7_1 = L7_1.AnomalyEventLookup
      L8_1 = "ImphashTableNewBloom"
      L9_1 = "ImphashTableMarker"
      L10_1 = 100
      L7_1 = L7_1(L8_1, L9_1, L10_1)
      if L7_1 == nil then
        L8_1 = MpCommon
        L8_1 = L8_1.AnomalyEventUpdate
        L9_1 = "ImphashTableNewBloom"
        L10_1 = "ImphashTableMarker"
        L11_1 = 1
        L12_1 = 1
        L8_1(L9_1, L10_1, L11_1, L12_1)
        L8_1 = mp
        L8_1 = L8_1.CLEAN
        return L8_1
      end
      L8_1 = MpCommon
      L8_1 = L8_1.AnomalyEventLookup
      L9_1 = "ImphashTableNewBloom"
      L10_1 = L6_1
      L11_1 = 1
      L8_1 = L8_1(L9_1, L10_1, L11_1)
      if L8_1 == nil then
        L9_1 = MpCommon
        L9_1 = L9_1.AnomalyEventUpdate
        L10_1 = "ImphashTableNewBloom"
        L11_1 = L6_1
        L12_1 = 1
        L13_1 = 1
        L9_1(L10_1, L11_1, L12_1, L13_1)
        L9_1 = MpCommon
        L9_1 = L9_1.Sha1SearchBloomFilter
        L10_1 = 98
        L11_1 = L6_1
        L12_1 = "00000000"
        L11_1 = L11_1 .. L12_1
        L9_1, L10_1 = L9_1(L10_1, L11_1)
        if L9_1 == true and L10_1 == "!#ImpHashCommonGlobal" then
          L11_1 = mp
          L11_1 = L11_1.CLEAN
          return L11_1
        end
        L11_1 = L7_1.UnbiasedTime
        if 7200 < L11_1 then
          L11_1 = mp
          L11_1 = L11_1.set_mpattribute
          L12_1 = "Lua:AnomalyImphashNewBloom"
          L11_1(L12_1)
          L11_1 = mp
          L11_1 = L11_1.INFECTED
          return L11_1
        end
      else
        L9_1 = MpCommon
        L9_1 = L9_1.AnomalyEventUpdate
        L10_1 = "ImphashTableNewBloom"
        L11_1 = L6_1
        L12_1 = L8_1.Count
        L12_1 = L12_1 + 1
        L13_1 = 1
        L9_1(L10_1, L11_1, L12_1, L13_1)
        L9_1 = MpCommon
        L9_1 = L9_1.Sha1SearchBloomFilter
        L10_1 = 98
        L11_1 = L6_1
        L12_1 = "00000000"
        L11_1 = L11_1 .. L12_1
        L9_1, L10_1 = L9_1(L10_1, L11_1)
        if L9_1 == true and L10_1 == "!#ImpHashCommonGlobal" then
          L11_1 = mp
          L11_1 = L11_1.CLEAN
          return L11_1
        end
        L11_1 = L8_1.Count
        if L11_1 == 1 then
          L11_1 = mp
          L11_1 = L11_1.set_mpattribute
          L12_1 = "Lua:AnomalyImphashObsMal"
          L11_1(L12_1)
          L11_1 = mp
          L11_1 = L11_1.INFECTED
          return L11_1
        end
        L11_1 = L8_1.Count
        if L11_1 < 3 then
          L11_1 = L8_1.UnbiasedTime
          if 20160 < L11_1 then
            L11_1 = mp
            L11_1 = L11_1.set_mpattribute
            L12_1 = "Lua:AnomalyImphashNotFreqBloom"
            L11_1(L12_1)
            L11_1 = mp
            L11_1 = L11_1.INFECTED
            return L11_1
          end
        end
        L11_1 = L8_1.UnbiasedTime
        if 43200 <= L11_1 then
          L11_1 = MpCommon
          L11_1 = L11_1.AnomalyEventUpdate
          L12_1 = "ImphashTableNewBloom"
          L13_1 = L6_1
          L14_1 = 1
          L15_1 = 1
          L11_1(L12_1, L13_1, L14_1, L15_1)
          L11_1 = mp
          L11_1 = L11_1.INFECTED
          return L11_1
        end
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
