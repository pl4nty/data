-- Threat: !InfrastructureShared
-- Name: 36b3cfe2bf91
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  local l_0_0 = string.lower(this_sigattrlog[1].utf8p1)
  if string.find(l_0_0, ".htaccess", 1, true) then
    return mp.CLEAN
  end
  if sysio.IsFileExists(l_0_0) then
    bm.add_related_file(l_0_0)
  end
end
return mp.INFECTED
