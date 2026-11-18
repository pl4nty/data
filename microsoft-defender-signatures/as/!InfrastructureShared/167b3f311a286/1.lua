-- Threat: !InfrastructureShared
-- Name: 167b3f311a286
-- Type: 21

if this_sigattrlog[6].matched and this_sigattrlog[6].utf8p2 ~= nil then
  local l_0_0 = string.lower(this_sigattrlog[6].utf8p2)
  local l_0_1, l_0_2 = string.match(l_0_0, "^(%d+);regionsize:(%d+)")
  if not l_0_2 then
    return mp.CLEAN
  end
  local l_0_3 = tonumber(l_0_2)
  if not l_0_3 then
    return mp.CLEAN
  end
  local l_0_4 = {
    [1482752] = true,
    [544768] = true,
    [80335] = true,
    [60536] = true,
    [60492] = true
  }
  if 4096 < l_0_3 and not l_0_4[l_0_3] then
    bm.add_related_string("ProtectVmInfo", l_0_0, bm.RelatedStringBMReport)
    return mp.INFECTED
  end
end
return mp.CLEAN
