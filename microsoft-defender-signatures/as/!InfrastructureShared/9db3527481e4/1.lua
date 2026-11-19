-- Threat: !InfrastructureShared
-- Name: 9db3527481e4
-- Type: 21

if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil and this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  local l_0_0 = string.match(this_sigattrlog[2].utf8p1, "/([^/]+)$")
  local l_0_1 = string.match(this_sigattrlog[3].utf8p2, "+x%s+(.+)$")
  if 0 < #l_0_0 and 0 < #l_0_1 and string.find(l_0_1, l_0_0, 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
