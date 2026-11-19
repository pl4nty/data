-- Threat: !InfrastructureShared
-- Name: 734108badd74
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper, TechniqueTracker

local l_0_0 = string.lower(nri.GetURI())
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1, l_0_2
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_1 = string.lower(this_sigattrlog[2].utf8p1)
  l_0_2 = string.lower(this_sigattrlog[2].utf8p2)
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p1 ~= nil then
  l_0_1 = string.lower(this_sigattrlog[3].utf8p1)
  l_0_2 = string.lower(this_sigattrlog[3].utf8p2)
end
local l_0_3 = l_0_0:match("(%d+%.%d+%.%d+%.%d+)")
if l_0_3 and not isPublicIP(l_0_3) then
  return mp.CLEAN
end
local l_0_4 = {
  ".microsoft.com",
  "www.teramind.co",
  "gateways.workmeter.com",
  "opendns.com",
  "banyunjuhe.com",
  "funshion.com",
  "client-log.box.com",
  "apps.h1.se",
  "microsoftonline.com",
  "login.live.com",
  ".visualstudio.com",
  "oceanbites123.com",
  "vivo.com.cn",
  "epicgames.dev",
  ".infineon.com",
  ".kuaishou.com",
  ".qualcomm.com",
  "cyberhaven.io",
  "xcelenergy.com",
  "trihealth.com",
  "paypalcorp.com",
  "vyaire.com",
  "atera.com",
  "rds.penc.local",
  "mixpanel.com",
  "jumpcloud.com",
  "datadoghq.com",
  "cymru.nhs.uk",
  "remoteapp.sihm.fr",
  "morphisec.cloud",
  "smartbear.com",
  "g.ceipmsn.com",
  "apps.kan-therm.com",
  "cdn-ali.joyfartech.com",
  "aclm.external.hp.com",
  "rds.riksbyggen.se",
  "api.getquickpass.com",
  "tei.e-infra.app",
  "api-v3.screenmeet.com",
  "us3.app.liongard.com",
  "spdyn.wps.cn",
  "api.segment.io",
  "apm.2-4-8.jp",
  "ls-service.mw-rmm.barracudamsp.com",
  "s.joyfartech.com",
  "api.sli.do",
  "rdsat.riksbyggen.se",
  "bebetei.e-infra.app",
  "www.googletagmanager.com",
  "eu1.app.liongard.com",
  "google-ie8-activities.googlecode.com",
  "pg-miniskin.joyfartech.com",
  "uk1.app.liongard.com",
  "api.feedback.us.pendo.io",
  "data.pendo.io",
  "cdn.pendo.io"
}
if contains(l_0_0, l_0_4) then
  return mp.CLEAN
end
local l_0_5 = {
  "wscript.exe",
  "cscript.exe",
  "powershell.exe",
  "mshat.exe",
  "pwsh.exe",
  "java.exe",
  "msiexec.exe",
  "wabmig.exe",
  "winword.exe",
  "excel.exe",
  "powerpnt.exe",
  "cmd.exe",
  "wmiprvse.exe",
  "vbc.exe",
  "msbuild.exe",
  "wmic.exe",
  "cmstp.exe",
  "regasm.exe",
  "installutil.exe",
  "regsvcs.exe",
  "msxsl.exe",
  "csc.exe"
}
if not IsProcNameInParentProcessTree(l_0_2, l_0_5) then
  return mp.CLEAN
end
local l_0_6 = {}
l_0_6.SIG_CONTEXT = "DLL_LOAD"
l_0_6.CONTENT_SOURCE = "BM"
l_0_6.PROCESS_CONTEXT = l_0_1
l_0_6.FILELESS = "true"
l_0_6.CMDLINE_URL = "false"
l_0_6.TAG = "INTERFLOW"
if not string.find(l_0_0, "%.") then
  return mp.CLEAN
end
local l_0_7, l_0_8 = mp.CheckUrl(l_0_0)
if l_0_7 == 1 and l_0_8 == 1 then
  return mp.CLEAN
end
local l_0_9 = SafeGetUrlReputation({l_0_0}, l_0_6, false, 2000)
if l_0_9.urls[l_0_0] and l_0_9.urls[l_0_0].determination == 2 and l_0_9.urls[l_0_0].confidence >= 60 then
  return mp.INFECTED
end
return mp.CLEAN
