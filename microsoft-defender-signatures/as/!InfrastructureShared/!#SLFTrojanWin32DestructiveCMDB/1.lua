local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONOPEN
if L0_1 ~= L1_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.getfilename
L0_1 = L0_1()
L1_1 = string
L1_1 = L1_1.lower
L2_1 = string
L2_1 = L2_1.sub
L3_1 = L0_1
L4_1 = -4
L2_1, L3_1, L4_1, L5_1, L6_1 = L2_1(L3_1, L4_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1)
if L1_1 ~= ".exe" then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = MpCommon
L1_1 = L1_1.QueryPersistContext
L2_1 = L0_1
L3_1 = "RunsDestructiveCMDsParent"
L1_1 = L1_1(L2_1, L3_1)
if not L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = MpCommon
L1_1 = L1_1.QueryPersistContext
L2_1 = L0_1
L3_1 = "RunsDestructiveCMDsParentStopLookup"
L1_1 = L1_1(L2_1, L3_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = MpCommon
L1_1 = L1_1.QueryPersistContext
L2_1 = L0_1
L3_1 = "RunsDestructiveCMDsParentBlock"
L1_1 = L1_1(L2_1, L3_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.get_mpattribute
  L2_1 = "MpDisableCaching"
  L1_1 = L1_1(L2_1)
  if L1_1 then
    L1_1 = mp
    L1_1 = L1_1.clear_mpattribute
    L2_1 = "MpDisableCaching"
    L1_1(L2_1)
  end
  L1_1 = mp
  L1_1 = L1_1.get_mpattribute
  L2_1 = "disableCachingQueryAgePrev"
  L1_1 = L1_1(L2_1)
  if L1_1 then
    L1_1 = mp
    L1_1 = L1_1.clear_mpattribute
    L2_1 = "disableCachingQueryAgePrev"
    L1_1(L2_1)
  end
  L1_1 = clearPersistContext
  L2_1 = L0_1
  L3_1 = "disableCachingQueryAgePrev"
  L1_1(L2_1, L3_1)
  L1_1 = mp
  L1_1 = L1_1.SetHipsRule
  L2_1 = "c1db55ab-c21a-4637-bb3f-a12568109d35"
  L1_1(L2_1)
  L1_1 = mp
  L1_1 = L1_1.BLOCKEXECUTION
  return L1_1
end
L1_1 = getAgePrev
L2_1 = false
L1_1, L2_1 = L1_1(L2_1)
if L1_1 == -1 or L2_1 == -1 then
  L3_1 = mp
  L3_1 = L3_1.get_mpattribute
  L4_1 = "disableCachingQueryAgePrev"
  L3_1 = L3_1(L4_1)
  if not L3_1 then
    L3_1 = mp
    L3_1 = L3_1.set_mpattribute
    L4_1 = "disableCachingQueryAgePrev"
    L3_1(L4_1)
  end
  L3_1 = MpCommon
  L3_1 = L3_1.QueryPersistContext
  L4_1 = L0_1
  L5_1 = "disableCachingQueryAgePrev"
  L3_1 = L3_1(L4_1, L5_1)
  if not L3_1 then
    L3_1 = MpCommon
    L3_1 = L3_1.AppendPersistContext
    L4_1 = L0_1
    L5_1 = "disableCachingQueryAgePrev"
    L6_1 = 0
    L3_1(L4_1, L5_1, L6_1)
  end
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
if L1_1 <= 1 and L2_1 <= 100 then
  L3_1 = MpCommon
  L3_1 = L3_1.QueryPersistContext
  L4_1 = L0_1
  L5_1 = "RunsDestructiveCMDsParentBlock"
  L3_1 = L3_1(L4_1, L5_1)
  if not L3_1 then
    L3_1 = MpCommon
    L3_1 = L3_1.AppendPersistContext
    L4_1 = L0_1
    L5_1 = "RunsDestructiveCMDsParentBlock"
    L6_1 = 0
    L3_1(L4_1, L5_1, L6_1)
  end
  L3_1 = mp
  L3_1 = L3_1.get_mpattribute
  L4_1 = "MpDisableCaching"
  L3_1 = L3_1(L4_1)
  if L3_1 then
    L3_1 = mp
    L3_1 = L3_1.clear_mpattribute
    L4_1 = "MpDisableCaching"
    L3_1(L4_1)
  end
  L3_1 = mp
  L3_1 = L3_1.get_mpattribute
  L4_1 = "disableCachingQueryAgePrev"
  L3_1 = L3_1(L4_1)
  if L3_1 then
    L3_1 = mp
    L3_1 = L3_1.clear_mpattribute
    L4_1 = "disableCachingQueryAgePrev"
    L3_1(L4_1)
  end
  L3_1 = clearPersistContext
  L4_1 = L0_1
  L5_1 = "disableCachingQueryAgePrev"
  L3_1(L4_1, L5_1)
  L3_1 = mp
  L3_1 = L3_1.IsHipsRuleEnabled
  L4_1 = "c1db55ab-c21a-4637-bb3f-a12568109d35"
  L3_1 = L3_1(L4_1)
  if L3_1 == true then
    L3_1 = mp
    L3_1 = L3_1.SetHipsRule
    L4_1 = "c1db55ab-c21a-4637-bb3f-a12568109d35"
    L3_1(L4_1)
    L3_1 = mp
    L3_1 = L3_1.BLOCKEXECUTION
    return L3_1
  else
    L3_1 = mp
    L3_1 = L3_1.ReportLowfi
    L4_1 = L0_1
    L5_1 = 351527962
    L3_1(L4_1, L5_1)
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
end
L3_1 = MpCommon
L3_1 = L3_1.QueryPersistContext
L4_1 = L0_1
L5_1 = "RunsDestructiveCMDsParentStopLookup"
L3_1 = L3_1(L4_1, L5_1)
if not L3_1 then
  L3_1 = MpCommon
  L3_1 = L3_1.AppendPersistContext
  L4_1 = L0_1
  L5_1 = "RunsDestructiveCMDsParentStopLookup"
  L6_1 = 0
  L3_1(L4_1, L5_1, L6_1)
end
L3_1 = mp
L3_1 = L3_1.get_mpattribute
L4_1 = "MpDisableCaching"
L3_1 = L3_1(L4_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.clear_mpattribute
  L4_1 = "MpDisableCaching"
  L3_1(L4_1)
end
L3_1 = mp
L3_1 = L3_1.get_mpattribute
L4_1 = "disableCachingQueryAgePrev"
L3_1 = L3_1(L4_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.clear_mpattribute
  L4_1 = "disableCachingQueryAgePrev"
  L3_1(L4_1)
end
L3_1 = clearPersistContext
L4_1 = L0_1
L5_1 = "disableCachingQueryAgePrev"
L3_1(L4_1, L5_1)
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
