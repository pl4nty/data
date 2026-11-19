-- Threat: !InfrastructureShared
-- Name: 76b306579525
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
end
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = {
  "127.0.0.1",
  "localhost",
  "bootstrap"
}
if contains(l_0_0, l_0_1) then
  return mp.CLEAN
end
local l_0_2 = {
  "downloadstring",
  "|iex",
  "|invoke-expression",
  "iwr",
  "invoke-webrequest",
  "frombase64string",
  "-enc",
  "-mppreference",
  "whoami",
  "hostname",
  "system.net.webclient",
  "localgroup administrators",
  "amsiinitfailed",
  "getfield"
}
if contains(l_0_0, l_0_2) then
  bm.add_related_string("MaliciousNodeChild", tostring(l_0_0), bm.RelatedStringBMReport)
  return mp.INFECTED
end
return mp.CLEAN
