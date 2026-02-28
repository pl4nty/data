local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L0_1 ~= L1_1 then
  L1_1 = mp
  L1_1 = L1_1.SCANREASON_ONOPEN
  if L0_1 ~= L1_1 then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
end
L1_1 = mp
L1_1 = L1_1.getfilesize
L1_1 = L1_1()
if 8388608 <= L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.getfilename
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L2_1 = L2_1(L3_1)
L4_1 = L2_1
L3_1 = L2_1.sub
L5_1 = 1
L6_1 = 8
L3_1 = L3_1(L4_1, L5_1, L6_1)
if L3_1 == "\\device\\" then
  L3_1 = MpCommon
  L3_1 = L3_1.PathToWin32Path
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  L2_1 = L3_1
  if L2_1 == nil then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  L3_1 = string
  L3_1 = L3_1.lower
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  L2_1 = L3_1
end
L3_1 = MpCommon
L3_1 = L3_1.QueryPersistContext
L4_1 = L2_1
L5_1 = "NewPECreatedNoCert"
L3_1 = L3_1(L4_1, L5_1)
if not L3_1 then
  L4_1 = MpCommon
  L4_1 = L4_1.AppendPersistContext
  L5_1 = L2_1
  L6_1 = "NewPECreatedNoCert"
  L7_1 = 0
  L4_1(L5_1, L6_1, L7_1)
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
