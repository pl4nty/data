-- Threat: !InfrastructureShared
-- Name: 6cb3ad2dd47d
-- Type: 21

if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  local l_0_0 = this_sigattrlog[2].utf8p2
  if l_0_0 == nil then
    return mp.CLEAN
  end
  bm.add_related_file(l_0_0)
  return mp.INFECTED
end
return mp.CLEAN
