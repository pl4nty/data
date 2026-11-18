-- Threat: !InfrastructureShared
-- Name: 19b3f4e9fa13
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  local l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
  if sysio.IsFileExists(l_0_0) then
    bm.add_related_file(l_0_0)
  end
end
return mp.INFECTED
