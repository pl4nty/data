-- Threat: !InfrastructureShared
-- Name: d0b3e5387cc4
-- Type: 21

local l_0_0
if this_sigattrlog[4].matched then
  l_0_0 = string.lower(this_sigattrlog[4].utf8p1)
end
if l_0_0 ~= nil and (string.find(l_0_0, ":sec.endpointdlp", 1, true) or string.find(l_0_0, ":smartscreen", 1, true) or string.find(l_0_0, ":$wimmountdata", 1, true) or string.find(l_0_0, ":com.dropbox.attrs", 1, true) or string.find(l_0_0, ":zone.identifier", 1, true)) then
  return mp.CLEAN
end
bm.add_related_string("SuspDefAbuseW", tostring(l_0_0), bm.RelatedStringBMReport)
return mp.INFECTED
