-- Threat: !InfrastructureShared
-- Name: 131b3c23100c4
-- Type: 21

if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  local l_0_0 = string.lower(this_sigattrlog[4].utf8p2)
  local l_0_1 = l_0_0:match("totalsizeappend:(%d+);")
  l_0_1 = l_0_1 and tonumber(l_0_1)
  local l_0_2 = l_0_0:match("totalsizewrite:(%d+);")
  l_0_2 = l_0_2 and tonumber(l_0_2)
  if 0 < l_0_2 and 0 < l_0_1 then
    local l_0_3 = l_0_0:match("numwrites:(%d+);")
    bm.add_related_string("write_size", tostring(l_0_2), bm.RelatedStringBMReport)
    bm.add_related_string("append_size", tostring(l_0_1), bm.RelatedStringBMReport)
    bm.add_related_string("num_writes", tostring(l_0_3), bm.RelatedStringBMReport)
    return mp.INFECTED
  end
end
return mp.CLEAN
