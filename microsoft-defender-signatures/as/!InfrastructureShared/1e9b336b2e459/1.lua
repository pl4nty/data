-- Threat: !InfrastructureShared
-- Name: 1e9b336b2e459
-- Type: 21

if this_sigattrlog[2].matched and this_sigattrlog[3].matched and this_sigattrlog[4].matched and this_sigattrlog[2].utf8p1 ~= nil and this_sigattrlog[2].utf8p1 ~= "" and this_sigattrlog[4].utf8p2 ~= nil and this_sigattrlog[4].utf8p2 ~= "" and this_sigattrlog[3].utf8p2 ~= nil and this_sigattrlog[3].utf8p2 ~= "" then
  local l_0_0 = this_sigattrlog[2].utf8p1
  if string.find(this_sigattrlog[3].utf8p2, l_0_0, 1, true) and string.find(this_sigattrlog[4].utf8p2, l_0_0, 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
