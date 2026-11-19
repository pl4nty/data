-- Threat: !InfrastructureShared
-- Name: 48b34b5faf03
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
  l_0_0 = string.lower(l_0_0)
  local l_0_1 = {
    "system.directoryservices.activedirectory.domain",
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
    "system.net.webclient",
    "invoke-expression",
    "downloadstring",
    "downloadfile",
    "frombase64string",
    "system.io.compression",
    "system.io.memorystream",
    "iex ",
    "iex(",
    "|iex",
    "invoke-webrequest",
    "iwr -uri",
    "set-mppreference",
    "invoke-webRequest",
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
  if contains(l_0_0, l_0_1) then
    return mp.INFECTED
  end
end
return mp.CLEAN
