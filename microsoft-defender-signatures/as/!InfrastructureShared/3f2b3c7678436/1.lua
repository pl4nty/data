local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = isnull
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = isnull
  L2_1 = L0_1.ppid
  L1_1 = L1_1(L2_1)
  if not L1_1 then
    goto lbl_17
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_17::
L1_1 = mp
L1_1 = L1_1.GetProcessCommandLine
L2_1 = L0_1.ppid
L1_1 = L1_1(L2_1)
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = isCommonScheduledTaskCommand
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if L2_1 == true then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.GetParentProcInfo
L2_1 = L2_1()
L3_1 = isnull
L4_1 = L2_1
L3_1 = L3_1(L4_1)
if not L3_1 then
  L3_1 = isnull
  L4_1 = L2_1.image_path
  L3_1 = L3_1(L4_1)
  if not L3_1 then
    goto lbl_50
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_50::
L3_1 = string
L3_1 = L3_1.lower
L4_1 = L2_1.image_path
L3_1 = L3_1(L4_1)
L4_1 = StringEndsWith
L5_1 = L3_1
L6_1 = "\\windows\\system32\\svchost.exe"
L4_1 = L4_1(L5_1, L6_1)
if not L4_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = IsCommandLineTrackedForTechnique
L5_1 = L1_1
L6_1 = "LuaTriggerTaskResourceScanB"
L4_1 = L4_1(L5_1, L6_1)
if L4_1 == true then
  L4_1 = TrackPidAndTechniqueBM
  L5_1 = L0_1.ppid
  L6_1 = "T1053.005"
  L7_1 = "schtask_target"
  L4_1(L5_1, L6_1, L7_1)
  L4_1 = TrackPidAndTechniqueBM
  L5_1 = L0_1.ppid
  L6_1 = "T1053.005"
  L7_1 = "BM:ScheduledTaskProcessExecution.B"
  L4_1(L5_1, L6_1, L7_1)
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
