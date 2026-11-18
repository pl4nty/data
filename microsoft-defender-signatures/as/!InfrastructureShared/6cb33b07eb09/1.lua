-- Threat: !InfrastructureShared
-- Name: 6cb33b07eb09
-- Type: 21

if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  local l_0_0 = string.lower(this_sigattrlog[4].utf8p2)
  local l_0_1 = l_0_0:match("/c ([^\\].*)")
  if l_0_1 ~= nil and sysio.IsFileExists(l_0_1) then
    bm.add_related_file(l_0_1)
  end
end
return mp.INFECTED
