-- Threat: !InfrastructureShared
-- Name: 6db3087200e4
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[1].matched and not isnull(this_sigattrlog[1].utf8p1) and not isnull(this_sigattrlog[1].utf8p2) then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
  local l_0_1, l_0_2 = pcall(string.match, l_0_0, "remoteip:([^:]+):%d+")
  if l_0_1 and not isnull(l_0_2) then
    bm.add_related_string("[i] MALICIOUS URL: ", l_0_2, bm.RelatedStringBMReport)
    bm.add_related_string("[i] MALICIOUS CONNECTION INFO: ", l_0_0, bm.RelatedStringBMReport)
    return mp.INFECTED
  end
end
return mp.CLEAN
