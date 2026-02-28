local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = GetRealPidForScenario
L1_1 = "AMSI"
L0_1 = L0_1(L1_1)
if L0_1 == nil then
  L1_1 = GetRealPidForScenario
  L2_1 = "RTP"
  L1_1 = L1_1(L2_1)
  L0_1 = L1_1
end
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = GetTacticsTableForPid
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = L1_1.wmi_childproc
if not L2_1 then
  L2_1 = L1_1.wsmprovhost_childproc
  if not L2_1 then
    L2_1 = L1_1.winrshost_childproc
    if not L2_1 then
      L2_1 = L1_1.exec_remotedroppedscript_a
      if not L2_1 then
        L2_1 = L1_1.exec_remotedroppedscript_b
        if not L2_1 then
          L2_1 = L1_1.ExecRemoteDroppedExe
          if not L2_1 then
            L2_1 = L1_1.exec_from_remoteshare
            if not L2_1 then
              goto lbl_47
            end
          end
        end
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.INFECTED
do return L2_1 end
::lbl_47::
L2_1 = mp
L2_1 = L2_1.get_mpattribute
L3_1 = "Lua:TT:DetectionThresholdMet"
L2_1 = L2_1(L3_1)
if L2_1 then
  L2_1 = IsTacticObservedForParents
  L3_1 = L0_1
  L4_1 = "exec_from_remoteshare"
  L5_1 = 2
  L2_1 = L2_1(L3_1, L4_1, L5_1)
  if not L2_1 then
    L2_1 = IsTacticObservedForParents
    L3_1 = L0_1
    L4_1 = "remoteservice-target"
    L5_1 = 2
    L2_1 = L2_1(L3_1, L4_1, L5_1)
    if not L2_1 then
      goto lbl_70
    end
  end
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
::lbl_70::
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
