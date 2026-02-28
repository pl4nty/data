local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = L0_1.ppid
if L1_1 then
  L1_1 = IsPidExcluded
  L2_1 = L0_1.ppid
  L1_1 = L1_1(L2_1)
  if L1_1 then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
  L1_1 = TrackPidAndTechniqueBM
  L2_1 = L0_1.ppid
  L3_1 = "T1057"
  L4_1 = "xfer_from_attackerserver_c"
  L1_1(L2_1, L3_1, L4_1)
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
