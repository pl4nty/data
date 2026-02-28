local L0_1, L1_1, L2_1, L3_1, L4_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.utf8p1
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[1]
    L0_1 = L1_1.ppid
    L1_1 = TrackPidAndTechniqueBM
    L2_1 = L0_1
    L3_1 = "T1059.006"
    L4_1 = "Execution"
    L1_1(L2_1, L3_1, L4_1)
    L1_1 = TrackPidAndTechniqueBM
    L2_1 = L0_1
    L3_1 = "T1071.001"
    L4_1 = "CommandAndControl"
    L1_1(L2_1, L3_1, L4_1)
    L1_1 = mp
    L1_1 = L1_1.INFECTED
    return L1_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
