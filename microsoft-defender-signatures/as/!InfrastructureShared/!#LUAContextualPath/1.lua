local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONOPEN
if L0_1 ~= L1_1 then
  L1_1 = mp
  L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
  if L0_1 ~= L1_1 then
    goto lbl_63
  end
end
L1_1 = mp
L1_1 = L1_1.enum_mpattributesubstring
L2_1 = "BM_"
L1_1 = L1_1(L2_1)
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.enum_mpattributesubstring
L3_1 = "SLF:"
L2_1 = L2_1(L3_1)
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.getfilename
  L4_1 = mp
  L4_1 = L4_1.bitor
  L5_1 = mp
  L5_1 = L5_1.FILEPATH_QUERY_PATH
  L6_1 = mp
  L6_1 = L6_1.FILEPATH_QUERY_LOWERCASE
  L4_1, L5_1, L6_1, L7_1 = L4_1(L5_1, L6_1)
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  L5_1 = L3_1
  L4_1 = L3_1.sub
  L6_1 = 2
  L7_1 = 9
  L4_1 = L4_1(L5_1, L6_1, L7_1)
  if L4_1 ~= "window" then
    L5_1 = L3_1
    L4_1 = L3_1.sub
    L6_1 = 2
    L7_1 = 9
    L4_1 = L4_1(L5_1, L6_1, L7_1)
    if L4_1 ~= "progra" then
      L4_1 = "Evaluation:"
      L5_1 = L3_1
      L4_1 = L4_1 .. L5_1
      L5_1 = MpCommon
      L5_1 = L5_1.GetPersistContextCountNoPath
      L6_1 = L4_1
      L5_1 = L5_1(L6_1)
      if 10 < L5_1 then
        L5_1 = mp
        L5_1 = L5_1.INFECTED
        return L5_1
      end
    end
  end
end
::lbl_63::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
