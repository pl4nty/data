local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
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
    goto lbl_26
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_26::
L3_1 = {}
L4_1 = "/usr/local/bin/com.docker.sock"
L5_1 = "/Library/PrivilegedHelperTools/us.zoom.ZoomHelperTool"
L6_1 = "/usr/local/bin/com.docker.vmnat"
L7_1 = "/usr/local/bin/com.docker.vmnat.lock"
L8_1 = "/Library/PrivilegedHelperTools/com.microsoft.teams.TeamsDaemon"
L9_1 = "/Library/PrivilegedHelperTools/us.zoom.ZoomService"
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L3_1[4] = L7_1
L3_1[5] = L8_1
L3_1[6] = L9_1
L4_1 = ipairs
L5_1 = L3_1
L4_1, L5_1, L6_1 = L4_1(L5_1)
for L7_1, L8_1 in L4_1, L5_1, L6_1 do
  L9_1 = string
  L9_1 = L9_1.find
  L10_1 = L2_1
  L11_1 = L8_1
  L12_1 = 1
  L13_1 = true
  L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
  if L9_1 == 1 then
    L9_1 = sysio
    L9_1 = L9_1.IsFileExists
    L10_1 = L2_1
    L9_1 = L9_1(L10_1)
    if L9_1 then
      L9_1 = bm
      L9_1 = L9_1.add_threat_file
      L10_1 = L2_1
      L9_1(L10_1)
    end
    L9_1 = TrackPidAndTechniqueBM
    L10_1 = "BM"
    L11_1 = "T1036.004"
    L12_1 = "DefenseEvasion_Masquerading_SuspUserAgent"
    L9_1(L10_1, L11_1, L12_1)
    L9_1 = mp
    L9_1 = L9_1.INFECTED
    return L9_1
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
