-- Threat: !InfrastructureShared
-- Name: 56b33ff1d058
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  local l_0_0 = this_sigattrlog[1].utf8p2
  if string.find(l_0_0, "/u ", 1, true) or string.find(l_0_0, "/s ", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
