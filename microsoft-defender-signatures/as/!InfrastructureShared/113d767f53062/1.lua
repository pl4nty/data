local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
L1_1 = L0_1.ppid
L2_1 = {}
while L0_1 do
  L3_1 = L0_1.image_path
  if not L3_1 then
    break
  end
  L3_1 = L0_1.image_path
  L4_1 = L3_1
  L3_1 = L3_1.match
  L5_1 = "([^\\]+)$"
  L3_1 = L3_1(L4_1, L5_1)
  L4_1 = table
  L4_1 = L4_1.insert
  L5_1 = L2_1
  L6_1 = L3_1
  L4_1(L5_1, L6_1)
  L4_1 = mp
  L4_1 = L4_1.GetParentProcInfo
  L5_1 = L0_1.ppid
  L4_1 = L4_1(L5_1)
  L0_1 = L4_1
end
L3_1 = {}
L4_1 = GetRollingQueueKeys
L5_1 = "NewlyRegisteredServices"
L4_1 = L4_1(L5_1)
if L4_1 then
  L5_1 = next
  L6_1 = L4_1
  L5_1 = L5_1(L6_1)
  if L5_1 then
    L5_1 = ipairs
    L6_1 = L4_1
    L5_1, L6_1, L7_1 = L5_1(L6_1)
    for L8_1, L9_1 in L5_1, L6_1, L7_1 do
      L10_1 = contains
      L11_1 = L9_1
      L12_1 = L2_1
      L10_1 = L10_1(L11_1, L12_1)
      if L10_1 then
        L3_1.RegisteredSrv = L9_1
        break
      end
    end
  end
end
L5_1 = reportRelevantUntrustedEntitiesForPid
L6_1 = L1_1
L5_1 = L5_1(L6_1)
if L5_1 then
  L6_1 = next
  L7_1 = L5_1
  L6_1 = L6_1(L7_1)
  if L6_1 then
    L3_1.HasUntrustedEntities = true
    L3_1.UntrustedEntities = L5_1
  end
end
L6_1 = next
L7_1 = L3_1
L6_1 = L6_1(L7_1)
if L6_1 then
  L6_1 = set_research_data
  L7_1 = "AdditionalInfo"
  L8_1 = MpCommon
  L8_1 = L8_1.Base64Encode
  L9_1 = safeJsonSerialize
  L10_1 = L3_1
  L9_1, L10_1, L11_1, L12_1 = L9_1(L10_1)
  L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
  L9_1 = false
  L6_1(L7_1, L8_1, L9_1)
end
L6_1 = mp
L6_1 = L6_1.INFECTED
return L6_1
