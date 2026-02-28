local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1

function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  if A0_2 == nil then
    L1_2 = false
    return L1_2
  end
  L1_2 = checkParentCmdline
  L2_2 = A0_2
  L3_2 = {}
  L4_2 = {}
  L5_2 = "/opt/microsoft/mdatp/sbin/wdavdaemon"
  L6_2 = ""
  L4_2[1] = L5_2
  L4_2[2] = L6_2
  L5_2 = {}
  L6_2 = ""
  L7_2 = "python3 -u bin/WALinuxAgent"
  L5_2[1] = L6_2
  L5_2[2] = L7_2
  L3_2[1] = L4_2
  L3_2[2] = L5_2
  L4_2 = 3
  return L1_2(L2_2, L3_2, L4_2)
end

L1_1 = mp
L1_1 = L1_1.GetScannedPPID
L1_1 = L1_1()
L2_1 = isParentPackageManager
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if not L2_1 then
  L2_1 = L0_1
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  if not L2_1 then
    goto lbl_18
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_18::
L2_1 = mp
L2_1 = L2_1.GetParentProcInfo
L2_1 = L2_1()
if L2_1 ~= nil then
  L3_1 = TrackPidAndTechnique
  L4_1 = L2_1.ppid
  L5_1 = "T1562.004"
  L6_1 = "DefenseEvasion"
  L3_1(L4_1, L5_1, L6_1)
end
if L1_1 ~= nil then
  L3_1 = IsTacticObservedForPid
  L4_1 = L1_1
  L5_1 = "CommandAndControl_RemoteFileCopy"
  L3_1 = L3_1(L4_1, L5_1)
  if not L3_1 then
    L3_1 = IsTacticObservedForParents
    L4_1 = L1_1
    L5_1 = "CommandAndControl_RemoteFileCopy"
    L6_1 = 2
    L3_1 = L3_1(L4_1, L5_1, L6_1)
    if not L3_1 then
      goto lbl_46
    end
  end
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
::lbl_46::
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
