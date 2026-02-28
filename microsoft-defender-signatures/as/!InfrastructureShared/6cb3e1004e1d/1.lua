local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = ""
L1_1 = ""
L2_1 = this_sigattrlog
L2_1 = L2_1[1]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L0_1 = L2_1.utf8p1
end
L2_1 = this_sigattrlog
L2_1 = L2_1[2]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[2]
  L1_1 = L2_1.utf8p1
end
if not (L0_1 and L1_1) or L0_1 ~= L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = bm
L2_1 = L2_1.get_current_process_startup_info
L2_1 = L2_1()
L3_1 = {}
L4_1 = {}
L5_1 = "/usr/sbin/httpd"
L6_1 = ""
L4_1[1] = L5_1
L4_1[2] = L6_1
L5_1 = {}
L6_1 = "/usr/sbin/apache"
L7_1 = ""
L5_1[1] = L6_1
L5_1[2] = L7_1
L6_1 = {}
L7_1 = "/usr/sbin/nginx"
L8_1 = ""
L6_1[1] = L7_1
L6_1[2] = L8_1
L7_1 = {}
L8_1 = "/usr/sbin/lighttpd"
L9_1 = ""
L7_1[1] = L8_1
L7_1[2] = L9_1
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L3_1[4] = L7_1
L4_1 = L2_1.ppid
if L4_1 then
  L4_1 = checkParentCmdline
  L5_1 = L2_1.ppid
  L6_1 = L3_1
  L7_1 = 5
  L4_1 = L4_1(L5_1, L6_1, L7_1)
  if L4_1 then
    goto lbl_62
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_62::
L4_1 = TrackPidAndTechniqueBM
L5_1 = "BM"
L6_1 = "T1190"
L7_1 = "InitialAccess_FileDrop"
L4_1(L5_1, L6_1, L7_1)
L4_1 = mp
L4_1 = L4_1.INFECTED
return L4_1
