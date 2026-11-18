-- Threat: !InfrastructureShared
-- Name: 2f3b397beb35f
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0 = 7
local l_0_1 = "massservicestop"
local l_0_2 = "massservicestop_score"
local l_0_3 = ""
local l_0_4 = {}
local l_0_5
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_5 = this_sigattrlog[1].utf8p2
end
local l_0_6 = {
  "sophosstopservices.bat",
  "\\syncro\\",
  "sophosremoval.ps1",
  "\\programdata\\amagent\\",
  "microsoft intune management extension",
  "smstspowershellscripts",
  "sophos_removal.bat"
}
if contains(l_0_5, l_0_6) then
  return mp.CLEAN
end
if this_sigattrlog[2].matched then
  l_0_3 = this_sigattrlog[2].utf8p2
  l_0_4[#l_0_4 + 1] = l_0_3:match("stop ([^%s]+)")
elseif this_sigattrlog[3].matched then
  l_0_3 = this_sigattrlog[3].utf8p2
  l_0_4[#l_0_4 + 1] = l_0_3:match("pause ([^%s]+)")
elseif this_sigattrlog[4].matched then
  l_0_3 = this_sigattrlog[4].utf8p2
  l_0_4[#l_0_4 + 1] = l_0_3:match("stop ([^%s]+)")
elseif this_sigattrlog[5].matched then
  l_0_3 = this_sigattrlog[5].utf8p2
  l_0_4[#l_0_4 + 1] = l_0_3:match("delete ([^%s]+)")
elseif this_sigattrlog[7].matched then
  l_0_3 = this_sigattrlog[7].utf8p2
  l_0_4[#l_0_4 + 1] = l_0_3:match("/im ([^%s]+)")
elseif this_sigattrlog[8].matched then
  l_0_3 = this_sigattrlog[8].utf8p2
  l_0_4[#l_0_4 + 1] = l_0_3:match("-im ([^%s]+)")
elseif this_sigattrlog[6].matched then
  l_0_3 = this_sigattrlog[6].utf8p2
  local l_0_7 = string.match(l_0_3, "ame%s-([^%-%/]+)%s-[%-%/]")
  if string.find(l_0_7, ",", 1, true) then
    l_0_7 = string.gsub(l_0_7, " ", "")
    for l_0_8, l_0_9 in ipairs(split(l_0_7, ",")) do
      l_0_4[#l_0_4 + 1] = l_0_9
    end
  end
elseif this_sigattrlog[9].matched then
  l_0_3 = this_sigattrlog[9].utf8p2
  l_0_4[#l_0_4 + 1] = l_0_3:match("uninstall ([^%s]+)")
elseif this_sigattrlog[10].matched then
  l_0_3 = this_sigattrlog[10].utf8p2
  l_0_4[#l_0_4 + 1] = l_0_3:match("%%(.*)%%")
elseif this_sigattrlog[11].matched then
  l_0_3 = this_sigattrlog[11].utf8p2
  l_0_4[#l_0_4 + 1] = l_0_3:match("set-service ([^%s]+)")
elseif this_sigattrlog[12].matched then
  l_0_3 = this_sigattrlog[12].utf8p2
  l_0_4[#l_0_4 + 1] = l_0_3:match("%%(.*)%%")
end
local l_0_10 = {
  "sql backups",
  "sqlsafe backup service",
  "sqlsafe filter service",
  "mssql$veeamsql2008r2",
  "sqlagent$veeamsql2008r2",
  "sqlwriter",
  "sms_site_sql_backup",
  "msdtsserver",
  "msdtsserver100",
  "msdtsserver110",
  "msdtsserver130",
  "msftesql$prod",
  "msolap$sql_2008",
  "msolap$system_bgc",
  "msolap$tps",
  "msolap$tpsama",
  "mssql$bkupexec",
  "mssql$ecwdb2",
  "mssql$practicemgt",
  "mssql$practticebgc",
  "mssql$prod",
  "mssql$profxengagement",
  "mssql$sbsmonitoring",
  "mssql$sharepoint",
  "mssql$sql_2008",
  "mssql$sqlexpress",
  "mssql$system_bgc",
  "mssql$tps",
  "mssql$tpsama",
  "mssql$veeamsql2008r2",
  "mssql$veeamsql2012",
  "msftesql$sqlexpress",
  "msolap$citrix",
  "mssql$citrix",
  "mssql$isars",
  "mssql$microsoft##wid",
  "mssql$msfw",
  "mssql$optima",
  "mssql$progid",
  "mssql$sqlexpress2014",
  "mssql$veeamsql2016",
  "mssql$wolterskluwer",
  "mssqlfdlauncher$citrix",
  "mssqlfdlauncher$optima",
  "mssql",
  "mssqlfdlauncher",
  "mssqlfdlauncher$profxengagement",
  "mssqlfdlauncher$sbsmonitoring",
  "mssqlfdlauncher$sharepoint",
  "mssqlfdlauncher$sql_2008",
  "mssqlfdlauncher$system_bgc",
  "mssqlfdlauncher$tps",
  "mssqlfdlauncher$tpsama",
  "mssqlserver",
  "mssqlserveradhelper",
  "mssqlserveradhelper100",
  "mssqlserverolapservice",
  "mysql57",
  "mysql80",
  "sqlagent",
  "sqlagent$bkupexec",
  "sqlagent$citrix_metaframe",
  "sqlagent$cxdb",
  "sqlagent$ecwdb2",
  "sqlagent$isars",
  "sqlagent$msfw",
  "sqlagent$optima",
  "sqlagent$practticebgc",
  "sqlagent$practticemgt",
  "sqlagent$prod",
  "sqlagent$progid",
  "sqlagent$profxengagement",
  "sqlagent$sbsmonitoring",
  "sqlagent$sharepoint",
  "sqlagent$sql_2008",
  "sqlagent$sqlexpress",
  "sqlagent$system_bgc",
  "sqlagent$tps",
  "sqlagent$tpsama",
  "sqlagent$veeamsql2008r2",
  "sqlagent$veeamsql2012",
  "sqlagent$wolterskluwer",
  "sqlbrowser",
  "sqlsafeolrservice",
  "sqlserveragent",
  "sqltelemetry",
  "sqltelemetry$bvms",
  "sqltelemetry$ecwdb2",
  "sqltelemetry$hl",
  "sqltelemetry$sdpro_v4_sql",
  "sqltelemetry$veeamsql2016",
  "mssql$vim_sqlexp",
  "postgresql-9.5",
  "postgresql-x64-9.4",
  "reportserver$v4sqlexpress",
  "sagemysql",
  "reportserver$sql_2008",
  "mssql$sophos",
  "sqlagent$soph",
  "isqlplussvc.exe",
  "msftesql.exe",
  "mysqld-nt.exe",
  "mysqld-opt.exe",
  "mysqld.exe",
  "sqlagent.exe",
  "sqlbrowser.exe",
  "sqlservr.exe",
  "sqlceip.exe",
  "sqlwriter.exe",
  "sql"
}
local l_0_11 = {
  "avg antivirus",
  "avgadminclient",
  "avgadminserver",
  "avp18.0.0",
  "symantec system recovery",
  "windefend",
  "wmms",
  "wbengine",
  "wbengine",
  "nanoservicemain",
  "nvspwmi",
  "ofcservice",
  "online protection system",
  "pandaaetheragent",
  "pccntupd",
  "psuaservice",
  "qbcfmonitorservice",
  "qbposdbservicev12",
  "qbvss",
  "swc_service",
  "swi_filter",
  "swi_service",
  "swi_update",
  "tmbmserver",
  "tmfilter",
  "tmicrcscanservice",
  "tmlwcsservice",
  "tmpfw",
  "tmprefilter",
  "tmproxy",
  "tmsmartrelayservice",
  "sophos agent",
  "sophos autoupdate service",
  "sophos clean service",
  "sophos device control service",
  "sophos endpoint defense service",
  "sophos file scanner service",
  "sophos health service",
  "sophos mcs agent",
  "sophos mcs client",
  "sophos message router",
  "sophos safestore service",
  "sophos system protection service",
  "sophos ui",
  "sophos web control service",
  "sophosfim",
  "spadminv4",
  "spsearch4",
  "sptimerv4",
  "sptracev4",
  "spusercodev4",
  "spwriterv4",
  "acronisagent",
  "antivirus",
  "avp",
  "dcagent",
  "ehttpsrv",
  "ekrn",
  "ekrnepsw",
  "epintegrationservice",
  "epprotectedservice",
  "epredline",
  "epsecurityservice",
  "epupdateservice",
  "esgshkernel",
  "eshasrv",
  "fa_scheduler",
  "firebirdguardiandefaultinstance",
  "firebirdserverdefaultinstance",
  "fsaus",
  "sdevcon",
  "fshoster",
  "fsms",
  "fsnethoster",
  "fsulhoster",
  "fsulnethoster",
  "fsulorsp",
  "fsulprothoster",
  "hmpalertsvc",
  "hvdsvc",
  "kavfs",
  "kavfsgt",
  "kavfsslp",
  "klnagent",
  "klbackupdisk",
  "klbackupflt",
  "klflt",
  "klhk",
  "klif",
  "klim6",
  "klkbdflt",
  "klmouflt",
  "klpd",
  "kltap",
  "ksde1.0.0",
  "macmnsvc",
  "masvc",
  "mbamservice",
  "mbendpointagent",
  "mcafeeengineservice",
  "mcafeeframework",
  "mcafeeframeworkmcafeeframework",
  "mcshield",
  "mctaskmanager",
  "mfefire",
  "mfemms",
  "mfevtp",
  "mr2kserv",
  "mssql$sophos",
  "sacsvr",
  "savadminservice",
  "savservice",
  "vapiendpoint",
  "savfmsesp.exe",
  "cntaosmgr.exe",
  "mbamtray.exe",
  "ntrtsc",
  "pccntmon.exe",
  "tmlisten.exe",
  "avastui.exe ",
  "avp.exe",
  "egui.exe",
  "fdhost.exe",
  "msdtssrvr.exe",
  "msmdsrv.exe",
  "msmpeng.exe",
  "security client",
  "malwarebytes",
  "trend micro",
  "bitdefender",
  "sophos",
  "symantec",
  "malware",
  "azure advanced threat protection",
  "endpoint"
}
local l_0_12 = {
  "veeamdeploysvc",
  "acronis vss provider",
  "core browsing protection",
  "core mail protection",
  "core scanning server",
  "core scanning serverex",
  "veeam backup catalog data service",
  "zoolz 2 service",
  "acrsch2svc",
  "arsm",
  "backupexecagentaccelerator",
  "backupexecagentbrowser",
  "backupexecdevicemediaservice",
  "backupexecjobengine",
  "backupexecmanagementservice",
  "backupexecrpcservice",
  "backupexecvssprovider",
  "bedbg",
  "mms",
  "mozyprobackup",
  "ntrtscan",
  "pdvfsservice",
  "sdrsvc",
  "snac",
  "veeamawssvc",
  "veeamazuresvc",
  "veeambackupcdpsvc",
  "veeambackuprestsvc",
  "veeambackupsvc",
  "veeambrokersvc",
  "veeamcatalogsvc",
  "veeamcloudsvc",
  "veeamdeploymentservice",
  "veeamdeploysvc",
  "veeamdistributionsvc",
  "veeamenterprisemanagersvc",
  "veeamexplorersrecoverysvc",
  "veeamfilesysvsssvc",
  "veeamgcpsvc",
  "veeamguesthelper",
  "veeamhvintegrationsvc",
  "veeammountsvc",
  "veeamnfssvc",
  "veeamrestsvc",
  "veeamtransportsvc",
  "veeamvssprovidersvc",
  "vmicguestinterface",
  "vmicheartbeat",
  "vmickvpexchange",
  "vmicrdv",
  "vmicshutdown",
  "vmictimesync",
  "vmicvss",
  "vsapint",
  "quick update service",
  "quickbooksdb1",
  "quickbooksdb2",
  "quickbooksdb3",
  "quickbooksdb4",
  "quickbooksdb5",
  "repairservice",
  "reportserver",
  "reportserver$isars",
  "reportserver$optima",
  "rpceptmapper",
  "sagemysql",
  "oracleclientcache80",
  "resvc",
  "ssistelemetry130",
  "storflt",
  "tmusa",
  "unifi",
  "iisadmin",
  "netmsmqactivator",
  "pop3svc",
  "sstpsvc",
  "ui0detect",
  "w3svc",
  "aphidmonitorservice",
  "intel(r) proset monitoring service",
  "unistoresvc_1af40a",
  "audioendpointbuilder",
  "msexchangees",
  "msexchangeis",
  "msexchangemgmt",
  "msexchangemta",
  "msexchangesa",
  "msexchangesrs",
  "msexchangeadtopology",
  "msexchangefba",
  "msexchangeimap4",
  "ibm domino diagnostics",
  "ibm domino server",
  "ibmiasrw",
  "imap4svc",
  "scsecsvc",
  "shadowprotectsvc",
  "simply accounting database connection manager",
  "sntpservice",
  "sepmasterservice",
  "shmonitor",
  "smcinst",
  "smcservice",
  "svcgenerichost",
  "tmccsf",
  "tmlisten",
  "truekey",
  "truekeyscheduler",
  "truekeyservicehel",
  "wrsvc",
  "sqbcoreservice.exe",
  "zoolz.exe",
  "firefoxconfig.exe",
  "tbirdconfig.exe",
  "thunderbird.exe",
  "agntsvc.exe",
  "dbeng50.exe",
  "dbsnmp.exe",
  "msaccess.exe",
  "mydesktopqos.exe",
  "mydesktopservice.exe",
  "ocautoupds.exe",
  "ocssd.exe",
  "oracle.exe",
  "synctime.exe",
  "thebat.exe",
  "microsoft",
  "microsoft exchange",
  "backup",
  "mongo",
  "core.service",
  "veeam",
  "networker"
}
local l_0_13 = 0
local l_0_14 = 0
local l_0_15 = 0
for l_0_16, l_0_17 in pairs(l_0_4) do
  l_0_17 = string.lower(l_0_17)
  if l_0_12[l_0_17] then
    l_0_13 = 1
  end
  if l_0_10[l_0_17] then
    l_0_14 = 2
  end
  if l_0_11[l_0_17] then
    l_0_15 = 3
  end
  if l_0_14 == 0 and l_0_15 == 0 and l_0_13 == 0 then
    return mp.CLEAN
  end
  local l_0_18 = MpCommon.QueryPersistContextNoPath(l_0_1, l_0_17)
  if not l_0_18 then
    local l_0_19 = l_0_14 + l_0_15 + l_0_13
    MpCommon.AppendPersistContextNoPath(l_0_1, l_0_17, 120)
    MpCommon.AppendPersistContextNoPath(l_0_2, l_0_19, 120)
  end
end
local l_0_20 = MpCommon.GetPersistContextCountNoPath(l_0_1)
local l_0_21 = MpCommon.GetPersistContextCountNoPath(l_0_2)
if l_0_0 < l_0_20 and l_0_21 > 10 then
  l_0_4 = table.concat(MpCommon.GetPersistContextNoPath(l_0_1), ";")
  bm.add_related_string("service_stop", l_0_4, bm.RelatedStringBMReport)
  MpCommon.SetPersistContextNoPath(l_0_1, {}, 1)
  return mp.INFECTED
end
return mp.CLEAN
