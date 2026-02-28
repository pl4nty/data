local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1
L0_1 = mp
L0_1 = L0_1.enum_mpattributesubstring
L1_1 = "MpInternal_researchdata=TENCODE7="
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
      L8_1 = "MpInternal_researchdata=TENCODE7=(%w+)$"
      L6_1 = L6_1(L7_1, L8_1)
      if L6_1 == nil then
        L7_1 = mp
        L7_1 = L7_1.CLEAN
        return L7_1
      end
      L7_1 = MpCommon
      L7_1 = L7_1.AnomalyEventLookup
      L8_1 = "AnomalyTencode7"
      L9_1 = "Tencode7TableMarker"
      L10_1 = 100
      L7_1 = L7_1(L8_1, L9_1, L10_1)
      if L7_1 == nil then
        L8_1 = MpCommon
        L8_1 = L8_1.AnomalyEventUpdate
        L9_1 = "AnomalyTencode7"
        L10_1 = "Tencode7TableMarker"
        L11_1 = 1
        L12_1 = 1
        L8_1(L9_1, L10_1, L11_1, L12_1)
        L8_1 = mp
        L8_1 = L8_1.CLEAN
        return L8_1
      end
      L8_1 = MpCommon
      L8_1 = L8_1.AnomalyEventLookup
      L9_1 = "AnomalyTencode7"
      L10_1 = L6_1
      L11_1 = 1
      L8_1 = L8_1(L9_1, L10_1, L11_1)
      if L8_1 == nil then
        L9_1 = MpCommon
        L9_1 = L9_1.AnomalyEventUpdate
        L10_1 = "AnomalyTencode7"
        L11_1 = L6_1
        L12_1 = 1
        L13_1 = 1
        L9_1(L10_1, L11_1, L12_1, L13_1)
        L9_1 = MpCommon
        L9_1 = L9_1.SNidSearch
        L10_1 = 228
        L11_1 = L6_1
        L9_1, L10_1, L11_1 = L9_1(L10_1, L11_1)
        if L9_1 == true and L10_1 == "!#Tencode7CommonGlobal" then
          L12_1 = mp
          L12_1 = L12_1.CLEAN
          return L12_1
        end
        L12_1 = L7_1.UnbiasedTime
        if 1800 < L12_1 then
          L12_1 = mp
          L12_1 = L12_1.set_mpattribute
          L13_1 = "Lua:AnomalyPSENew"
          L12_1(L13_1)
          L12_1 = mp
          L12_1 = L12_1.INFECTED
          return L12_1
        end
      else
        L9_1 = MpCommon
        L9_1 = L9_1.AnomalyEventUpdate
        L10_1 = "AnomalyTencode7"
        L11_1 = L6_1
        L12_1 = L8_1.Count
        L12_1 = L12_1 + 1
        L13_1 = 1
        L9_1(L10_1, L11_1, L12_1, L13_1)
        L9_1 = MpCommon
        L9_1 = L9_1.SNidSearch
        L10_1 = 228
        L11_1 = L6_1
        L9_1, L10_1, L11_1 = L9_1(L10_1, L11_1)
        if L9_1 == true and L10_1 == "!#Tencode7CommonGlobal" then
          L12_1 = mp
          L12_1 = L12_1.CLEAN
          return L12_1
        end
        L12_1 = L8_1.Count
        if L12_1 == 1 then
          L12_1 = mp
          L12_1 = L12_1.set_mpattribute
          L13_1 = "Lua:AnomalyPSEObsMal"
          L12_1(L13_1)
          L12_1 = mp
          L12_1 = L12_1.INFECTED
          return L12_1
        end
        L12_1 = L8_1.Count
        if L12_1 < 3 then
          L12_1 = L8_1.UnbiasedTime
          if 20160 < L12_1 then
            L12_1 = mp
            L12_1 = L12_1.set_mpattribute
            L13_1 = "Lua:AnomalyPSENotFreq"
            L12_1(L13_1)
            L12_1 = mp
            L12_1 = L12_1.INFECTED
            return L12_1
          end
        end
        L12_1 = L8_1.LastSeen
        if 43200 <= L12_1 then
          L12_1 = MpCommon
          L12_1 = L12_1.AnomalyEventUpdate
          L13_1 = "AnomalyTencode7"
          L14_1 = L6_1
          L15_1 = 1
          L16_1 = 1
          L12_1(L13_1, L14_1, L15_1, L16_1)
          L12_1 = mp
          L12_1 = L12_1.INFECTED
          return L12_1
        end
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
