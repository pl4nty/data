-- Threat: !InfrastructureShared
-- Name: 43b3733bba8d
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  local l_0_0 = this_sigattrlog[1].utf8p2
  if l_0_0 == nil then
    return mp.CLEAN
  end
  bm.add_related_file(l_0_0)
  return mp.INFECTED
end
return mp.CLEAN
