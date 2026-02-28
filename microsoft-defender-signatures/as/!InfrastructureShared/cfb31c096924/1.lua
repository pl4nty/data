local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = TrackPidAndTechniqueBM
L1_1 = "BM"
L2_1 = "T1552.001"
L3_1 = "CredentialAccess"
L0_1(L1_1, L2_1, L3_1)
L0_1 = TrackPidAndTechniqueBM
L1_1 = "BM"
L2_1 = "T1074"
L3_1 = "Collection_DataStaged"
L0_1(L1_1, L2_1, L3_1)
L0_1 = bm
L0_1 = L0_1.get_process_relationships
L0_1, L1_1 = L0_1()
L2_1 = ipairs
L3_1 = L0_1
L2_1, L3_1, L4_1 = L2_1(L3_1)
for L5_1, L6_1 in L2_1, L3_1, L4_1 do
  L7_1 = mp
  L7_1 = L7_1.bitand
  L8_1 = L6_1.reason_ex
  L9_1 = 1
  L7_1 = L7_1(L8_1, L9_1)
  if L7_1 == 1 then
    L7_1 = isTainted
    L8_1 = L6_1.image_path
    L9_1 = "remote_file_created_taint"
    L7_1 = L7_1(L8_1, L9_1)
    if L7_1 then
      L7_1 = addRelatedProcess
      L7_1()
      L7_1 = mp
      L7_1 = L7_1.INFECTED
      return L7_1
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
