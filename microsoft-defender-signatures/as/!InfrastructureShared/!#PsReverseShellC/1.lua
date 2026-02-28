local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_AMSI
if L0_1 == L1_1 then
  L1_1 = {}
  L2_1 = MpCommon
  L2_1 = L2_1.GetPersistContextCountNoPath
  L3_1 = "psfrag"
  L2_1 = L2_1(L3_1)
  if 2 <= L2_1 then
    L2_1 = mp
    L2_1 = L2_1.set_mpattribute
    L3_1 = "PS_Revershell"
    L2_1(L3_1)
  else
    L2_1 = MpCommon
    L2_1 = L2_1.GetPersistContextCountNoPath
    L3_1 = "psfrag"
    L2_1 = L2_1(L3_1)
    if 0 < L2_1 then
      L2_1 = MpCommon
      L2_1 = L2_1.QueryPersistContextNoPath
      L3_1 = "psfrag"
      L4_1 = "p3"
      L2_1 = L2_1(L3_1, L4_1)
      if not L2_1 then
        L2_1 = MpCommon
        L2_1 = L2_1.AppendPersistContextNoPath
        L3_1 = "psfrag"
        L4_1 = "p3"
        L5_1 = 120
        L2_1(L3_1, L4_1, L5_1)
    end
    else
      L2_1 = MpCommon
      L2_1 = L2_1.QueryPersistContextNoPath
      L3_1 = "psfrag"
      L4_1 = "p3"
      L2_1 = L2_1(L3_1, L4_1)
      if not L2_1 then
        L2_1 = table
        L2_1 = L2_1.insert
        L3_1 = L1_1
        L4_1 = "p3"
        L2_1(L3_1, L4_1)
        L2_1 = MpCommon
        L2_1 = L2_1.SetPersistContextNoPath
        L3_1 = "psfrag"
        L4_1 = L1_1
        L5_1 = 120
        L2_1(L3_1, L4_1, L5_1)
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
