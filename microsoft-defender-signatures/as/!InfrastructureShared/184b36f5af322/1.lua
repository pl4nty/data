-- Threat: !InfrastructureShared
-- Name: 184b36f5af322
-- Type: 21

if this_sigattrlog[7].matched and this_sigattrlog[7].utf8p2 ~= nil then
  local l_0_0 = string.lower(this_sigattrlog[7].utf8p2)
  local l_0_1, l_0_2 = string.match(l_0_0, "^(%d+);regionsize:(%d+)")
  if not l_0_2 then
    return mp.CLEAN
  end
  local l_0_3 = tonumber(l_0_2)
  if not l_0_3 then
    return mp.CLEAN
  end
  if 4096 < l_0_3 then
    bm.add_related_string("ProtectVmInfo", l_0_0, bm.RelatedStringBMReport)
    return mp.INFECTED
  end
end
return mp.CLEAN
