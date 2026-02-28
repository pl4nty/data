local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1

function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = string
  L1_2 = L1_2.lower
  L2_2 = A0_2.image_path
  L1_2 = L1_2(L2_2)
  L3_2 = L1_2
  L2_2 = L1_2.match
  L4_2 = "([^\\]+)$"
  L2_2 = L2_2(L3_2, L4_2)
  L3_2 = false
  L4_2 = MpCommon
  L4_2 = L4_2.StringRegExpSearch
  L5_2 = "(wttsvc|teamviewer)"
  L6_2 = L2_2
  L4_2, L5_2 = L4_2(L5_2, L6_2)
  _ = L5_2
  L3_2 = L4_2
  if L3_2 == true then
    L4_2 = true
    return L4_2
  end
  L4_2 = false
  return L4_2
end

L1_1 = mp
L1_1 = L1_1.GetParentProcInfo
L1_1 = L1_1()
L2_1 = L1_1.ppid
L3_1 = {}
while L1_1 do
  L4_1 = L1_1.image_path
  if not L4_1 then
    break
  end
  L4_1 = L1_1.image_path
  L5_1 = L4_1
  L4_1 = L4_1.match
  L6_1 = "([^\\]+)$"
  L4_1 = L4_1(L5_1, L6_1)
  L5_1 = table
  L5_1 = L5_1.insert
  L6_1 = L3_1
  L7_1 = L4_1
  L5_1(L6_1, L7_1)
  L5_1 = L0_1
  L6_1 = L1_1
  L5_1 = L5_1(L6_1)
  if L5_1 then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
  L5_1 = mp
  L5_1 = L5_1.GetParentProcInfo
  L6_1 = L1_1.ppid
  L5_1 = L5_1(L6_1)
  L1_1 = L5_1
end
L4_1 = {}
L5_1 = GetRollingQueueKeys
L6_1 = "NewlyRegisteredServices"
L5_1 = L5_1(L6_1)
if L5_1 then
  L6_1 = next
  L7_1 = L5_1
  L6_1 = L6_1(L7_1)
  if L6_1 then
    L6_1 = ipairs
    L7_1 = L5_1
    L6_1, L7_1, L8_1 = L6_1(L7_1)
    for L9_1, L10_1 in L6_1, L7_1, L8_1 do
      L11_1 = contains
      L12_1 = L10_1
      L13_1 = L3_1
      L11_1 = L11_1(L12_1, L13_1)
      if L11_1 then
        L4_1.RegisteredSrv = L10_1
        break
      end
    end
  end
end
L6_1 = reportRelevantUntrustedEntitiesForPid
L7_1 = L2_1
L6_1 = L6_1(L7_1)
if L6_1 then
  L7_1 = next
  L8_1 = L6_1
  L7_1 = L7_1(L8_1)
  if L7_1 then
    L4_1.HasUntrustedEntities = true
    L4_1.UntrustedEntities = L6_1
  end
end
L7_1 = "TamperingTracking"
L8_1 = GetRollingQueueSumOfValues
L9_1 = L7_1
L8_1 = L8_1(L9_1)
if L8_1 then
  L9_1 = L8_1.sum
  if 0 < L9_1 then
    L9_1 = GetRollingQueue
    L10_1 = L7_1
    L9_1 = L9_1(L10_1)
    L4_1.TamperingEvents = L9_1
    L10_1 = L8_1.sum
    L4_1.TamperingWeight = L10_1
  end
end
L9_1 = next
L10_1 = L4_1
L9_1 = L9_1(L10_1)
if L9_1 then
  L9_1 = set_research_data
  L10_1 = "AdditionalInfo"
  L11_1 = MpCommon
  L11_1 = L11_1.Base64Encode
  L12_1 = safeJsonSerialize
  L13_1 = L4_1
  L12_1, L13_1 = L12_1(L13_1)
  L11_1 = L11_1(L12_1, L13_1)
  L12_1 = false
  L9_1(L10_1, L11_1, L12_1)
end
L9_1 = mp
L9_1 = L9_1.INFECTED
return L9_1
