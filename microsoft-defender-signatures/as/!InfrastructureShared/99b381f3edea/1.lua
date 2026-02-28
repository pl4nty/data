local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[1]
    L0_1 = L1_1.utf8p2
  end
end
L1_1 = #L0_1
if L1_1 < 62 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = contains
L2_1 = L0_1
L3_1 = {}
L4_1 = "powershell"
L5_1 = "rundll32"
L6_1 = "msiexec"
L7_1 = " mshta"
L8_1 = " bitsadmin"
L9_1 = "curl"
L10_1 = "e:jscript"
L11_1 = "conhost"
L12_1 = "control"
L13_1 = "regsvr32"
L14_1 = "wscript"
L15_1 = "cscript"
L16_1 = "javaws"
L17_1 = "wmic"
L18_1 = "scriptrunner"
L19_1 = "certutil"
L20_1 = "echo"
L21_1 = "start"
L22_1 = "runas"
L23_1 = "appinstaller"
L24_1 = "hh"
L25_1 = "ieexec"
L26_1 = "installutil"
L27_1 = "rpcping"
L28_1 = "defaultpack"
L29_1 = "msxsl"
L30_1 = "squirrel"
L31_1 = "update"
L32_1 = "winrm"
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L3_1[4] = L7_1
L3_1[5] = L8_1
L3_1[6] = L9_1
L3_1[7] = L10_1
L3_1[8] = L11_1
L3_1[9] = L12_1
L3_1[10] = L13_1
L3_1[11] = L14_1
L3_1[12] = L15_1
L3_1[13] = L16_1
L3_1[14] = L17_1
L3_1[15] = L18_1
L3_1[16] = L19_1
L3_1[17] = L20_1
L3_1[18] = L21_1
L3_1[19] = L22_1
L3_1[20] = L23_1
L3_1[21] = L24_1
L3_1[22] = L25_1
L3_1[23] = L26_1
L3_1[24] = L27_1
L3_1[25] = L28_1
L3_1[26] = L29_1
L3_1[27] = L30_1
L3_1[28] = L31_1
L3_1[29] = L32_1
L1_1 = L1_1(L2_1, L3_1)
if L1_1 then
  L1_1 = bm
  L1_1 = L1_1.add_related_string
  L2_1 = "RegRunMRU"
  L3_1 = tostring
  L4_1 = L0_1
  L3_1 = L3_1(L4_1)
  L4_1 = bm
  L4_1 = L4_1.RelatedStringBMReport
  L1_1(L2_1, L3_1, L4_1)
  L1_1 = reportSessionInformation
  L1_1()
  L1_1 = add_parents
  L1_1()
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
