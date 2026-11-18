-- Threat: !InfrastructureShared
-- Name: 6d0b3aab04577
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = 0
local l_0_1 = 0
local l_0_2, l_0_3
local l_0_4 = false
local l_0_5
local l_0_6 = false
local l_0_7
local l_0_8 = {
  "bitsadmin",
  "certutil",
  "msiexec",
  "scriptrunner",
  "wmic",
  "cscript",
  "powershell",
  "curl",
  "conhost",
  "mshta"
}
local l_0_9 = {
  ".ps1",
  ".hta",
  ".msi"
}
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[2].timestamp
end
for l_0_10 = 1, mp.SIGATTR_LOG_SZ do
  if sigattr_head[l_0_10].matched and sigattr_head[l_0_10].attribute == 16400 and sigattr_head[l_0_10].utf8p2 then
    l_0_2 = sigattr_head[l_0_10].utf8p2
    l_0_3 = sigattr_head[l_0_10].utf8p1
    l_0_4, l_0_5 = pcall(MpCommon.CommandLineToArgv, l_0_2)
    if not l_0_4 or isnull(l_0_5) or type(l_0_5) ~= "table" or isnull(#l_0_5) then
      return mp.CLEAN
    end
    if #l_0_5 == 1 or l_0_5[1] == nil then
      return mp.CLEAN
    end
    if contains(l_0_2, l_0_8) and 50 < #l_0_2 and not contains(l_0_2, l_0_9) then
      l_0_0 = sigattr_head[l_0_10].timestamp
      if l_0_1 and l_0_0 and l_0_1 < l_0_0 and 30000000 < l_0_0 - l_0_1 then
        l_0_6 = true
      end
    end
  end
end
if not l_0_6 then
  return mp.CLEAN
end
if not l_0_3 then
  return mp.CLEAN
end
if contains(l_0_3, "powershell.exe") then
  l_0_7 = NormalizeCmdline("powershell", l_0_2)
else
  l_0_7 = NormalizeCmdline("cmd", l_0_2)
end
if isnull(l_0_7) then
  return mp.CLEAN
end
l_0_7 = string.gsub(l_0_7, "[\"'()+]", "")
l_0_7 = string.lower(l_0_7)
local l_0_11 = {
  "(new-object system.net.http.httpclient).getasync",
  "(new-object system.net.http.httpclient).getstringasync",
  "(new-object system.net.webclient).downloadstring",
  "(new-object system.net.webclient).downloadfile",
  "(new-object net.webclient).downloadfile",
  "(new-object net.webclient).downloadstring",
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
  "content).invoke()",
  "invoke()",
  "start-process",
  "saps",
  "cmd /c powershell",
  "://",
  "[char]105+[char]119+[char]114",
  "([text.encoding]::utf8.getstring",
  "([system.text.encoding]::ascii.getstring",
  "[system.convert]::frombase64string",
  "[system.text.encoding]::utf8.getstring([system.convert]::frombase64string",
  "-usebasicparsing",
  "-useb ",
  "-uri",
  "-response",
  "-w",
  "\226\128\149w",
  "\226\128\148w",
  "\226\128\144",
  "\226\128\145",
  "\226\128\146",
  "\226\128\148",
  "\226\128\149",
  "\226\129\131",
  "\239\185\152",
  "\239\185\163",
  "\239\188\141",
  "\226\184\186",
  "\226\184\187",
  "[char]"
}
if not contains(l_0_7, l_0_11) then
  return mp.CLEAN
end
bm.add_related_string("RUNMRU_cmdline", l_0_2, bm.RelatedStringBMReport)
return mp.INFECTED
