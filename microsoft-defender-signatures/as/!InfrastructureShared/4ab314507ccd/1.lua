local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = {}
L1_1 = "anydesk"
L2_1 = "SoftyPlanning"
L3_1 = "OverSolutionHelpDesk.exe"
L4_1 = "qwepesk.exe"
L5_1 = "soporte remoto"
L6_1 = "\\synaptics.exe"
L7_1 = "implemo_dostep_zdalny.exe"
L8_1 = "cgm_remote_support.exe"
L0_1[1] = L1_1
L0_1[2] = L2_1
L0_1[3] = L3_1
L0_1[4] = L4_1
L0_1[5] = L5_1
L0_1[6] = L6_1
L0_1[7] = L7_1
L0_1[8] = L8_1
L1_1 = contains
L2_1 = bm
L2_1 = L2_1.get_imagepath
L2_1 = L2_1()
L3_1 = L0_1
L1_1 = L1_1(L2_1, L3_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = reportSessionInformation
L1_1()
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
