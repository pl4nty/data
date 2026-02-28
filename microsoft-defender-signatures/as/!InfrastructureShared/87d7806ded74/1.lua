local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.GetScannedPPID
L0_1 = L0_1()
if L0_1 == "" or L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.GetParentProcInfo
L1_1 = L1_1()
if L1_1 ~= nil then
  L2_1 = L1_1.ppid
  if L2_1 ~= nil then
    L2_1 = L1_1.image_path
    if L2_1 ~= nil then
      goto lbl_25
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_25::
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1.image_path
L2_1 = L2_1(L3_1)
L4_1 = L2_1
L3_1 = L2_1.find
L5_1 = "ltsvc.exe$"
L3_1 = L3_1(L4_1, L5_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L4_1 = L2_1
L3_1 = L2_1.find
L5_1 = "nucleon-service.exe$"
L3_1 = L3_1(L4_1, L5_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = TrackPidAndTechnique
L4_1 = L0_1
L5_1 = "T1490"
L6_1 = "shadowcopy_delete"
L3_1(L4_1, L5_1, L6_1)
L3_1 = IsDetectionThresholdMet
L4_1 = L0_1
L3_1 = L3_1(L4_1)
if not L3_1 then
  L3_1 = IsDetectionThresholdMet
  L4_1 = L1_1.ppid
  L3_1 = L3_1(L4_1)
  if not L3_1 then
    L3_1 = IsTacticObservedForPid
    L4_1 = L0_1
    L5_1 = "wmi_childproc"
    L3_1 = L3_1(L4_1, L5_1)
    if not L3_1 then
      goto lbl_69
    end
  end
end
L3_1 = mp
L3_1 = L3_1.INFECTED
do return L3_1 end
::lbl_69::
L3_1 = mp
L3_1 = L3_1.LOWFI
return L3_1
