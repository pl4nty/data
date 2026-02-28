local L0_1, L1_1, L2_1, L3_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONOPEN
if L0_1 == L1_1 then
  L0_1 = mp
  L0_1 = L0_1.get_contextdata
  L1_1 = mp
  L1_1 = L1_1.CONTEXT_DATA_OPEN_CREATEPROCESS_HINT
  L0_1 = L0_1(L1_1)
  if L0_1 then
    L0_1 = mp
    L0_1 = L0_1.getfilename
    L1_1 = mp
    L1_1 = L1_1.bitor
    L2_1 = mp
    L2_1 = L2_1.FILEPATH_QUERY_FULL
    L3_1 = mp
    L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
    L1_1, L2_1, L3_1 = L1_1(L2_1, L3_1)
    L0_1 = L0_1(L1_1, L2_1, L3_1)
    if L0_1 then
      L1_1 = MpCommon
      L1_1 = L1_1.QueryPersistContext
      L2_1 = L0_1
      L3_1 = "isErik"
      L1_1 = L1_1(L2_1, L3_1)
      if L1_1 then
        L1_1 = mp
        L1_1 = L1_1.INFECTED
        return L1_1
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
