-- Threat: !InfrastructureShared
-- Name: 2db3db1618a0
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  local l_0_0 = this_sigattrlog[1].utf8p2
  l_0_0 = l_0_0:gsub("`", "", 100)
  l_0_0 = string.lower(l_0_0)
  if string.find(l_0_0, "new-object", 1, true) or string.find(l_0_0, "executioncontext", 1, true) or string.find(l_0_0, "webclient", 1, true) or string.find(l_0_0, "newscriptblock", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
