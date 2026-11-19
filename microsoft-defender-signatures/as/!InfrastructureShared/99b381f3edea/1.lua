-- Threat: !InfrastructureShared
-- Name: 99b381f3edea
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if #l_0_0 < 62 then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
if contains(l_0_0, {
  "codex",
  "c:\\programdata\\microsoft",
  "&echo @",
  "powershell.exe -noprofile -executionPolicy bypass -file",
  "\\program files",
  "reg query",
  "powershell -executionpolicy bypass -file",
  "taskkill"
}) then
  return mp.CLEAN
end
if contains(l_0_0, {
  "powershell",
  "rundll32",
  "msiexec",
  " mshta",
  " bitsadmin",
  "curl",
  "e:jscript",
  "conhost",
  "control",
  "regsvr32",
  "wscript",
  "cscript",
  "javaws",
  "wmic",
  "scriptrunner",
  "certutil",
  "echo",
  "start",
  "runas",
  "appinstaller",
  "hh",
  "ieexec",
  "installutil",
  "rpcping",
  "defaultpack",
  "msxsl",
  "squirrel",
  "update",
  "winrm"
}) then
  bm.add_related_string("RegRunMRU", tostring(l_0_0), bm.RelatedStringBMReport)
  reportSessionInformation()
  add_parents()
  return mp.INFECTED
end
return mp.CLEAN
