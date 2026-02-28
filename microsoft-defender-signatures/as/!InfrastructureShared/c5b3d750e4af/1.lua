local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = versioning
L0_1 = L0_1.GetOrgID
L0_1 = L0_1()
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L0_1 = L1_1
if L0_1 == "8a3d3271-36c5-4e53-942a-99bab70de223" or L0_1 == "0a78c000-0352-4e17-9017-de92ad94ca06" then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = TrackPidAndTechniqueBM
L2_1 = "BM"
L3_1 = "T1133"
L4_1 = "tooldrop_by_remote_access_tool"
L1_1(L2_1, L3_1, L4_1)
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
