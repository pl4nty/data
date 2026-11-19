-- Threat: !InfrastructureShared
-- Name: bdb3f3ddbc79
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[3].matched then
  l_0_0 = string.lower(this_sigattrlog[3].utf8p1)
end
if this_sigattrlog[2].matched then
  l_0_1 = string.lower(this_sigattrlog[2].utf8p1)
end
if l_0_1 ~= nil and (string.find(l_0_1, ":sec.endpointdlp", 1, true) or string.find(l_0_1, ":smartscreen", 1, true) or string.find(l_0_1, ":$wimmountdata", 1, true) or string.find(l_0_1, ":com.dropbox.attrs", 1, true) or string.find(l_0_1, ":zone.identifier", 1, true)) then
  return mp.CLEAN
end
if l_0_0 ~= nil then
  if string.find(l_0_0, "\\windows\\", 1, true) then
    return mp.CLEAN
  end
  if string.find(l_0_0, "\\temp\\", 1, true) then
    bm.add_related_string("SuspDefAbuseW", tostring(l_0_1), bm.RelatedStringBMReport)
    bm.add_related_string("SuspDefAbuseR", tostring(l_0_0), bm.RelatedStringBMReport)
    return mp.INFECTED
  end
end
return mp.CLEAN
