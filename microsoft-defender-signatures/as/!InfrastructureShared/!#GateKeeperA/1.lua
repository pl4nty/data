local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = false
L1_1 = versioning
L1_1 = L1_1.IsBeta
L1_1 = L1_1()
if L1_1 then
  L1_1 = versioning
  L1_1 = L1_1.IsServer
  L1_1 = L1_1()
  if not L1_1 then
    L1_1 = versioning
    L1_1 = L1_1.GetOsVersion
    L1_1 = L1_1()
    if 393219 < L1_1 then
      L1_1 = versioning
      L1_1 = L1_1.GetOsBuildNumber
      L1_1 = L1_1()
      if 18900 < L1_1 and L1_1 < 19100 then
        L2_1 = MpCommon
        L2_1 = L2_1.IsSampled
        L3_1 = 50000
        L4_1 = false
        L5_1 = true
        L6_1 = false
        L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
        if L2_1 then
          L0_1 = true
        end
      end
    else
      L1_1 = versioning
      L1_1 = L1_1.IsEnterprise
      L1_1 = L1_1()
      if not L1_1 then
        L1_1 = MpCommon
        L1_1 = L1_1.IsSampled
        L2_1 = 50000
        L3_1 = false
        L4_1 = true
        L5_1 = false
        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
        if not L1_1 then
          goto lbl_50
        end
      end
      L0_1 = true
    end
    ::lbl_50::
    if L0_1 then
      L1_1 = mp
      L1_1 = L1_1.get_contextdata
      L2_1 = mp
      L2_1 = L2_1.CONTEXT_DATA_SCANREASON
      L1_1 = L1_1(L2_1)
      L2_1 = mp
      L2_1 = L2_1.SCANREASON_ONOPEN
      if L1_1 == L2_1 then
        L1_1 = mp
        L1_1 = L1_1.get_contextdata
        L2_1 = mp
        L2_1 = L2_1.CONTEXT_DATA_OPEN_CREATEPROCESS_HINT
        L1_1 = L1_1(L2_1)
        if L1_1 then
          L1_1 = mp
          L1_1 = L1_1.INFECTED
          return L1_1
        end
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
