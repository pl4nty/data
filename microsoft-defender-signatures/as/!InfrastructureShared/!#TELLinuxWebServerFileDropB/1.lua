local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_PROCESS_PPID
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.GetParentProcInfo
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 ~= nil then
  L2_1 = {}
  L3_1 = {}
  L4_1 = ""
  L5_1 = "apache2"
  L3_1[1] = L4_1
  L3_1[2] = L5_1
  L4_1 = {}
  L5_1 = ""
  L6_1 = "nginx"
  L4_1[1] = L5_1
  L4_1[2] = L6_1
  L5_1 = {}
  L6_1 = ""
  L7_1 = "httpd"
  L5_1[1] = L6_1
  L5_1[2] = L7_1
  L6_1 = {}
  L7_1 = ""
  L8_1 = "php-fpm"
  L6_1[1] = L7_1
  L6_1[2] = L8_1
  L2_1[1] = L3_1
  L2_1[2] = L4_1
  L2_1[3] = L5_1
  L2_1[4] = L6_1
  L3_1 = checkParentCmdline
  L4_1 = L0_1
  L5_1 = L2_1
  L6_1 = 5
  L3_1 = L3_1(L4_1, L5_1, L6_1)
  if L3_1 then
    L3_1 = mp
    L3_1 = L3_1.set_mpattribute
    L4_1 = "BM_WebServerFileDrop"
    L3_1(L4_1)
    L3_1 = mp
    L3_1 = L3_1.INFECTED
    return L3_1
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
