local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1, L45_1, L46_1, L47_1, L48_1, L49_1, L50_1, L51_1, L52_1, L53_1, L54_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = nri
L1_1 = L1_1.GetURI
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1, L45_1, L46_1, L47_1, L48_1, L49_1, L50_1, L51_1, L52_1, L53_1, L54_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1, L45_1, L46_1, L47_1, L48_1, L49_1, L50_1, L51_1, L52_1, L53_1, L54_1)
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = nil
L2_1 = nil
L3_1 = this_sigattrlog
L3_1 = L3_1[2]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[2]
  L3_1 = L3_1.utf8p1
  if L3_1 ~= nil then
    L3_1 = string
    L3_1 = L3_1.lower
    L4_1 = this_sigattrlog
    L4_1 = L4_1[2]
    L4_1 = L4_1.utf8p1
    L3_1 = L3_1(L4_1)
    L1_1 = L3_1
    L3_1 = string
    L3_1 = L3_1.lower
    L4_1 = this_sigattrlog
    L4_1 = L4_1[2]
    L4_1 = L4_1.utf8p2
    L3_1 = L3_1(L4_1)
    L2_1 = L3_1
end
else
  L3_1 = this_sigattrlog
  L3_1 = L3_1[3]
  L3_1 = L3_1.matched
  if L3_1 then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[3]
    L3_1 = L3_1.utf8p1
    if L3_1 ~= nil then
      L3_1 = string
      L3_1 = L3_1.lower
      L4_1 = this_sigattrlog
      L4_1 = L4_1[3]
      L4_1 = L4_1.utf8p1
      L3_1 = L3_1(L4_1)
      L1_1 = L3_1
      L3_1 = string
      L3_1 = L3_1.lower
      L4_1 = this_sigattrlog
      L4_1 = L4_1[3]
      L4_1 = L4_1.utf8p2
      L3_1 = L3_1(L4_1)
      L2_1 = L3_1
    end
  end
end
L4_1 = L0_1
L3_1 = L0_1.match
L5_1 = "(%d+%.%d+%.%d+%.%d+)"
L3_1 = L3_1(L4_1, L5_1)
if L3_1 then
  L4_1 = isPublicIP
  L5_1 = L3_1
  L4_1 = L4_1(L5_1)
  if not L4_1 then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
end
L4_1 = {}
L5_1 = ".microsoft.com"
L6_1 = "www.teramind.co"
L7_1 = "gateways.workmeter.com"
L8_1 = "opendns.com"
L9_1 = "banyunjuhe.com"
L10_1 = "funshion.com"
L11_1 = "client-log.box.com"
L12_1 = "apps.h1.se"
L13_1 = "microsoftonline.com"
L14_1 = "login.live.com"
L15_1 = ".visualstudio.com"
L16_1 = "oceanbites123.com"
L17_1 = "vivo.com.cn"
L18_1 = "epicgames.dev"
L19_1 = ".infineon.com"
L20_1 = ".kuaishou.com"
L21_1 = ".qualcomm.com"
L22_1 = "cyberhaven.io"
L23_1 = "xcelenergy.com"
L24_1 = "trihealth.com"
L25_1 = "paypalcorp.com"
L26_1 = "vyaire.com"
L27_1 = "atera.com"
L28_1 = "rds.penc.local"
L29_1 = "mixpanel.com"
L30_1 = "jumpcloud.com"
L31_1 = "datadoghq.com"
L32_1 = "cymru.nhs.uk"
L33_1 = "remoteapp.sihm.fr"
L34_1 = "morphisec.cloud"
L35_1 = "smartbear.com"
L36_1 = "g.ceipmsn.com"
L37_1 = "apps.kan-therm.com"
L38_1 = "cdn-ali.joyfartech.com"
L39_1 = "aclm.external.hp.com"
L40_1 = "rds.riksbyggen.se"
L41_1 = "api.getquickpass.com"
L42_1 = "tei.e-infra.app"
L43_1 = "api-v3.screenmeet.com"
L44_1 = "us3.app.liongard.com"
L45_1 = "spdyn.wps.cn"
L46_1 = "api.segment.io"
L47_1 = "apm.2-4-8.jp"
L48_1 = "ls-service.mw-rmm.barracudamsp.com"
L49_1 = "s.joyfartech.com"
L50_1 = "api.sli.do"
L51_1 = "rdsat.riksbyggen.se"
L52_1 = "bebetei.e-infra.app"
L53_1 = "www.googletagmanager.com"
L54_1 = "eu1.app.liongard.com"
L4_1[1] = L5_1
L4_1[2] = L6_1
L4_1[3] = L7_1
L4_1[4] = L8_1
L4_1[5] = L9_1
L4_1[6] = L10_1
L4_1[7] = L11_1
L4_1[8] = L12_1
L4_1[9] = L13_1
L4_1[10] = L14_1
L4_1[11] = L15_1
L4_1[12] = L16_1
L4_1[13] = L17_1
L4_1[14] = L18_1
L4_1[15] = L19_1
L4_1[16] = L20_1
L4_1[17] = L21_1
L4_1[18] = L22_1
L4_1[19] = L23_1
L4_1[20] = L24_1
L4_1[21] = L25_1
L4_1[22] = L26_1
L4_1[23] = L27_1
L4_1[24] = L28_1
L4_1[25] = L29_1
L4_1[26] = L30_1
L4_1[27] = L31_1
L4_1[28] = L32_1
L4_1[29] = L33_1
L4_1[30] = L34_1
L4_1[31] = L35_1
L4_1[32] = L36_1
L4_1[33] = L37_1
L4_1[34] = L38_1
L4_1[35] = L39_1
L4_1[36] = L40_1
L4_1[37] = L41_1
L4_1[38] = L42_1
L4_1[39] = L43_1
L4_1[40] = L44_1
L4_1[41] = L45_1
L4_1[42] = L46_1
L4_1[43] = L47_1
L4_1[44] = L48_1
L4_1[45] = L49_1
L4_1[46] = L50_1
L4_1[47] = L51_1
L4_1[48] = L52_1
L4_1[49] = L53_1
L4_1[50] = L54_1
L5_1 = "google-ie8-activities.googlecode.com"
L6_1 = "pg-miniskin.joyfartech.com"
L7_1 = "uk1.app.liongard.com"
L8_1 = "api.feedback.us.pendo.io"
L9_1 = "data.pendo.io"
L10_1 = "cdn.pendo.io"
L4_1[51] = L5_1
L4_1[52] = L6_1
L4_1[53] = L7_1
L4_1[54] = L8_1
L4_1[55] = L9_1
L4_1[56] = L10_1
L5_1 = contains
L6_1 = L0_1
L7_1 = L4_1
L5_1 = L5_1(L6_1, L7_1)
if L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = {}
L6_1 = "wscript.exe"
L7_1 = "cscript.exe"
L8_1 = "powershell.exe"
L9_1 = "mshat.exe"
L10_1 = "pwsh.exe"
L11_1 = "java.exe"
L12_1 = "msiexec.exe"
L13_1 = "wabmig.exe"
L14_1 = "winword.exe"
L15_1 = "excel.exe"
L16_1 = "powerpnt.exe"
L17_1 = "cmd.exe"
L18_1 = "wmiprvse.exe"
L19_1 = "vbc.exe"
L20_1 = "msbuild.exe"
L21_1 = "wmic.exe"
L22_1 = "cmstp.exe"
L23_1 = "regasm.exe"
L24_1 = "installutil.exe"
L25_1 = "regsvcs.exe"
L26_1 = "msxsl.exe"
L27_1 = "csc.exe"
L5_1[1] = L6_1
L5_1[2] = L7_1
L5_1[3] = L8_1
L5_1[4] = L9_1
L5_1[5] = L10_1
L5_1[6] = L11_1
L5_1[7] = L12_1
L5_1[8] = L13_1
L5_1[9] = L14_1
L5_1[10] = L15_1
L5_1[11] = L16_1
L5_1[12] = L17_1
L5_1[13] = L18_1
L5_1[14] = L19_1
L5_1[15] = L20_1
L5_1[16] = L21_1
L5_1[17] = L22_1
L5_1[18] = L23_1
L5_1[19] = L24_1
L5_1[20] = L25_1
L5_1[21] = L26_1
L5_1[22] = L27_1
L6_1 = IsProcNameInParentProcessTree
L7_1 = L2_1
L8_1 = L5_1
L6_1 = L6_1(L7_1, L8_1)
if not L6_1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = {}
L6_1.SIG_CONTEXT = "DLL_LOAD"
L6_1.CONTENT_SOURCE = "BM"
L6_1.PROCESS_CONTEXT = L1_1
L6_1.FILELESS = "true"
L6_1.CMDLINE_URL = "false"
L6_1.TAG = "INTERFLOW"
L7_1 = string
L7_1 = L7_1.find
L8_1 = L0_1
L9_1 = "%."
L7_1 = L7_1(L8_1, L9_1)
if not L7_1 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = mp
L7_1 = L7_1.CheckUrl
L8_1 = L0_1
L7_1, L8_1 = L7_1(L8_1)
if L7_1 == 1 and L8_1 == 1 then
  L9_1 = mp
  L9_1 = L9_1.CLEAN
  return L9_1
end
L9_1 = SafeGetUrlReputation
L10_1 = {}
L11_1 = L0_1
L10_1[1] = L11_1
L11_1 = L6_1
L12_1 = false
L13_1 = 2000
L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
L10_1 = L9_1.urls
L10_1 = L10_1[L0_1]
if L10_1 then
  L10_1 = L9_1.urls
  L10_1 = L10_1[L0_1]
  L10_1 = L10_1.determination
  if L10_1 == 2 then
    L10_1 = L9_1.urls
    L10_1 = L10_1[L0_1]
    L10_1 = L10_1.confidence
    if 60 <= L10_1 then
      L10_1 = mp
      L10_1 = L10_1.INFECTED
      return L10_1
    end
  end
end
L10_1 = mp
L10_1 = L10_1.CLEAN
return L10_1
