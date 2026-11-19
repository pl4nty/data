-- Threat: !InfrastructureShared
-- Name: 3d4b384a2334e
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = versioning.GetOrgID()
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = {
  ["26e8b179-9fbe-40fd-8f34-37cdee8c4766"] = true,
  ["e6e2b814-cd64-4ac3-9e16-91753ff30617"] = true,
  ["bcfa1838-fccc-4999-9d5b-5ec1ac1a4776"] = true,
  ["9ee8ddb9-e98f-4b86-a160-fe3b96f39cc6"] = true
}
if not l_0_1[string.lower(l_0_0)] then
  return mp.CLEAN
end
local l_0_2, l_0_3, l_0_4
if this_sigattrlog[11].matched and not isnull(this_sigattrlog[11].utf8p1) and not isnull(this_sigattrlog[11].utf8p2) then
  l_0_2 = "ChildCmd"
  l_0_3 = this_sigattrlog[11].utf8p1
  l_0_4 = this_sigattrlog[11].utf8p2
elseif this_sigattrlog[12].matched and not isnull(this_sigattrlog[12].utf8p1) and not isnull(this_sigattrlog[12].utf8p2) then
  l_0_2 = "ChildPowershell"
  l_0_3 = this_sigattrlog[12].utf8p1
  l_0_4 = this_sigattrlog[12].utf8p2
elseif this_sigattrlog[13].matched and not isnull(this_sigattrlog[13].utf8p1) and not isnull(this_sigattrlog[13].utf8p2) then
  l_0_2 = "ChildPwsh"
  l_0_3 = this_sigattrlog[13].utf8p1
  l_0_4 = this_sigattrlog[13].utf8p2
elseif this_sigattrlog[14].matched and not isnull(this_sigattrlog[14].utf8p1) and not isnull(this_sigattrlog[14].utf8p2) then
  l_0_2 = "ChildCscript"
  l_0_3 = this_sigattrlog[14].utf8p1
  l_0_4 = this_sigattrlog[14].utf8p2
elseif this_sigattrlog[15].matched and not isnull(this_sigattrlog[15].utf8p1) and not isnull(this_sigattrlog[15].utf8p2) then
  l_0_2 = "ChildWscript"
  l_0_3 = this_sigattrlog[15].utf8p1
  l_0_4 = this_sigattrlog[15].utf8p2
elseif this_sigattrlog[16].matched and not isnull(this_sigattrlog[16].utf8p1) and not isnull(this_sigattrlog[16].utf8p2) then
  l_0_2 = "ChildMshta"
  l_0_3 = this_sigattrlog[16].utf8p1
  l_0_4 = this_sigattrlog[16].utf8p2
elseif this_sigattrlog[17].matched and not isnull(this_sigattrlog[17].utf8p1) and not isnull(this_sigattrlog[17].utf8p2) then
  l_0_2 = "ChildBitsadmin"
  l_0_3 = this_sigattrlog[17].utf8p1
  l_0_4 = this_sigattrlog[17].utf8p2
elseif this_sigattrlog[18].matched and not isnull(this_sigattrlog[18].utf8p1) and not isnull(this_sigattrlog[18].utf8p2) then
  l_0_2 = "ChildRegsvr32"
  l_0_3 = this_sigattrlog[18].utf8p1
  l_0_4 = this_sigattrlog[18].utf8p2
elseif this_sigattrlog[19].matched and not isnull(this_sigattrlog[19].utf8p1) and not isnull(this_sigattrlog[19].utf8p2) then
  l_0_2 = "ChildRundll32"
  l_0_3 = this_sigattrlog[19].utf8p1
  l_0_4 = this_sigattrlog[19].utf8p2
end
if isnull(l_0_2) then
  return mp.CLEAN
end
l_0_3 = string.lower(l_0_3)
l_0_4 = string.lower(l_0_4)
local l_0_5 = l_0_4
l_0_4 = string.gsub(l_0_4, "[\"%s]+", " ")
local l_0_6 = {
  "-encodedcommand",
  "-encoded ",
  " -enc ",
  "-enc ",
  "iex(",
  "iex (",
  " iex ",
  "invoke-expression",
  "downloadstring",
  "downloadfile",
  "downloaddata",
  "invoke-webrequest",
  " iwr ",
  "start-bitstransfer",
  "compress-archive",
  "frombase64string",
  "::frombase64",
  "set-mppreference",
  "add-mppreference",
  "reg add ",
  "reg delete ",
  "schtasks /create",
  "wmic process call create"
}
local l_0_7 = {
  " whoami",
  " tasklist",
  " netstat",
  " systeminfo",
  " ipconfig",
  " hostname",
  " arp ",
  " route print",
  " nslookup",
  " nltest",
  " quser",
  " qwinsta",
  " query user",
  " net user",
  " net group",
  " net localgroup",
  " net view",
  " net use",
  " net start",
  " dsquery",
  " date /t",
  " time /t",
  " sc query",
  " wmic nic",
  " netsh interface",
  " getmac",
  "/c whoami",
  "/c tasklist",
  "/c netstat",
  "/c systeminfo",
  "/c ipconfig",
  "/c hostname",
  "/c arp",
  "/c route",
  "/c nslookup",
  "/c nltest",
  "/c quser",
  "/c qwinsta",
  "/c query user",
  "/c net user",
  "/c net group",
  "/c net localgroup",
  "/c net view",
  "/c net use",
  "/c net start",
  "/c dsquery",
  "/c date /t",
  "/c time /t",
  "/c dir",
  "/c ver",
  "/c sc query",
  "/c wmic nic",
  "/c netsh interface",
  "/c getmac"
}
local l_0_8 = {
  "get-wmiobject",
  "gwmi ",
  "get-ciminstance",
  "gcim ",
  "win32_computersystem",
  "win32_operatingsystem",
  "win32_bios",
  "win32_networkadapterconfiguration",
  "win32_process",
  "win32_service",
  "get-localuser",
  "get-localgroup",
  "get-localgroupmember",
  "get-aduser",
  "get-adgroup",
  "get-adcomputer",
  "get-netuser",
  "get-netgroup",
  "get-netcomputer",
  "get-domainuser",
  "get-domaingroup",
  "get-domaincomputer",
  "get-process",
  "get-service",
  "get-childitem",
  "gci ",
  "get-netipaddress",
  "get-nettcpconnection",
  "get-ipconfiguration",
  "get-computerinfo",
  "get-volume",
  "get-disk",
  "get-physicaldisk",
  "get-eventlog",
  "get-winevent",
  "psversiontable",
  "$profile"
}
local l_0_9 = contains(l_0_4, l_0_6, true) or contains(l_0_4, l_0_7, true) or contains(l_0_4, l_0_8, true)
if not l_0_9 then
  return mp.CLEAN
end
local l_0_10
if this_sigattrlog[10].matched then
  l_0_10 = this_sigattrlog[10].ppid
end
if not isnull(l_0_10) then
  TrackPidAndTechniqueBM("BM", "T1505.003", "iis_shell_spawn", 28800)
  bm.add_related_process(l_0_10)
end
local l_0_11 = mp.GetExecutablesFromCommandLine(l_0_5)
if not isnull(l_0_11) then
  local l_0_12 = #l_0_11
  if 1 <= l_0_12 then
    local l_0_13 = mp.ContextualExpandEnvironmentVariables(l_0_11[1])
    if not isnull(l_0_13) and sysio.IsFileExists(l_0_13) and not mp.IsKnownFriendlyFile(l_0_13, true, false) then
      bm.add_related_file(l_0_13)
    end
  end
  if 2 <= l_0_12 then
    local l_0_14 = mp.ContextualExpandEnvironmentVariables(l_0_11[2])
    if not isnull(l_0_14) and sysio.IsFileExists(l_0_14) and not mp.IsKnownFriendlyFile(l_0_14, true, false) then
      bm.add_related_file(l_0_14)
    end
  end
  if 3 <= l_0_12 then
    local l_0_15 = mp.ContextualExpandEnvironmentVariables(l_0_11[3])
    if not isnull(l_0_15) and sysio.IsFileExists(l_0_15) and not mp.IsKnownFriendlyFile(l_0_15, true, false) then
      bm.add_related_file(l_0_15)
    end
  end
end
bm.add_related_string("iis_shell_child_path", l_0_3, bm.RelatedStringBMReport)
bm.add_related_string("iis_shell_child_name", l_0_2, bm.RelatedStringBMReport)
bm.add_related_string("iis_shell_cmd_len", tostring(#l_0_5), bm.RelatedStringBMReport)
add_parents()
return mp.INFECTED
