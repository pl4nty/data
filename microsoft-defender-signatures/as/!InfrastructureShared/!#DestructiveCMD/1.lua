local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L0_1 ~= L1_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_PROCESSNAME
L0_1 = L0_1(L1_1)
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_PROCESSDEVICEPATH
L1_1 = L1_1(L2_1)
if L1_1 == nil or L1_1 == "" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = MpCommon
L2_1 = L2_1.PathToWin32Path
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = L2_1
L4_1 = "\\"
L5_1 = L0_1
L3_1 = L3_1 .. L4_1 .. L5_1
L4_1 = string
L4_1 = L4_1.lower
L5_1 = L3_1
L4_1 = L4_1(L5_1)
L3_1 = L4_1
L4_1 = MpCommon
L4_1 = L4_1.QueryPersistContext
L5_1 = L3_1
L6_1 = "RunsDestructiveCMDsParent"
L4_1 = L4_1(L5_1, L6_1)
if not L4_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.set_mpattribute
L5_1 = "BM_FileModByDestructiveCMDParent"
L4_1(L5_1)
L4_1 = MpCommon
L4_1 = L4_1.QueryPersistContext
L5_1 = L3_1
L6_1 = "RunsDestructiveCMDsParentBlock"
L4_1 = L4_1(L5_1, L6_1)
if not L4_1 then
  L4_1 = MpCommon
  L4_1 = L4_1.QueryPersistContext
  L5_1 = L3_1
  L6_1 = "RunsDestructiveCMDsParentStopLookup"
  L4_1 = L4_1(L5_1, L6_1)
  if not L4_1 then
    goto lbl_88
  end
end
L4_1 = clearPersistContext
L5_1 = L3_1
L6_1 = "disableCachingQueryAgePrev"
L4_1(L5_1, L6_1)
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_88::
L4_1 = -1
L5_1 = -1
L6_1 = MpCommon
L6_1 = L6_1.GetPersistContext
L7_1 = L3_1
L6_1 = L6_1(L7_1)
if L6_1 ~= nil then
  L7_1 = ipairs
  L8_1 = L6_1
  L7_1, L8_1, L9_1 = L7_1(L8_1)
  for L10_1, L11_1 in L7_1, L8_1, L9_1 do
    L12_1 = tonumber
    L13_1 = string
    L13_1 = L13_1.match
    L14_1 = L11_1
    L15_1 = "^Age:([0-9]+)$"
    L13_1, L14_1, L15_1, L16_1 = L13_1(L14_1, L15_1)
    L12_1 = L12_1(L13_1, L14_1, L15_1, L16_1)
    if L12_1 ~= nil and L4_1 < L12_1 then
      L4_1 = L12_1
    end
    L13_1 = tonumber
    L14_1 = string
    L14_1 = L14_1.match
    L15_1 = L11_1
    L16_1 = "^Prevalence:([0-9]+)$"
    L14_1, L15_1, L16_1 = L14_1(L15_1, L16_1)
    L13_1 = L13_1(L14_1, L15_1, L16_1)
    if L13_1 ~= nil and L5_1 < L13_1 then
      L5_1 = L13_1
    end
  end
end
if -1 < L4_1 and L4_1 <= 1 and -1 < L5_1 and L5_1 <= 100 then
  L7_1 = MpCommon
  L7_1 = L7_1.QueryPersistContext
  L8_1 = L3_1
  L9_1 = "RunsDestructiveCMDsParentBlock"
  L7_1 = L7_1(L8_1, L9_1)
  if not L7_1 then
    L7_1 = MpCommon
    L7_1 = L7_1.AppendPersistContext
    L8_1 = L3_1
    L9_1 = "RunsDestructiveCMDsParentBlock"
    L10_1 = 0
    L7_1(L8_1, L9_1, L10_1)
  end
  L7_1 = clearPersistContext
  L8_1 = L3_1
  L9_1 = "disableCachingQueryAgePrev"
  L7_1(L8_1, L9_1)
elseif 1 < L4_1 or 100 < L5_1 then
  L7_1 = MpCommon
  L7_1 = L7_1.QueryPersistContext
  L8_1 = L3_1
  L9_1 = "RunsDestructiveCMDsParentStopLookup"
  L7_1 = L7_1(L8_1, L9_1)
  if not L7_1 then
    L7_1 = MpCommon
    L7_1 = L7_1.AppendPersistContext
    L8_1 = L3_1
    L9_1 = "RunsDestructiveCMDsParentStopLookup"
    L10_1 = 0
    L7_1(L8_1, L9_1, L10_1)
  end
  L7_1 = clearPersistContext
  L8_1 = L3_1
  L9_1 = "disableCachingQueryAgePrev"
  L7_1(L8_1, L9_1)
else
  L7_1 = MpCommon
  L7_1 = L7_1.QueryPersistContext
  L8_1 = L3_1
  L9_1 = "disableCachingQueryAgePrev"
  L7_1 = L7_1(L8_1, L9_1)
  if not L7_1 then
    L7_1 = MpCommon
    L7_1 = L7_1.AppendPersistContext
    L8_1 = L3_1
    L9_1 = "disableCachingQueryAgePrev"
    L10_1 = 0
    L7_1(L8_1, L9_1, L10_1)
  end
end
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
