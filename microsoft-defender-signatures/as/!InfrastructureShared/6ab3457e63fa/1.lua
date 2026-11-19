-- Threat: !InfrastructureShared
-- Name: 6ab3457e63fa
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
local l_0_1 = {
  "profisee/kubernetes/master/azure-arm"
}
if contains(l_0_0, l_0_1) then
  return mp.CLEAN
end
local l_0_2 = {
  "pastebin.com",
  "paste.ee",
  "paste.gg",
  "j.mp",
  "bit.ly",
  "bitly.com",
  "textbin.net"
}
if contains(l_0_0, l_0_2) then
  bm.add_related_string("CurlPublicStager_cmdline", l_0_0, bm.RelatedStringBMReport)
  return mp.INFECTED
end
return mp.CLEAN
