local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1, L45_1, L46_1, L47_1
L0_1 = false
L1_1 = this_sigattrlog
L1_1 = L1_1[4]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[4]
  L1_1 = L1_1.utf8p2
end
if not L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.match
L3_1 = L1_1
L4_1 = "Uri=([^;]+)"
L2_1 = L2_1(L3_1, L4_1)
if not L2_1 then
  L3_1 = string
  L3_1 = L3_1.match
  L4_1 = L1_1
  L5_1 = "DestIp=([^;]*);"
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 then
    L4_1 = isPublicIP
    L5_1 = L3_1
    L4_1 = L4_1(L5_1)
    if L4_1 then
      goto lbl_37
    end
  end
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  do return L4_1 end
  ::lbl_37::
  L0_1 = true
end
L4_1 = L2_1
L3_1 = L2_1.find
L5_1 = "%."
L3_1 = L3_1(L4_1, L5_1)
if not L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = {}
L4_1 = "helios.aas.its.nja.dk"
L5_1 = "it-news.grundfos.com"
L6_1 = "usatlnew04.na.ko.com"
L7_1 = "ocsinventory-ng.yageo.local"
L8_1 = "bcuinternet.cymru.nhs.uk"
L9_1 = "amsterdam"
L10_1 = "phx11-scodb-001.paypalcorp.com"
L11_1 = "mbase.got.volvocars.net"
L12_1 = "10.186.232.60"
L13_1 = "10.204.210.139"
L14_1 = "webdav2.kowa.co.jp"
L15_1 = "scopeweb.spnet.local"
L16_1 = "sewm0m001018.con-02.emea.dc.corpintra.net"
L17_1 = "dataapi.appservice.ctc01.optum.com"
L18_1 = "raw.githubusercontent.com"
L19_1 = "health.1cloudhub.com"
L20_1 = "dirresponder.bmwgroup.net"
L21_1 = "10.99.211.109"
L22_1 = "sw.symcb.com"
L23_1 = "nausp-wapp0467.aceins.com"
L24_1 = "codvwpwebits01"
L25_1 = "srv1.sam360.com"
L26_1 = "wmp.wmpad.local"
L27_1 = "webservices01"
L28_1 = "pdm.sas.local"
L29_1 = "soewebservices.rtdomau.local"
L30_1 = "symcb.com"
L31_1 = "toyota.com"
L32_1 = "optum.com"
L33_1 = "francetelecom.fr"
L34_1 = "copfs.gsi.gov.uk"
L35_1 = "wtmsptsv.jpower.local"
L36_1 = "crl2.ame.gbl"
L37_1 = "lw-tnet-ttk-02"
L38_1 = "itc.fsoft.com.vn"
L39_1 = "soefieldreports.rtdomau.local"
L40_1 = "cwhtrusttalk"
L41_1 = "cp-ap.int.vertivco.com"
L42_1 = "platman.intranet.barcapint.com"
L43_1 = "itsdc.normagroup.com"
L44_1 = "amerix.csdhr.qc.ca"
L45_1 = "ruhfw-01.ruh-bath.nhs.uk"
L46_1 = "bwp-vmw-p-smw01.bolton.gov.uk"
L47_1 = "logonbanner.webapp.derbyshire.local"
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
L3_1[30] = L33_1
L3_1[31] = L34_1
L3_1[32] = L35_1
L3_1[33] = L36_1
L3_1[34] = L37_1
L3_1[35] = L38_1
L3_1[36] = L39_1
L3_1[37] = L40_1
L3_1[38] = L41_1
L3_1[39] = L42_1
L3_1[40] = L43_1
L3_1[41] = L44_1
L3_1[42] = L45_1
L3_1[43] = L46_1
L3_1[44] = L47_1
L4_1 = contains
L5_1 = L2_1
L6_1 = L3_1
L4_1 = L4_1(L5_1, L6_1)
if L4_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = {}
L4_1.SIG_CONTEXT = "SCRIPTDOWN"
L4_1.CONTENT_SOURCE = "BM"
L4_1.TAG = "INTERFLOW"
if not L0_1 then
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L2_1
  L7_1 = "%."
  L5_1 = L5_1(L6_1, L7_1)
  if not L5_1 then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
  L5_1 = mp
  L5_1 = L5_1.CheckUrl
  L6_1 = L2_1
  L5_1, L6_1 = L5_1(L6_1)
  if L5_1 == 1 and L6_1 == 1 then
    L7_1 = mp
    L7_1 = L7_1.CLEAN
    return L7_1
  end
end
L5_1 = SafeGetUrlReputation
L6_1 = {}
L7_1 = L2_1
L6_1[1] = L7_1
L7_1 = L4_1
L8_1 = false
L9_1 = 2000
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
L6_1 = L5_1.urls
L6_1 = L6_1[L2_1]
if L6_1 then
  L6_1 = L5_1.urls
  L6_1 = L6_1[L2_1]
  L6_1 = L6_1.determination
  if L6_1 == 2 then
    L6_1 = L5_1.urls
    L6_1 = L6_1[L2_1]
    L6_1 = L6_1.confidence
    if 60 <= L6_1 then
      L6_1 = mp
      L6_1 = L6_1.INFECTED
      return L6_1
    end
  end
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
