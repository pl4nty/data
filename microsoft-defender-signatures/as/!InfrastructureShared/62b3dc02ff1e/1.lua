-- Threat: !InfrastructureShared
-- Name: 62b3dc02ff1e
-- Type: 21

if this_sigattrlog[2].matched then
  local l_0_0 = this_sigattrlog[2].utf8p1
  if l_0_0 ~= nil and string.find(l_0_0, "package.json", -12, true) and string.find(l_0_0, "/node_modules/", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
