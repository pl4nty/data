-- Threat: !InfrastructureShared
-- Name: 279b37350fbd3
-- Type: 21
-- Includes: BMLuaLib

local l_0_0, l_0_1
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if #l_0_0 < 62 then
  return mp.CLEAN
end
if contains(l_0_0, "powershell.exe") then
  l_0_1 = NormalizeCmdline("powershell", l_0_0)
else
  l_0_1 = NormalizeCmdline("cmd", l_0_0)
end
if isnull(l_0_1) then
  return mp.CLEAN
end
l_0_1 = string.gsub(l_0_1, "[\"'()+]", "")
l_0_1 = string.lower(l_0_1)
local l_0_2 = {
  "new-object system.net.http.httpclient",
  ".downloadstring",
  ".downloadfile",
  "[net.webclient]::downloadstring",
  "curl",
  "wget",
  "invoke-restmethod",
  "irm",
  "invoke-webrequest",
  "iwr",
  "iex",
  "invoke-expression",
  "invoke-command",
  "[scriptblock]::create",
  "scriptblock::create",
  "start-process",
  "saps",
  "cmd /c powershell",
  "[text.encoding]::utf8.getstring",
  "[system.text.encoding]::ascii.getstring",
  "[system.convert]::frombase64string",
  "-usebasicparsing",
  "-useb ",
  "-uri",
  "-response",
  "-w",
  "\226\128\149w",
  "hidden",
  "[char]",
  "ping",
  "whoami",
  "ipconfig",
  "arp",
  "nbtstat",
  "netstat",
  "tasklist",
  "taskkill",
  "findstr",
  "find",
  "tracert",
  "dsquery",
  "dsget",
  "driverquery",
  "gpresult",
  "logman",
  "wevtutil",
  "systeminfo",
  "reg add",
  "reg delete",
  "reg query",
  "mimikatz",
  "downloadstring",
  "reflective",
  "shellcode",
  "-windowstyle"
}
if not contains(l_0_1, l_0_2) then
  return mp.CLEAN
end
bm.add_related_string("FileFix_cmdline", l_0_0, bm.RelatedStringBMReport)
return mp.INFECTED
