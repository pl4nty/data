local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = {}
L2_1 = {}
L3_1 = "/usr/bin/run-parts"
L4_1 = ""
L2_1[1] = L3_1
L2_1[2] = L4_1
L3_1 = {}
L4_1 = "/bin/run-parts"
L5_1 = ""
L3_1[1] = L4_1
L3_1[2] = L5_1
L1_1[1] = L2_1
L1_1[2] = L3_1
L2_1 = L0_1.ppid
if L2_1 then
  L2_1 = isParentPackageManager
  L3_1 = L0_1.ppid
  L4_1 = true
  L2_1 = L2_1(L3_1, L4_1)
  if not L2_1 then
    L2_1 = checkParentCmdline
    L3_1 = L0_1.ppid
    L4_1 = L1_1
    L5_1 = 3
    L2_1 = L2_1(L3_1, L4_1, L5_1)
    if not L2_1 then
      goto lbl_33
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_33::
L2_1 = {}
L3_1 = table
L3_1 = L3_1.insert
L4_1 = L2_1
L5_1 = "GrubTampering.A"
L3_1(L4_1, L5_1)
L3_1 = MpCommon
L3_1 = L3_1.SetPersistContextNoPath
L4_1 = "isRebootDangerous"
L5_1 = L2_1
L6_1 = 3600
L3_1(L4_1, L5_1, L6_1)
L3_1 = TrackPidAndTechniqueBM
L4_1 = "BM"
L5_1 = "T1561.002"
L6_1 = "Impact"
L3_1(L4_1, L5_1, L6_1)
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
