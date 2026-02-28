local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = this_sigattrlog
L0_1 = L0_1[3]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[3]
  L0_1 = L0_1.utf8p1
  if L0_1 ~= nil then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[3]
    L0_1 = L0_1.utf8p1
    if L0_1 ~= "" then
      goto lbl_19
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_19::
L0_1 = this_sigattrlog
L0_1 = L0_1[3]
L0_1 = L0_1.utf8p1
L1_1 = {}
L2_1 = "/tmp/test10"
L3_1 = "/private/tmp/test10"
L4_1 = "/tmp/test9.scpt"
L5_1 = "/private/tmp/test9.scpt"
L6_1 = "/usr/local/bin/com.docker.sock"
L7_1 = "/Library/PrivilegedHelperTools/us.zoom.ZoomHelperTool"
L8_1 = "/usr/local/bin/com.docker.vmnat"
L9_1 = "/usr/local/bin/com.docker.vmnat.lock"
L10_1 = "/Library/PrivilegedHelperTools/com.microsoft.teams.TeamsDaemon"
L11_1 = "/Library/PrivilegedHelperTools/us.zoom.ZoomService"
L1_1[1] = L2_1
L1_1[2] = L3_1
L1_1[3] = L4_1
L1_1[4] = L5_1
L1_1[5] = L6_1
L1_1[6] = L7_1
L1_1[7] = L8_1
L1_1[8] = L9_1
L1_1[9] = L10_1
L1_1[10] = L11_1
L2_1 = ipairs
L3_1 = L1_1
L2_1, L3_1, L4_1 = L2_1(L3_1)
for L5_1, L6_1 in L2_1, L3_1, L4_1 do
  L7_1 = string
  L7_1 = L7_1.find
  L8_1 = L0_1
  L9_1 = L6_1
  L10_1 = 1
  L11_1 = true
  L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
  if L7_1 == 1 then
    L7_1 = sysio
    L7_1 = L7_1.IsFileExists
    L8_1 = L0_1
    L7_1 = L7_1(L8_1)
    if L7_1 then
      L7_1 = bm
      L7_1 = L7_1.add_threat_file
      L8_1 = L0_1
      L7_1(L8_1)
    end
    L7_1 = mp
    L7_1 = L7_1.INFECTED
    return L7_1
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
