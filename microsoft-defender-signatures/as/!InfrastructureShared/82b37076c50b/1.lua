-- Threat: !InfrastructureShared
-- Name: 82b37076c50b
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
end
local l_0_1 = {
  "pastebin.com",
  "paste.ee",
  "j.mp",
  "github.com",
  "githubusercontent.com",
  "bit.ly",
  "bitly.com",
  "bitbucket.org",
  "textbin.net"
}
if contains(l_0_0, l_0_1) then
  bm.add_related_string("MSHTAPublicStager_cmdline", l_0_0, bm.RelatedStringBMReport)
  return mp.INFECTED
end
return mp.CLEAN
