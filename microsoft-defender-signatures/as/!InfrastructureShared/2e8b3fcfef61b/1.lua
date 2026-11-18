-- Threat: !InfrastructureShared
-- Name: 2e8b3fcfef61b
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[2].matched and this_sigattrlog[3].matched and this_sigattrlog[4].matched and this_sigattrlog[5].matched and this_sigattrlog[6].matched then
  local l_0_0 = this_sigattrlog[1].utf8p1
  local l_0_1 = this_sigattrlog[4].utf8p1
  local l_0_2 = this_sigattrlog[2].utf8p2
  local l_0_3 = this_sigattrlog[3].utf8p2
  local l_0_4 = this_sigattrlog[5].utf8p2
  local l_0_5 = this_sigattrlog[6].utf8p2
  if l_0_0 ~= nil and l_0_0 ~= "" and l_0_1 ~= nil and l_0_1 ~= "" and l_0_2 ~= nil and l_0_2 ~= "" and l_0_3 ~= nil and l_0_3 ~= "" and l_0_4 ~= nil and l_0_4 ~= "" and l_0_5 ~= nil and l_0_5 ~= "" and string.find(l_0_2, l_0_0, 1, true) and string.find(l_0_3, l_0_0, 1, true) and string.find(l_0_4, l_0_1, 1, true) and string.find(l_0_5, l_0_1, 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
