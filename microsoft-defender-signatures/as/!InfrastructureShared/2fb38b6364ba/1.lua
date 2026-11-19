-- Threat: !InfrastructureShared
-- Name: 2fb38b6364ba
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  local l_0_0 = this_sigattrlog[1].utf8p2
  if string.find(l_0_0, "/u ", 1, true) and string.find(l_0_0, "/i:http", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
