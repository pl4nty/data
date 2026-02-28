local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = L0_1.command_line
L2_1 = bm
L2_1 = L2_1.get_imagepath
L2_1 = L2_1()
L3_1 = IsExcludedByCmdlineMacOS
L4_1 = L1_1
L3_1 = L3_1(L4_1)
if not L3_1 then
  L3_1 = IsExcludedByImagePathMacOS
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  if not L3_1 then
    goto lbl_21
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_21::
L3_1 = SuspMacPathsToMonitor
L4_1 = L2_1
L5_1 = true
L3_1 = L3_1(L4_1, L5_1)
if not L3_1 then
  L3_1 = string
  L3_1 = L3_1.find
  L4_1 = L2_1
  L5_1 = "/Users/[^/]+/Downloads/"
  L6_1 = 1
  L7_1 = false
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if not L3_1 then
    L3_1 = string
    L3_1 = L3_1.find
    L4_1 = L2_1
    L5_1 = "/Users/[^/]+/Documents/"
    L6_1 = 1
    L7_1 = false
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if not L3_1 then
      L3_1 = string
      L3_1 = L3_1.find
      L4_1 = L2_1
      L5_1 = "/Users/[^/]+/Desktop/"
      L6_1 = 1
      L7_1 = false
      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
      if not L3_1 then
        goto lbl_64
      end
    end
  end
end
L3_1 = sysio
L3_1 = L3_1.IsFileExists
L4_1 = L2_1
L3_1 = L3_1(L4_1)
if L3_1 then
  L3_1 = bm
  L3_1 = L3_1.add_threat_file
  L4_1 = L2_1
  L3_1(L4_1)
end
::lbl_64::
L3_1 = this_sigattrlog
L3_1 = L3_1[3]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = TrackPidAndTechniqueBM
  L4_1 = "BM"
  L5_1 = "T1564.001"
  L6_1 = "DefenseEvasion_HideArtifacts_KandyKorn"
  L3_1(L4_1, L5_1, L6_1)
else
  L3_1 = TrackPidAndTechniqueBM
  L4_1 = "BM"
  L5_1 = "T1036.005"
  L6_1 = "DefenseEvasion_Masquerading_KandyKorn"
  L3_1(L4_1, L5_1, L6_1)
end
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
