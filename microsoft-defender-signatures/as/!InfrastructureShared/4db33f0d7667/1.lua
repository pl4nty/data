local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = bm
L0_1 = L0_1.get_process_relationships
L0_1, L1_1 = L0_1()
L2_1 = ipairs
L3_1 = L0_1
L2_1, L3_1, L4_1 = L2_1(L3_1)
for L5_1, L6_1 in L2_1, L3_1, L4_1 do
  L7_1 = L6_1.image_path
  if L7_1 ~= nil then
    L7_1 = string
    L7_1 = L7_1.lower
    L8_1 = string
    L8_1 = L8_1.sub
    L9_1 = L6_1.image_path
    L10_1 = -4
    L8_1, L9_1, L10_1 = L8_1(L9_1, L10_1)
    L7_1 = L7_1(L8_1, L9_1, L10_1)
    if L7_1 == "sshd" then
      L7_1 = TrackPidAndTechniqueBM
      L8_1 = "BM"
      L9_1 = "T1078.001"
      L10_1 = "InitialAccess_RootAccess"
      L7_1(L8_1, L9_1, L10_1)
      L7_1 = TrackPidAndTechniqueBM
      L8_1 = "BM"
      L9_1 = "T1078.001"
      L10_1 = "Persistence_RootAccess"
      L7_1(L8_1, L9_1, L10_1)
      L7_1 = mp
      L7_1 = L7_1.INFECTED
      return L7_1
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
