local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.GetScannedPPID
L0_1 = L0_1()
L1_1 = mp
L1_1 = L1_1.GetParentProcInfo
L1_1 = L1_1()
if L1_1 ~= nil then
  L2_1 = TrackPidAndTechnique
  L3_1 = L1_1.ppid
  L4_1 = "T1562.004"
  L5_1 = "DefenseEvasion"
  L2_1(L3_1, L4_1, L5_1)
end
if L0_1 ~= nil then
  L2_1 = IsTacticObservedForPid
  L3_1 = L0_1
  L4_1 = "CommandAndControl_RemoteFileCopy"
  L2_1 = L2_1(L3_1, L4_1)
  if not L2_1 then
    L2_1 = IsTacticObservedForParents
    L3_1 = L0_1
    L4_1 = "CommandAndControl_RemoteFileCopy"
    L5_1 = 2
    L2_1 = L2_1(L3_1, L4_1, L5_1)
    if not L2_1 then
      goto lbl_32
    end
  end
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
::lbl_32::
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
