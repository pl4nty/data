local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1
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
L1_1 = {}
L2_1 = "execute remote test passed"
L3_1 = "psscript_output_"
L4_1 = "cloudamize_host_share"
L5_1 = "instance-identity"
L6_1 = "import-module hyper-v"
L7_1 = "applicationhost.config"
L8_1 = "iaa7acaacgbhaguadaatafcaaqbuaeua"
L9_1 = "cgbjag4adgbvagsazqatafiazqbzahqatqblahqaaabvagq"
L10_1 = "collectomsagentstatus"
L11_1 = "temp\\nessus_"
L12_1 = "audit_windows.vbs"
L13_1 = "epascanner64.cab"
L14_1 = "hidetableheaders"
L15_1 = "usb insert.ps1"
L16_1 = "execute remote test passed"
L17_1 = "writedellwarranty"
L18_1 = "conda.bat"
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
L1_1[11] = L12_1
L1_1[12] = L13_1
L1_1[13] = L14_1
L1_1[14] = L15_1
L1_1[15] = L16_1
L1_1[16] = L17_1
L1_1[17] = L18_1
L2_1 = contains
L3_1 = L0_1
L4_1 = L1_1
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = contains
L3_1 = L0_1
L4_1 = "cmd.*/c"
L5_1 = false
L2_1 = L2_1(L3_1, L4_1, L5_1)
if L2_1 then
  L2_1 = contains
  L3_1 = L0_1
  L4_1 = {}
  L5_1 = " powershell"
  L4_1[1] = L5_1
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 then
    L2_1 = bm
    L2_1 = L2_1.add_related_string
    L3_1 = "WmiprvseRemoteProc"
    L4_1 = L0_1
    L5_1 = bm
    L5_1 = L5_1.RelatedStringBMReport
    L2_1(L3_1, L4_1, L5_1)
    L2_1 = reportSessionInformation
    L2_1()
    L2_1 = add_parents
    L2_1()
    L2_1 = mp
    L2_1 = L2_1.INFECTED
    return L2_1
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
