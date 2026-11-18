-- Threat: !InfrastructureShared
-- Name: 71ab3ca76049f
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper, TechniqueTracker

if IsProcNameInParentProcessTree("BM", {
  "senseir.exe",
  "pangphip.exe",
  "agentexecutor.exe"
}) then
  return mp.CLEAN
end
local l_0_0, l_0_1
if this_sigattrlog[9].matched then
  l_0_0 = "Ipconfig"
  l_0_1 = this_sigattrlog[9]
elseif this_sigattrlog[10].matched then
  l_0_0 = "NetstatN"
  l_0_1 = this_sigattrlog[10]
elseif this_sigattrlog[11].matched then
  l_0_0 = "NetstatS"
  l_0_1 = this_sigattrlog[11]
elseif this_sigattrlog[12].matched then
  l_0_0 = "Arp"
  l_0_1 = this_sigattrlog[12]
elseif this_sigattrlog[13].matched then
  l_0_0 = "RoutePrint"
  l_0_1 = this_sigattrlog[13]
elseif this_sigattrlog[14].matched then
  l_0_0 = "QueryUser"
  l_0_1 = this_sigattrlog[14]
elseif this_sigattrlog[15].matched then
  l_0_0 = "Whoami"
  l_0_1 = this_sigattrlog[15]
elseif this_sigattrlog[16].matched then
  l_0_0 = "NetLocalgroup"
  l_0_1 = this_sigattrlog[16]
elseif this_sigattrlog[17].matched then
  l_0_0 = "NetGrpDomain"
  l_0_1 = this_sigattrlog[17]
elseif this_sigattrlog[18].matched then
  l_0_0 = "NetUsrDomain"
  l_0_1 = this_sigattrlog[18]
elseif this_sigattrlog[19].matched then
  l_0_0 = "NetUser"
  l_0_1 = this_sigattrlog[19]
elseif this_sigattrlog[20].matched then
  l_0_0 = "NetGroup"
  l_0_1 = this_sigattrlog[20]
elseif this_sigattrlog[21].matched then
  l_0_0 = "NetShare"
  l_0_1 = this_sigattrlog[21]
elseif this_sigattrlog[22].matched then
  l_0_0 = "NetView"
  l_0_1 = this_sigattrlog[22]
elseif this_sigattrlog[23].matched then
  l_0_0 = "NetAccounts"
  l_0_1 = this_sigattrlog[23]
elseif this_sigattrlog[24].matched then
  l_0_0 = "NetStat"
  l_0_1 = this_sigattrlog[24]
elseif this_sigattrlog[25].matched then
  l_0_0 = "NetFile"
  l_0_1 = this_sigattrlog[25]
elseif this_sigattrlog[26].matched then
  l_0_0 = "NetConfig"
  l_0_1 = this_sigattrlog[26]
elseif this_sigattrlog[27].matched then
  l_0_0 = "Systeminfo"
  l_0_1 = this_sigattrlog[27]
elseif this_sigattrlog[28].matched then
  l_0_0 = "NltestDomain"
  l_0_1 = this_sigattrlog[28]
elseif this_sigattrlog[30].matched then
  l_0_0 = "NltestAll"
  l_0_1 = this_sigattrlog[30]
elseif this_sigattrlog[29].matched then
  l_0_0 = "NltestDclist"
  l_0_1 = this_sigattrlog[29]
elseif this_sigattrlog[31].matched then
  l_0_0 = "Pingdomain"
  l_0_1 = this_sigattrlog[31]
elseif this_sigattrlog[32].matched then
  l_0_0 = "CmdSet"
  l_0_1 = this_sigattrlog[32]
else
  return mp.CLEAN
end
local l_0_2 = {
  Ipconfig = {
    "ercservice.exe",
    "qualysagent.exe"
  },
  NetStatN = {
    "ampwatchdog.exe"
  },
  NetStatS = {},
  Arp = {},
  RoutePrint = {
    "waappagent.exe"
  },
  QueryUser = {
    "taniumclient.exe",
    "mssense.exe"
  },
  Whoami = {},
  NetLocalgroup = {
    "emsystem.exe"
  },
  NetGrpDomain = {},
  NetUsrDomain = {},
  NetUser = {"dagent.exe"},
  NetGroup = {},
  NetShare = {"sqlps.exe", "java.exe"},
  NetView = {
    "oneagentplugin.exe"
  },
  NetAccounts = {},
  NetStat = {},
  NetFile = {},
  NetConfig = {},
  Systeminfo = {
    "dartcli.exe",
    "java.exe"
  },
  NltestDomain = {},
  NltestAll = {},
  NltestDclist = {},
  Pingdomain = {},
  CmdSet = {
    "eclipse.exe",
    "javaw.exe",
    "java.exe"
  }
}
if IsProcNameInParentProcessTree("BM", l_0_2[l_0_0]) then
  return mp.CLEAN
end
local l_0_3 = {
  Ipconfig = 3,
  NetStatN = 9,
  NetStatS = 12,
  Arp = 10,
  RoutePrint = 6,
  QueryUser = 3,
  Whoami = 3,
  NetLocalgroup = 3,
  NetGroupDomain = 3,
  NetUserDomain = 5,
  NetUser = 3,
  NetGroup = 3,
  NetShare = 4,
  NetView = 5,
  NetAccounts = 2,
  NetStat = 17,
  NetFile = 16,
  NetConfig = 5,
  Systeminfo = 3,
  NltestDomain = 6,
  NltestAll = 12,
  NltestDclist = 9,
  Pingdomain = 3,
  CmdSet = 2
}
local l_0_4 = l_0_3[l_0_0] or 0
local l_0_5 = {
  [20] = "L",
  [40] = "M",
  [60] = "H",
  [80] = "H+"
}
local l_0_6 = {
  [15] = "L",
  [30] = "M",
  [45] = "H",
  [60] = "H+"
}
local l_0_7 = "ReconTracking"
local l_0_8 = 14400
local l_0_9 = 100
local l_0_10 = "|"
local l_0_11 = bm.get_current_process_startup_info()
local l_0_12 = reportSessionInformation()
local l_0_13 = l_0_11.ppid .. l_0_10 .. l_0_1.ppid .. l_0_10 .. l_0_1.utf8p1 .. l_0_10 .. l_0_0 .. l_0_10 .. l_0_1.utf8p2
AppendToRollingQueue(l_0_7, l_0_13, l_0_4, l_0_8, l_0_9)
if l_0_12.User == nil or l_0_12.User.UserName == nil or l_0_12.Session == nil or l_0_12.Session.Id == nil then
  return mp.CLEAN
end
local l_0_14 = l_0_7 .. "-" .. l_0_12.User.UserName .. "[::]" .. tostring(l_0_12.Session.Id)
AppendToRollingQueue(l_0_14, l_0_13, l_0_4, l_0_8, l_0_9)
local l_0_15 = GetRollingQueueSumOfValues(l_0_14)
local l_0_16, l_0_17 = CheckNewThresholdMet(l_0_15.sum, l_0_4, l_0_6)
if l_0_16 then
  l_0_1 = copyBMEvent(l_0_1)
  bm.add_related_string("MassRecon_" .. l_0_17 .. "_User", safeJsonSerialize({score = l_0_15, events = l_0_1}), bm.RelatedStringBMReport)
  if l_0_17 == "H+" then
    reportMassReconHistory(l_0_14, l_0_17, "_User")
    return mp.INFECTED
  end
end
l_0_15 = GetRollingQueueSumOfValues(l_0_7)
l_0_16, l_0_17 = CheckNewThresholdMet(l_0_15.sum, l_0_4, l_0_5)
if l_0_16 then
  l_0_1 = copyBMEvent(l_0_1)
  bm.trigger_sig("MassRecon_" .. l_0_17 .. "_Machine", safeJsonSerialize({score = l_0_15, events = l_0_1}))
  if l_0_17 == "H+" then
    reportMassReconHistory(l_0_7, l_0_17, "_Machine")
    local l_0_18, l_0_19 = pcall(reportBmInfo)
    if not l_0_18 and l_0_19 then
      bm.add_related_string("bmInfoFailReason", tostring(l_0_19), bm.RelatedStringBMReport)
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
