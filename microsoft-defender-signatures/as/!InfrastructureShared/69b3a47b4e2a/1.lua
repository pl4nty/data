-- Threat: !InfrastructureShared
-- Name: 69b3a47b4e2a
-- Type: 21

local l_0_0, l_0_1, l_0_2, l_0_3, l_0_4
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil and this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil and this_sigattrlog[5].matched and this_sigattrlog[5].utf8p1 ~= nil then
  l_0_1 = string.lower(this_sigattrlog[4].utf8p2)
  l_0_3 = string.lower(this_sigattrlog[2].utf8p1)
  l_0_0 = string.lower(this_sigattrlog[5].utf8p1)
  l_0_4, l_0_2 = string.match(l_0_0, "imagename:(.-);targetprocessppid:(.+)")
  if l_0_4 ~= nil and l_0_2 ~= nil and l_0_3:find(l_0_4, 1, true) and l_0_1:find(l_0_2, 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
