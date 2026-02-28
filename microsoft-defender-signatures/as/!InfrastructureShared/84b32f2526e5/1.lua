local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = GetRollingQueueAsHashTable
L1_1 = "TEAMS_CALL_PLACED"
L0_1 = L0_1(L1_1)
if L0_1 then
  L1_1 = next
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  if L1_1 then
    L1_1 = {}
    L1_1.TEAMS_Meetings = L0_1
    L2_1 = GetRollingQueueAsHashTable
    L3_1 = "RecentThreatsOnMachine"
    L2_1 = L2_1(L3_1)
    L1_1.Recent_Detections = L2_1
    L2_1 = safeJsonSerialize
    L3_1 = L1_1
    L2_1 = L2_1(L3_1)
    L3_1 = bm
    L3_1 = L3_1.add_related_string
    L4_1 = "Evidence"
    L5_1 = L2_1
    L6_1 = bm
    L6_1 = L6_1.RelatedStringBMReport
    L3_1(L4_1, L5_1, L6_1)
    L3_1 = mp
    L3_1 = L3_1.INFECTED
    return L3_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
