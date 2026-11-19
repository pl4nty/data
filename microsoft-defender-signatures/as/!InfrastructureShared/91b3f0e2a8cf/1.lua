-- Threat: !InfrastructureShared
-- Name: 91b3f0e2a8cf
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[2].matched and this_sigattrlog[3].matched and this_sigattrlog[4].matched and this_sigattrlog[1].utf8p1 ~= nil and this_sigattrlog[4].utf8p1 ~= nil then
  if string.find(this_sigattrlog[1].utf8p1, "/private/tmp/", 1, true) ~= 1 and string.find(this_sigattrlog[1].utf8p1, "/tmp/", 1, true) ~= 1 then
    return mp.CLEAN
  end
  if this_sigattrlog[1].utf8p1 == this_sigattrlog[4].utf8p1 then
    local l_0_0 = mp.GetExecutablesFromCommandLine(this_sigattrlog[3].utf8p2)
    if l_0_0 ~= nil then
      for l_0_1, l_0_2 in ipairs(l_0_0) do
        if string.find(l_0_2, "/", 1, true) == 1 and string.find(this_sigattrlog[1].utf8p1, l_0_2, 1, true) and (string.find(this_sigattrlog[2].utf8p2, l_0_2, 1, true) or string.find(this_sigattrlog[2].utf8p2, this_sigattrlog[1].utf8p1, 1, true)) then
          return mp.INFECTED
        end
      end
    end
  end
end
return mp.CLEAN
