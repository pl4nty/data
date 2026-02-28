local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = bm
L0_1 = L0_1.get_imagepath
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = isTainted
  L2_1 = L0_1
  L3_1 = "remote_file_chmodexec"
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 then
    L1_1 = taint
    L2_1 = L0_1
    L3_1 = "susp_remotefile_execution"
    L4_1 = 3600
    L1_1(L2_1, L3_1, L4_1)
    L1_1 = TrackPidAndTechniqueBM
    L2_1 = "BM"
    L3_1 = "T1105"
    L4_1 = "CommandAndControl_IngressToolTransfer_WWDSuspiciousRemoteFileExecution"
    L1_1(L2_1, L3_1, L4_1)
    L1_1 = addRelatedProcess
    L1_1()
    L1_1 = reportRelatedBmHits
    L1_1()
    L1_1 = bm
    L1_1 = L1_1.get_process_relationships
    L1_1, L2_1 = L1_1()
    L3_1 = ipairs
    L4_1 = L2_1
    L3_1, L4_1, L5_1 = L3_1(L4_1)
    for L6_1, L7_1 in L3_1, L4_1, L5_1 do
      L8_1 = bm
      L8_1 = L8_1.trigger_sig
      L9_1 = "BmTraverseTreeBlock"
      L10_1 = "Detected"
      L11_1 = L7_1.ppid
      L8_1(L9_1, L10_1, L11_1)
    end
    L3_1 = sysio
    L3_1 = L3_1.IsFileExists
    L4_1 = L0_1
    L3_1 = L3_1(L4_1)
    if L3_1 then
      L3_1 = bm
      L3_1 = L3_1.add_threat_file
      L4_1 = L0_1
      L3_1(L4_1)
    end
    L3_1 = mp
    L3_1 = L3_1.INFECTED
    return L3_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
