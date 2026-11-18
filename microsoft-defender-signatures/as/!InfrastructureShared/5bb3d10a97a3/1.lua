-- Threat: !InfrastructureShared
-- Name: 5bb3d10a97a3
-- Type: 21

if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  local l_0_0 = this_sigattrlog[2].utf8p1
  l_0_0 = string.lower(l_0_0)
  local l_0_1 = ":\\windows\\system32"
  local l_0_2 = "%system%\\"
  local l_0_3 = ":\\windows\\syswow64"
  if string.find(l_0_0, l_0_1, 2, true) or string.find(l_0_0, l_0_2, 0, true) or string.find(l_0_0, l_0_3, 2, true) then
    return mp.CLEAN
  end
  bm.add_related_file(l_0_0)
  return mp.INFECTED
end
return mp.CLEAN
