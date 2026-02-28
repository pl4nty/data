local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L0_1 ~= L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.getfilename
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_FULL
L1_1 = L1_1(L2_1)
if L1_1 ~= nil then
  L2_1 = #L1_1
  if not (L2_1 < 5) then
    goto lbl_26
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_26::
L2_1 = macos
L2_1 = L2_1.GetQuarantineAttr
L2_1 = L2_1()
if L2_1 then
  L2_1 = IsKeyValuePairInRollingQueue
  L3_1 = "MAC_UNS_ADHOC_PATHS"
  L4_1 = "unsigned_adhoc_items"
  L5_1 = L1_1
  L2_1 = L2_1(L3_1, L4_1, L5_1)
  if L2_1 then
    L2_1 = mp
    L2_1 = L2_1.get_contextdata
    L3_1 = mp
    L3_1 = L3_1.CONTEXT_DATA_PROCESS_PPID
    L2_1 = L2_1(L3_1)
    if L2_1 then
      L3_1 = TrackPidAndTechnique
      L4_1 = L2_1
      L5_1 = "T1204.002"
      L6_1 = "Execution_UserExecution_UnsignedDownloadedFile"
      L3_1(L4_1, L5_1, L6_1)
      L3_1 = MpCommon
      L3_1 = L3_1.BmTriggerSig
      L4_1 = L2_1
      L5_1 = "BM_UnsignedFileDownloadAttr"
      L6_1 = L1_1
      L3_1(L4_1, L5_1, L6_1)
    end
    L3_1 = mp
    L3_1 = L3_1.INFECTED
    return L3_1
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
