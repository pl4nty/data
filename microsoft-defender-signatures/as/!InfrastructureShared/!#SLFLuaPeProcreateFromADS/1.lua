local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
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
    L2_1 = L2_1.bitor
    L3_1 = mp
    L3_1 = L3_1.FILEPATH_QUERY_FNAME
    L4_1 = mp
    L4_1 = L4_1.FILEPATH_QUERY_PATH
    L2_1 = L2_1(L3_1, L4_1)
    L3_1 = mp
    L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
    L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1 = L1_1(L2_1, L3_1)
    L0_1, L1_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1)
    L3_1 = L1_1
    L2_1 = L1_1.find
    L4_1 = ":"
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if L2_1 then
      L3_1 = L0_1
      L2_1 = L0_1.sub
      L4_1 = 1
      L5_1 = 8
      L2_1 = L2_1(L3_1, L4_1, L5_1)
      if L2_1 == "\\device\\" then
        L2_1 = MpCommon
        L2_1 = L2_1.PathToWin32Path
        L3_1 = L0_1
        L2_1 = L2_1(L3_1)
        L3_1 = L2_1
        L2_1 = L2_1.lower
        L2_1 = L2_1(L3_1)
        L0_1 = L2_1
      end
      L3_1 = L0_1
      L2_1 = L0_1.find
      L4_1 = "system32\\cngsvc.exe:"
      L2_1 = L2_1(L3_1, L4_1)
      if L2_1 then
        L2_1 = mp
        L2_1 = L2_1.CLEAN
        return L2_1
      end
      L2_1 = L0_1
      L3_1 = "\\"
      L4_1 = L1_1
      L2_1 = L2_1 .. L3_1 .. L4_1
      L3_1 = MpCommon
      L3_1 = L3_1.QueryPersistContext
      L4_1 = L2_1
      L5_1 = "CreateProcFromAlternateDataStream"
      L3_1 = L3_1(L4_1, L5_1)
      if not L3_1 then
        L4_1 = MpCommon
        L4_1 = L4_1.AppendPersistContext
        L5_1 = L2_1
        L6_1 = "CreateProcFromAlternateDataStream"
        L7_1 = 100
        L4_1(L5_1, L6_1, L7_1)
      end
      L4_1 = mp
      L4_1 = L4_1.set_mpattribute
      L5_1 = "BM_PeFileInAlternateDataStream"
      L4_1(L5_1)
      L4_1 = mp
      L4_1 = L4_1.INFECTED
      return L4_1
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
