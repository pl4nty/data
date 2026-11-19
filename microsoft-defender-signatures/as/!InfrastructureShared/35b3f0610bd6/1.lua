-- Threat: !InfrastructureShared
-- Name: 35b3f0610bd6
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  local l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
  if string.find(l_0_0, " -url ", 1, true) and string.find(l_0_0, " http", 1, true) and string.find(l_0_0, " -path ", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
