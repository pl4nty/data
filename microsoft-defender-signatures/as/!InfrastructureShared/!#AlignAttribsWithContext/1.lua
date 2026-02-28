local L0_1, L1_1, L2_1, L3_1, L4_1
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_SCANREASON
L1_1 = L1_1(L2_1)
L2_1 = mp
L2_1 = L2_1.SCANREASON_ONOPEN
if L1_1 ~= L2_1 then
  L2_1 = mp
  L2_1 = L2_1.SCANREASON_ONMODIFIEDHANDLECLOSE
  if L1_1 ~= L2_1 then
    L2_1 = mp
    L2_1 = L2_1.SCANREASON_UNKNOWN
    if L1_1 == L2_1 then
      L2_1 = mp
      L2_1 = L2_1.GetResmgrBasePlugin
      L2_1 = L2_1()
      if L2_1 == "file" then
        L2_1 = mp
        L2_1 = L2_1.getfilename
        L2_1 = L2_1()
        L0_1 = L2_1
        L2_1 = sysio
        L2_1 = L2_1.IsFileExists
        L3_1 = L0_1
        L2_1 = L2_1(L3_1)
        if not L2_1 then
          L2_1 = mp
          L2_1 = L2_1.CLEAN
          return L2_1
        end
      else
        L2_1 = mp
        L2_1 = L2_1.CLEAN
        return L2_1
      end
    else
      L2_1 = mp
      L2_1 = L2_1.CLEAN
      return L2_1
    end
  end
end
if L0_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.getfilename
  L2_1 = L2_1()
  L0_1 = L2_1
end
L2_1 = mp
L2_1 = L2_1.get_mpattribute
L3_1 = "BM_AgePrevLookedUpForBITS"
L2_1 = L2_1(L3_1)
if not L2_1 then
  L2_1 = MpCommon
  L2_1 = L2_1.QueryPersistContext
  L3_1 = L0_1
  L4_1 = "BM_AgePrevLookedUpForBITS"
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 then
    L2_1 = mp
    L2_1 = L2_1.set_mpattribute
    L3_1 = "BM_AgePrevLookedUpForBITS"
    L2_1(L3_1)
  end
end
L2_1 = mp
L2_1 = L2_1.get_mpattribute
L3_1 = "BM_BlockedForBITS"
L2_1 = L2_1(L3_1)
if not L2_1 then
  L2_1 = MpCommon
  L2_1 = L2_1.QueryPersistContext
  L3_1 = L0_1
  L4_1 = "BM_BlockedForBITS"
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 then
    L2_1 = mp
    L2_1 = L2_1.set_mpattribute
    L3_1 = "BM_BlockedForBITS"
    L2_1(L3_1)
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
