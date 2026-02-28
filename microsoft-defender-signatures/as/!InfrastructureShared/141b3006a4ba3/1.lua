local L0_1, L1_1, L2_1, L3_1
L0_1 = is_excluded_parent_proc_auto
L0_1 = L0_1()
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = TrackPidAndTechniqueBM
L1_1 = "BM"
L2_1 = "T1547.001"
L3_1 = "persistence_runkeys_b"
L0_1(L1_1, L2_1, L3_1)
L0_1 = mp
L0_1 = L0_1.INFECTED
return L0_1
