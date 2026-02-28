local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1
L0_1 = mp
L0_1 = L0_1.GetScannedPPID
L0_1 = L0_1()
if L0_1 == "" or L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.GetProcessCommandLine
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if not L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L1_1 = L2_1
L2_1 = {}
L3_1 = "clloud"
L4_1 = "veriffy"
L5_1 = "vcloudix.com"
L6_1 = "leaveannealoan.com"
L7_1 = "iftyworld.com"
L8_1 = ".ocfreestuff.com"
L9_1 = ".landersarena.com"
L10_1 = "clrverify.com"
L11_1 = "verikldx"
L12_1 = "unreadiness.pics"
L13_1 = "oswyka.com"
L14_1 = "vericloudone"
L15_1 = "anselber"
L16_1 = "vrfycloudx.com"
L17_1 = "veriqloudx.com"
L18_1 = "vericlyd.com"
L19_1 = "clouddverify"
L20_1 = "vericloudz.com"
L21_1 = "kerewz.com"
L22_1 = "cl-verify.com"
L23_1 = "fermigz.com"
L24_1 = "verify-clients"
L25_1 = "correioobjetotransportes.com"
L26_1 = "outspanned.mom"
L27_1 = "cl-verify.com"
L28_1 = "vf-files.com"
L29_1 = "solpendi.com"
L30_1 = "kopewv.com"
L31_1 = ".dewynterspromos.com"
L2_1[1] = L3_1
L2_1[2] = L4_1
L2_1[3] = L5_1
L2_1[4] = L6_1
L2_1[5] = L7_1
L2_1[6] = L8_1
L2_1[7] = L9_1
L2_1[8] = L10_1
L2_1[9] = L11_1
L2_1[10] = L12_1
L2_1[11] = L13_1
L2_1[12] = L14_1
L2_1[13] = L15_1
L2_1[14] = L16_1
L2_1[15] = L17_1
L2_1[16] = L18_1
L2_1[17] = L19_1
L2_1[18] = L20_1
L2_1[19] = L21_1
L2_1[20] = L22_1
L2_1[21] = L23_1
L2_1[22] = L24_1
L2_1[23] = L25_1
L2_1[24] = L26_1
L2_1[25] = L27_1
L2_1[26] = L28_1
L2_1[27] = L29_1
L2_1[28] = L30_1
L2_1[29] = L31_1
L3_1 = contains
L4_1 = L1_1
L5_1 = L2_1
L3_1 = L3_1(L4_1, L5_1)
if not L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
