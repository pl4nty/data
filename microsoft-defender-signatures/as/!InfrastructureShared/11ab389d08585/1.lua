-- Threat: !InfrastructureShared
-- Name: 11ab389d08585
-- Type: 21

if this_sigattrlog[2].matched and this_sigattrlog[5].matched and this_sigattrlog[2].utf8p2 ~= nil and this_sigattrlog[5].utf8p2 ~= nil then
  local l_0_0 = mp.GetExecutablesFromCommandLine(this_sigattrlog[2].utf8p2)
  if l_0_0 ~= nil then
    for l_0_1, l_0_2 in ipairs(l_0_0) do
      if string.find(this_sigattrlog[5].utf8p2, l_0_2, 1, true) then
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
