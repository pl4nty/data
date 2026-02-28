local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L1_1 = this_sigattrlog
L1_1 = L1_1[2]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L0_1 = L1_1.ppid
end
if L0_1 ~= nil then
  L1_1 = mp
  L1_1 = L1_1.GetParentProcInfo
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  L2_1 = isParentPackageManager
  L3_1 = L0_1
  L2_1 = L2_1(L3_1)
  if not L2_1 then
    L2_1 = TrackPidAndTechniqueBM
    L3_1 = L0_1
    L4_1 = "T1562.001"
    L5_1 = "DefenseEvasion"
    L2_1(L3_1, L4_1, L5_1)
    L2_1 = IsTacticObservedForPid
    L3_1 = L0_1
    L4_1 = "CommandAndControl_RemoteFileCopy"
    L2_1 = L2_1(L3_1, L4_1)
    if L2_1 then
      L2_1 = mp
      L2_1 = L2_1.INFECTED
      return L2_1
    end
    if L1_1 ~= nil then
      L2_1 = IsTacticObservedForPid
      L3_1 = L1_1.ppid
      L4_1 = "CommandAndControl_RemoteFileCopy"
      L2_1 = L2_1(L3_1, L4_1)
      if L2_1 then
        L2_1 = mp
        L2_1 = L2_1.INFECTED
        return L2_1
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
