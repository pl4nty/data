-- Threat: !InfrastructureShared
-- Name: ffb3ec0a0e32
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
local l_0_1 = bm.get_imagepath()
if l_0_1 == nil then
  return mp.CLEAN
end
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p2
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[4].utf8p2
elseif this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[5].utf8p2
elseif this_sigattrlog[6].matched and this_sigattrlog[6].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[6].utf8p2
end
bm.DisableSignature()
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
local l_0_2 = {
  "08f1b3ac-3ee3-4346-8c37-bd72a6093855",
  "servicedesk.atera.com",
  "support.csolve.net",
  "lt.tech-keys.com",
  "myusername_$env:username",
  "ndc support portal",
  "function run-server()",
  "metadata/instance?api",
  "/latest/meta-data/instance-id",
  "everismartclient"
}
if contains(l_0_0, l_0_2) then
  return mp.CLEAN
end
local l_0_3 = {
  "System.DirectoryServices.ActiveDirectory.Domain",
  "hidden -encodedcommand",
  "export-registry",
  "compress-archive",
  "wget -uri",
  "curl -uri",
  "curl -sko",
  "ipconfig /all",
  "& start /b",
  "start msiexec /q /i",
  "whoami",
  "net user",
  "net group",
  "localgroup administrators",
  "dsquery",
  "samaccountname=",
  "query session",
  "adscredentials",
  "o365accountconfiguration",
  "-dumpmode",
  "-ssh",
  "usoprivate",
  "usoshared",
  "invoke-expression",
  "downloadstring",
  "downloadfile",
  "frombase64string",
  "system.io.compression",
  "system.io.memorystream",
  "iex ",
  "iex(",
  "invoke-webrequest",
  "iwr -uri",
  "set-mppreference",
  "add-mppreference",
  "certutil",
  "bitsadmin",
  "mshta",
  " -ssh ",
  "putty.exe",
  "ftp.exe",
  "e:jscript",
  "e:vbscript",
  "start msiexec /q /i",
  "nslookup"
}
local l_0_4 = {
  "-command.*curl",
  "localgroup Administrators.*/add",
  "reg add.*disableantispyware.*\\microsoft\\windows defender\\",
  "reg add.*DisableRestrictedAdmin.*CurrentControlSet\\Control\\Lsa"
}
if contains(l_0_1, {
  "powershell.exe",
  "pwsh.exe",
  "cmd.exe"
}) then
  if contains(l_0_0, l_0_3) then
    return mp.INFECTED
  end
  if contains(l_0_0, l_0_4, false) then
    return mp.INFECTED
  end
  if contains(l_0_0, "nltest") and contains(l_0_0, {
    "domain_trusts",
    "dclist",
    "all_trusts"
  }) then
    return mp.INFECTED
  end
  if contains(l_0_0, "lsass") and contains(l_0_0, {
    "procdump",
    "tasklist",
    "findstr"
  }) then
    return mp.INFECTED
  end
end
if contains(l_0_1, {
  "mshta.exe",
  "wget.exe",
  "curl.exe"
}) and contains(l_0_0, "http") then
  return mp.INFECTED
end
return mp.CLEAN
