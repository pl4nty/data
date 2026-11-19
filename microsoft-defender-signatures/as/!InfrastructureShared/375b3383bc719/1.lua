-- Threat: !InfrastructureShared
-- Name: 375b3383bc719
-- Type: 21

if this_sigattrlog[12].matched and this_sigattrlog[12].utf8p1 ~= nil then
  local l_0_0 = string.lower(this_sigattrlog[12].utf8p1)
  if l_0_0 ~= nil and sysio.IsFileExists(l_0_0) and mp.IsKnownFriendlyFile(l_0_0, true, false) ~= true then
    bm.add_related_file(l_0_0)
    return mp.INFECTED
  end
end
return mp.CLEAN
