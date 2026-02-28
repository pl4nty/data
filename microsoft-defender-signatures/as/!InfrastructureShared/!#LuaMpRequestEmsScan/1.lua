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
    L0_1 = L0_1.get_mpattributevalue
    L1_1 = "MpRequestEmsScanTrigger"
    L0_1 = L0_1(L1_1)
    if L0_1 == 0 then
      L0_1 = 5000
    end
    L1_1 = mp
    L1_1 = L1_1.getfilename
    L2_1 = mp
    L2_1 = L2_1.bitor
    L3_1 = mp
    L3_1 = L3_1.FILEPATH_QUERY_FULL
    L4_1 = mp
    L4_1 = L4_1.FILEPATH_QUERY_LOWERCASE
    L2_1, L3_1, L4_1, L5_1, L6_1, L7_1 = L2_1(L3_1, L4_1)
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1)
    L2_1 = MpCommon
    L2_1 = L2_1.PathToWin32Path
    L3_1 = L1_1
    L2_1 = L2_1(L3_1)
    L3_1 = L2_1
    L2_1 = L2_1.lower
    L2_1 = L2_1(L3_1)
    L1_1 = L2_1
    L2_1 = {}
    L3_1 = table
    L3_1 = L3_1.insert
    L4_1 = L2_1
    L5_1 = L0_1
    L6_1 = "_"
    L7_1 = L1_1
    L5_1 = L5_1 .. L6_1 .. L7_1
    L3_1(L4_1, L5_1)
    L3_1 = MpCommon
    L3_1 = L3_1.SetPersistContextNoPath
    L4_1 = "Lua:MpRequestEmsScan"
    L5_1 = L2_1
    L6_1 = 3
    L3_1(L4_1, L5_1, L6_1)
    L3_1 = mp
    L3_1 = L3_1.INFECTED
    return L3_1
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
