-- Threat: !InfrastructureShared
-- Name: 78b37df75efd
-- Type: 21

local l_0_0 = ""
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
end
if l_0_0 then
  if not string.match(l_0_0, ".blf$") or string.find(l_0_0, "}.tm.blf", 1, true) or string.find(l_0_0, "}.txr.blf", 1, true) then
    return mp.CLEAN
  else
    bm.add_related_string("SuspClfsAccess_CLFS", tostring(l_0_0), bm.RelatedStringBMReport)
  end
end
return mp.INFECTED
