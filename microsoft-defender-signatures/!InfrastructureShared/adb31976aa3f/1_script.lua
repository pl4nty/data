-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\adb31976aa3f\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = false
do
  if (this_sigattrlog[4]).matched then
    local l_0_1, l_0_2, l_0_3 = (this_sigattrlog[4]).utf8p2
  end
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R1 in 'UnsetPending'

  if not l_0_1 then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC16: Confused about usage of register: R1 in 'UnsetPending'

  local l_0_4 = nil
  do
    if not (string.match)(l_0_1, "Uri=([^;]+)") then
      local l_0_5 = nil
      if not (string.match)(l_0_4, "DestIp=([^;]*);") or not isPublicIP((string.match)(l_0_4, "DestIp=([^;]*);")) then
        return mp.CLEAN
      end
      l_0_0 = true
    end
    -- DECOMPILER ERROR at PC37: Confused about usage of register: R2 in 'UnsetPending'

    if not l_0_5:find("%.") then
      return mp.CLEAN
    end
    local l_0_6 = nil
    if contains(l_0_6, {"helios.aas.its.nja.dk", "it-news.grundfos.com", "usatlnew04.na.ko.com", "ocsinventory-ng.yageo.local", "bcuinternet.cymru.nhs.uk", "amsterdam", "phx11-scodb-001.paypalcorp.com", "mbase.got.volvocars.net", "10.186.232.60", "10.204.210.139", "webdav2.kowa.co.jp", "scopeweb.spnet.local", "sewm0m001018.con-02.emea.dc.corpintra.net", "dataapi.appservice.ctc01.optum.com", "raw.githubusercontent.com", "health.1cloudhub.com", "dirresponder.bmwgroup.net", "10.99.211.109", "sw.symcb.com", "nausp-wapp0467.aceins.com", "codvwpwebits01", "srv1.sam360.com", "wmp.wmpad.local", "webservices01", "pdm.sas.local", "soewebservices.rtdomau.local", "symcb.com", "toyota.com", "optum.com", "francetelecom.fr", "copfs.gsi.gov.uk", "wtmsptsv.jpower.local", "crl2.ame.gbl", "lw-tnet-ttk-02", "itc.fsoft.com.vn", "soefieldreports.rtdomau.local", "cwhtrusttalk", "cp-ap.int.vertivco.com", "platman.intranet.barcapint.com", "itsdc.normagroup.com", "amerix.csdhr.qc.ca", "ruhfw-01.ruh-bath.nhs.uk", "bwp-vmw-p-smw01.bolton.gov.uk", "logonbanner.webapp.derbyshire.local"}) then
      return mp.CLEAN
    end
    local l_0_7 = nil
    if not l_0_0 then
      if not (string.find)(l_0_6, "%.") then
        return mp.CLEAN
      end
      if (mp.CheckUrl)(l_0_6) == 1 and l_0_6 == 1 then
        return mp.CLEAN
      end
    end
    local l_0_8 = {SIG_CONTEXT = "SCRIPTDOWN", CONTENT_SOURCE = "BM", TAG = "INTERFLOW"}
    local l_0_9 = SafeGetUrlReputation
    l_0_9 = l_0_9({l_0_6}, l_0_8, false, 2000)
    if (l_0_9.urls)[l_0_6] and ((l_0_9.urls)[l_0_6]).determination == 2 and ((l_0_9.urls)[l_0_6]).confidence >= 60 then
      return mp.INFECTED
    end
    return mp.CLEAN
  end
end

