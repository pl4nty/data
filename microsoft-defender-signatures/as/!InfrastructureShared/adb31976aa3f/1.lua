-- Threat: !InfrastructureShared
-- Name: adb31976aa3f
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0 = false
local l_0_1 = this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = string.match(l_0_1, "Uri=([^;]+)")
if not l_0_2 then
  local l_0_3 = string.match(l_0_1, "DestIp=([^;]*);")
  if not l_0_3 or not isPublicIP(l_0_3) then
    return mp.CLEAN
  end
  l_0_0 = true
end
if not l_0_2:find("%.") then
  return mp.CLEAN
end
local l_0_4 = {
  "helios.aas.its.nja.dk",
  "it-news.grundfos.com",
  "usatlnew04.na.ko.com",
  "ocsinventory-ng.yageo.local",
  "bcuinternet.cymru.nhs.uk",
  "amsterdam",
  "phx11-scodb-001.paypalcorp.com",
  "mbase.got.volvocars.net",
  "10.186.232.60",
  "10.204.210.139",
  "webdav2.kowa.co.jp",
  "scopeweb.spnet.local",
  "sewm0m001018.con-02.emea.dc.corpintra.net",
  "dataapi.appservice.ctc01.optum.com",
  "raw.githubusercontent.com",
  "health.1cloudhub.com",
  "dirresponder.bmwgroup.net",
  "10.99.211.109",
  "sw.symcb.com",
  "nausp-wapp0467.aceins.com",
  "codvwpwebits01",
  "srv1.sam360.com",
  "wmp.wmpad.local",
  "webservices01",
  "pdm.sas.local",
  "soewebservices.rtdomau.local",
  "symcb.com",
  "toyota.com",
  "optum.com",
  "francetelecom.fr",
  "copfs.gsi.gov.uk",
  "wtmsptsv.jpower.local",
  "crl2.ame.gbl",
  "lw-tnet-ttk-02",
  "itc.fsoft.com.vn",
  "soefieldreports.rtdomau.local",
  "cwhtrusttalk",
  "cp-ap.int.vertivco.com",
  "platman.intranet.barcapint.com",
  "itsdc.normagroup.com",
  "amerix.csdhr.qc.ca",
  "ruhfw-01.ruh-bath.nhs.uk",
  "bwp-vmw-p-smw01.bolton.gov.uk",
  "logonbanner.webapp.derbyshire.local"
}
if contains(l_0_2, l_0_4) then
  return mp.CLEAN
end
local l_0_5 = {}
l_0_5.SIG_CONTEXT = "SCRIPTDOWN"
l_0_5.CONTENT_SOURCE = "BM"
l_0_5.TAG = "INTERFLOW"
if not l_0_0 then
  if not string.find(l_0_2, "%.") then
    return mp.CLEAN
  end
  local l_0_6, l_0_7 = mp.CheckUrl(l_0_2)
  if l_0_6 == 1 and l_0_7 == 1 then
    return mp.CLEAN
  end
end
local l_0_8 = SafeGetUrlReputation({l_0_2}, l_0_5, false, 2000)
if l_0_8.urls[l_0_2] and l_0_8.urls[l_0_2].determination == 2 and l_0_8.urls[l_0_2].confidence >= 60 then
  return mp.INFECTED
end
return mp.CLEAN
