local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L1_1 = this_sigattrlog
L1_1 = L1_1[3]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[3]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[3]
    L1_1 = L1_1.utf8p2
    L2_1 = L1_1
    L1_1 = L1_1.lower
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1
  end
end
L1_1 = contains
L2_1 = L0_1
L3_1 = {}
L4_1 = "RestartHealthService.js"
L5_1 = "spiceworks_upload.vbs"
L6_1 = "MDRCrawler"
L7_1 = "checkservices.dll"
L8_1 = "SetupInfObjectInstallAction"
L9_1 = "InstallFonts.vbs"
L10_1 = "ClearCache.vbs"
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L3_1[4] = L7_1
L3_1[5] = L8_1
L3_1[6] = L9_1
L3_1[7] = L10_1
L1_1 = L1_1(L2_1, L3_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = contains
L2_1 = L0_1
L3_1 = "cmd.*/c"
L4_1 = false
L1_1 = L1_1(L2_1, L3_1, L4_1)
if L1_1 then
  L1_1 = contains
  L2_1 = L0_1
  L3_1 = {}
  L4_1 = " regsvr32"
  L5_1 = " rundll32"
  L6_1 = " mshta"
  L7_1 = " bitsadmin"
  L3_1[1] = L4_1
  L3_1[2] = L5_1
  L3_1[3] = L6_1
  L3_1[4] = L7_1
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 then
    L1_1 = reportSessionInformation
    L1_1()
    L1_1 = add_parents
    L1_1()
    L1_1 = mp
    L1_1 = L1_1.INFECTED
    return L1_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
