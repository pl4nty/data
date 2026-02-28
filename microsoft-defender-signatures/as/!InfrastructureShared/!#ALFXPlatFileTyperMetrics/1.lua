local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = "FileTyperMetrics"
L1_1 = "FileExtMetrics"
L2_1 = false
L3_1 = GetRollingQueueHashTableAsString
L4_1 = L0_1
L5_1 = ":"
L6_1 = "|"
L3_1 = L3_1(L4_1, L5_1, L6_1)
if L3_1 ~= nil then
  L4_1 = #L3_1
  if 0 < L4_1 then
    L4_1 = mp
    L4_1 = L4_1.set_mpattribute
    L5_1 = string
    L5_1 = L5_1.format
    L6_1 = "MpInternal_researchdata=FileTyperMetrics=%s"
    L7_1 = L3_1
    L5_1, L6_1, L7_1 = L5_1(L6_1, L7_1)
    L4_1(L5_1, L6_1, L7_1)
    L4_1 = EraseRollingQueue
    L5_1 = L0_1
    L4_1(L5_1)
    L2_1 = true
  end
end
L4_1 = GetRollingQueueHashTableAsString
L5_1 = L1_1
L6_1 = ":"
L7_1 = "|"
L4_1 = L4_1(L5_1, L6_1, L7_1)
L3_1 = L4_1
if L3_1 ~= nil then
  L4_1 = #L3_1
  if 0 < L4_1 then
    L4_1 = mp
    L4_1 = L4_1.set_mpattribute
    L5_1 = string
    L5_1 = L5_1.format
    L6_1 = "MpInternal_researchdata=ExtensionMetrics=%s"
    L7_1 = L3_1
    L5_1, L6_1, L7_1 = L5_1(L6_1, L7_1)
    L4_1(L5_1, L6_1, L7_1)
    L4_1 = EraseRollingQueue
    L5_1 = L1_1
    L4_1(L5_1)
    L2_1 = true
  end
end
if not L2_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.INFECTED
return L4_1
