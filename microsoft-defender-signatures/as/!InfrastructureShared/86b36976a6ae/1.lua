local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = this_sigattrlog
L0_1 = L0_1[1]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[1]
  L0_1 = L0_1.utf8p1
  if L0_1 then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[1]
    L0_1 = L0_1.utf8p1
    L1_1 = L0_1
    L0_1 = L0_1.match
    L2_1 = "([^\\]+)$"
    L0_1 = L0_1(L1_1, L2_1)
    L1_1 = GetRollingQueueKeys
    L2_1 = "NewlyRegisteredServices_Name"
    L1_1 = L1_1(L2_1)
    if L1_1 then
      L2_1 = ipairs
      L3_1 = L1_1
      L2_1, L3_1, L4_1 = L2_1(L3_1)
      for L5_1, L6_1 in L2_1, L3_1, L4_1 do
        L7_1 = contains
        L8_1 = L0_1
        L9_1 = L6_1
        L7_1 = L7_1(L8_1, L9_1)
        if L7_1 then
          L7_1 = bm
          L7_1 = L7_1.add_related_string
          L8_1 = "RegisteredSrv"
          L9_1 = L0_1
          L10_1 = bm
          L10_1 = L10_1.RelatedStringBMReport
          L7_1(L8_1, L9_1, L10_1)
          L7_1 = reportRelevantUntrustedEntities
          L8_1 = 0
          L7_1 = L7_1(L8_1)
          if L7_1 then
            L8_1 = next
            L9_1 = L7_1
            L8_1 = L8_1(L9_1)
            if L8_1 then
              L8_1 = bm
              L8_1 = L8_1.add_related_string
              L9_1 = "UntrustedEntities"
              L10_1 = safeJsonSerialize
              L11_1 = L7_1
              L10_1 = L10_1(L11_1)
              L11_1 = bm
              L11_1 = L11_1.RelatedStringBMReport
              L8_1(L9_1, L10_1, L11_1)
            end
          end
          L8_1 = mp
          L8_1 = L8_1.INFECTED
          return L8_1
        end
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
