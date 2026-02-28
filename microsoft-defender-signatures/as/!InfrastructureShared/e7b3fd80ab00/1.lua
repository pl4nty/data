local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = bm
L0_1 = L0_1.get_imagepath
L0_1 = L0_1()
L1_1 = TrackPidAndTechniqueBM
L2_1 = "BM"
L3_1 = "T1552.001"
L4_1 = "CredentialAccess"
L1_1(L2_1, L3_1, L4_1)
L1_1 = TrackPidAndTechniqueBM
L2_1 = "BM"
L3_1 = "T1074"
L4_1 = "Collection_DataStaged"
L1_1(L2_1, L3_1, L4_1)
L1_1 = addRelatedProcess
L1_1()
L1_1 = isTainted
L2_1 = L0_1
L3_1 = "remote_file_created_taint"
L1_1 = L1_1(L2_1, L3_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
