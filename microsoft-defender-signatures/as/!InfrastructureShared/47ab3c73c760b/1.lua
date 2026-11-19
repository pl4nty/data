-- Threat: !InfrastructureShared
-- Name: 47ab3c73c760b
-- Type: 21
-- Includes: BMLuaLib, AppomalyHelpers, LuaFuncHelper

local l_0_0 = false
local l_0_1
if this_sigattrlog[5].matched then
  l_0_1 = "httpd.exe"
elseif this_sigattrlog[6].matched then
  l_0_1 = this_sigattrlog[6].utf8p1:match("([^\\]+)$")
elseif this_sigattrlog[7].matched then
  l_0_1 = "nginx.exe"
elseif this_sigattrlog[8].matched then
  l_0_1 = "w3wp.exe"
elseif this_sigattrlog[9].matched then
  l_0_1 = "sqlservr.exe"
elseif this_sigattrlog[10].matched then
  l_0_1 = this_sigattrlog[10].utf8p1:match("([^\\]+)$")
end
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = bm.get_current_process_startup_info()
if l_0_2 and l_0_2.ppid then
  local l_0_3 = MpCommon.GetProcessAttributeValue(l_0_2.ppid, "inherit:PFApp_Parent") or MpCommon.GetProcessAttributeValue(l_0_2.ppid, "PFApp_Parent")
  if l_0_3 then
    bm.add_related_string("procAttrib", l_0_3, bm.RelatedStringBMReport)
  end
end
local l_0_4
if this_sigattrlog[11].matched then
  l_0_4 = this_sigattrlog[11].utf8p1
  local l_0_5 = {
    "Behavior:Win32/MpTamperEx.B",
    "Behavior:Win32/MuprocMpTamperPreference.gen!A",
    "Behavior:Win32/MpTamperRTP.C",
    "Behavior:Win32/MpTamperGpDisableAV.A",
    "Behavior:Win32/MpTamperSrvDisableAV.B",
    "Behavior:Win32/MpTamperRTP.D",
    "Behavior:Win32/MpTamperSrv.A",
    "Behavior:Win32/MpTamperPShell.A",
    "Behavior:Win32/MpTamperGpDisableAVFriendly.A"
  }
  for l_0_6, l_0_7 in ipairs(l_0_5) do
    if string.find(l_0_4, l_0_7) then
      l_0_0 = true
      break
    end
  end
elseif this_sigattrlog[12].matched then
  l_0_4 = this_sigattrlog[12].utf8p1
  l_0_0 = true
elseif this_sigattrlog[13].matched then
  l_0_4 = this_sigattrlog[13].utf8p2
  local l_0_8 = {
    "Trojan:Win32/MpTamperSrvDisableAV.D",
    "Trojan:Win32/MpTamperSrvDisableAV.H",
    "Trojan:Win32/MpTamperSrvDisableAV.I",
    "Trojan:Win32/MpTamperSrvDisableAV.J",
    "Trojan:Win32/MpTamperSrvDisableAV.K",
    "Trojan:Win32/MpTamperSrvDisableAV.L",
    "Trojan:Win32/MpTamperDisableFeatureWd.A",
    "Trojan:Win32/MpTamperDisableFeatureWd.B",
    "Trojan:Win32/MPTamperAdRun.B",
    "Trojan:Win32/MpTamperRegDisableAV.SA",
    "Trojan:Win32/MPTamperSuspExlc.C"
  }
  for l_0_9, l_0_10 in ipairs(l_0_8) do
    if string.find(l_0_4, l_0_10) then
      l_0_0 = true
      break
    end
  end
elseif this_sigattrlog[14].matched then
  l_0_4 = this_sigattrlog[14].utf8p2
  l_0_0 = true
elseif this_sigattrlog[15].matched then
  l_0_4 = this_sigattrlog[15].utf8p1
  if MpCommon.StringRegExpSearch("(?i)(MpTamperBulkExcl|MPTamperSuspExlc.C|SrvDisableAV|DisableFeature)", l_0_4) then
    l_0_0 = true
  end
  if this_sigattrlog[15].utf8p2 == "INFECTED" then
    bm.add_related_string("AMSI_Detection", l_0_4 .. "|" .. "INFECTED", bm.RelatedStringBMReport)
  elseif this_sigattrlog[15].utf8p2 == "LOFI" then
    bm.add_related_string("AMSI_Detection", l_0_4 .. "|" .. "LOFI", bm.RelatedStringBMReport)
  end
elseif this_sigattrlog[16].matched then
  l_0_4 = this_sigattrlog[16].utf8p1
  l_0_0 = true
elseif this_sigattrlog[17].matched then
  l_0_4 = this_sigattrlog[17].utf8p1
  l_0_0 = true
elseif this_sigattrlog[18].matched then
  l_0_4 = this_sigattrlog[18].utf8p1
  l_0_0 = true
end
if not l_0_4 then
  return mp.CLEAN
end

local function l_0_11(l_1_0, l_1_1)
  local l_1_2 = {
    "httpd",
    "w3wp",
    "sqlservr",
    "tomcat"
  }
  local l_1_3 = false
  for l_1_4, l_1_5 in ipairs(l_1_2) do
    if string.find(l_1_1, l_1_5) then
      l_1_3 = true
      break
    end
  end
  if not l_1_3 then
    return false
  end
  local l_1_6 = {
    "php-cgi.exe",
    "httpd.exe",
    "tomcat",
    "nginx.exe",
    "w3wp.exe",
    "sqlservr.exe",
    "java"
  }
  if contains(l_1_0, l_1_6) then
    return false
  end
  return true
end

local l_0_12 = l_0_0 and 30 or 10
local l_0_13 = "PFServers"
local l_0_14 = GetPidFromParentImagePath(l_0_1)
if l_0_14 then
  local l_0_15, l_0_16 = startTrackingApp(l_0_14, l_0_1, l_0_13, "PFApp_Parent")
  if not l_0_15 then
    l_0_16.SignatureName = "PFATamper.A"
    l_0_16.ProcessName = l_0_1
    bm.trigger_sig("ProcAttribError", safeJsonSerialize(l_0_16))
  else
    local l_0_17 = "Tampering[" .. l_0_2.ppid:match("pid:(%d+)") .. "][" .. l_0_4 .. "]"
    IncreaseProcessAnomalyScore(l_0_2.ppid, l_0_12, l_0_17, "PFApp_Parent")
    if next(l_0_16) and l_0_16.IsNewApp then
      l_0_16.SignatureName = "PFATamper.A"
      l_0_16.ProcessName = l_0_1
      l_0_16.Score = l_0_12
      bm.trigger_sig("SetProcessAttrib", safeJsonSerialize(l_0_16))
    end
  end
end
local l_0_18 = bm.get_imagepath():match("([^\\]+)$")
if l_0_0 and l_0_11(l_0_18, string.lower(l_0_1)) then
  bm.add_related_string("serverName", l_0_1, bm.RelatedStringBMReport)
  bm.add_related_string("tamperingAlert", l_0_4, bm.RelatedStringBMReport)
  local l_0_19 = bm.get_current_process_startup_info()
  if l_0_19 then
    bm.add_related_string("appName", getWebApplicationType(l_0_19.ppid), bm.RelatedStringBMReport)
  end
  reportSessionInformationInclusive()
  add_parents()
  reportRelevantUntrustedEntities(0)
  local l_0_20, l_0_21 = pcall(reportBmInfo)
  if not l_0_20 and l_0_21 then
    bm.add_related_string("bmInfoFailReason", tostring(l_0_21), bm.RelatedStringBMReport)
  end
  return mp.INFECTED
elseif l_0_0 then
  bm.trigger_sig("PFATamper.C", l_0_1 .. "|" .. l_0_4)
else
  bm.trigger_sig("PFATamper.B", l_0_1 .. "|" .. l_0_4)
end
return mp.CLEAN
