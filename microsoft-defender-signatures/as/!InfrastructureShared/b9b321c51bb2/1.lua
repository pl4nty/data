local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = add_parents
L0_1()
L0_1 = reportSessionInformationInclusive
L0_1()
L0_1 = reportRelevantUntrustedEntities
L1_1 = 0
L0_1 = L0_1(L1_1)
if L0_1 then
  L1_1 = next
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  if L1_1 then
    L1_1 = bm
    L1_1 = L1_1.add_related_string
    L2_1 = "HasUntrustedEntities"
    L3_1 = "true"
    L4_1 = bm
    L4_1 = L4_1.RelatedStringBMReport
    L1_1(L2_1, L3_1, L4_1)
    L1_1 = bm
    L1_1 = L1_1.add_related_string
    L2_1 = "UntrustedEntities"
    L3_1 = safeJsonSerialize
    L4_1 = L0_1
    L3_1 = L3_1(L4_1)
    L4_1 = bm
    L4_1 = L4_1.RelatedStringBMReport
    L1_1(L2_1, L3_1, L4_1)
  end
end
L1_1 = add_parents
L1_1 = L1_1()
L2_1 = {}
L3_1 = ipairs
L4_1 = L1_1
L3_1, L4_1, L5_1 = L3_1(L4_1)
for L6_1, L7_1 in L3_1, L4_1, L5_1 do
  L9_1 = L7_1
  L8_1 = L7_1.match
  L10_1 = "([^\\]+)$"
  L8_1 = L8_1(L9_1, L10_1)
  L9_1 = table
  L9_1 = L9_1.insert
  L10_1 = L2_1
  L11_1 = L8_1
  L9_1(L10_1, L11_1)
end
L3_1 = GetRollingQueue
L4_1 = "NewlyRegisteredServices"
L3_1 = L3_1(L4_1)
if L3_1 then
  L4_1 = ipairs
  L5_1 = L3_1
  L4_1, L5_1, L6_1 = L4_1(L5_1)
  for L7_1, L8_1 in L4_1, L5_1, L6_1 do
    L9_1 = contains
    L10_1 = L8_1
    L11_1 = L2_1
    L9_1 = L9_1(L10_1, L11_1)
    if L9_1 then
      L9_1 = bm
      L9_1 = L9_1.add_related_string
      L10_1 = "RegisteredSrv"
      L11_1 = L8_1
      L12_1 = bm
      L12_1 = L12_1.RelatedStringBMReport
      L9_1(L10_1, L11_1, L12_1)
      break
    end
  end
end
L4_1 = mp
L4_1 = L4_1.INFECTED
return L4_1
