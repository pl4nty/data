-- Threat: !InfrastructureShared
-- Name: 2bcb3b562693b
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[7].matched and this_sigattrlog[7].utf8p1 ~= nil and this_sigattrlog[7].utf8p1 ~= "" then
  l_0_0 = this_sigattrlog[7].utf8p1
elseif this_sigattrlog[8].matched and this_sigattrlog[8].utf8p1 ~= nil and this_sigattrlog[8].utf8p1 ~= "" then
  l_0_0 = this_sigattrlog[8].utf8p1
elseif this_sigattrlog[9].matched and this_sigattrlog[9].utf8p1 ~= nil and this_sigattrlog[9].utf8p1 ~= "" then
  l_0_0 = this_sigattrlog[9].utf8p1
end
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil and this_sigattrlog[2].utf8p2 ~= "" then
  l_0_1 = this_sigattrlog[2].utf8p2
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil and this_sigattrlog[3].utf8p2 ~= "" then
  l_0_1 = this_sigattrlog[3].utf8p2
end
local l_0_2, l_0_3 = l_0_0:match("([^/]+%.app.*)/([^/]+)$")
if l_0_1 ~= nil and l_0_3 ~= nil and l_0_2 ~= nil then
  if l_0_3 ~= "app.asar" then
    return mp.CLEAN
  end
  if string.find(l_0_1, l_0_3, 1, true) and string.find(l_0_1, l_0_2, 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
