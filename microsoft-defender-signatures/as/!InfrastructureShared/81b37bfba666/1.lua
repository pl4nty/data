-- Threat: !InfrastructureShared
-- Name: 81b37bfba666
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[2] and this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p2
elseif this_sigattrlog[3] and this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p2
elseif this_sigattrlog[4] and this_sigattrlog[4].matched then
  l_0_0 = this_sigattrlog[4].utf8p2
elseif this_sigattrlog[5] and this_sigattrlog[5].matched then
  l_0_0 = this_sigattrlog[5].utf8p2
end
if l_0_0 == nil or #l_0_0 < 62 then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
if contains(l_0_0, {
  "whoami.exe",
  "base64",
  "net user",
  "net localgroup",
  "systeminfo",
  "hostname",
  "ipconfig",
  "getmac",
  "netstat",
  "nslookup",
  "ping",
  "tracert",
  "wmic process",
  "schtasks /query",
  "-urlcache -split",
  "wevtutil",
  "attrib"
}) then
  bm.add_related_string("W3WPCommand", tostring(l_0_0), bm.RelatedStringBMReport)
  return mp.INFECTED
end
return mp.CLEAN
