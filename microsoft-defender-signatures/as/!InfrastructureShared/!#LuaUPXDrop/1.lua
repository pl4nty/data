local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.FILEPATH_QUERY_FULL
L0_1 = L0_1(L1_1)
if L0_1 == nil or L0_1 == "" then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_PROCESS_PPID
L1_1 = L1_1(L2_1)
if L1_1 then
  L2_1 = MpCommon
  L2_1 = L2_1.BmTriggerSig
  L3_1 = L1_1
  L4_1 = "BM_UPXDrop"
  L5_1 = L0_1
  L2_1(L3_1, L4_1, L5_1)
end
L2_1 = taint
L3_1 = L0_1
L4_1 = "upx_file_created_taint"
L5_1 = 3600
L2_1(L3_1, L4_1, L5_1)
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
