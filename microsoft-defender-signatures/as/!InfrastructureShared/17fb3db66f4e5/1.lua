-- Threat: !InfrastructureShared
-- Name: 17fb3db66f4e5
-- Type: 21

if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  local l_0_0 = this_sigattrlog[2].utf8p2
  if sysio.IsFileExists(l_0_0) then
    bm.add_related_file(l_0_0)
  end
end
return mp.INFECTED
