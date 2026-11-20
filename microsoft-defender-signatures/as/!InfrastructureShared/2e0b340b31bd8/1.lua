-- Threat: !InfrastructureShared
-- Name: 2e0b340b31bd8
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath() or "")
if string.match(l_0_0, "/ragent/bin/injectionmanager$") or string.match(l_0_0, "/ragent/bin/ragent$") or string.match(l_0_0, "/ragent/bin/ragentwd$") then
  return mp.CLEAN
end
local l_0_1, l_0_2, l_0_3, l_0_4, l_0_5, l_0_6
if this_sigattrlog[14].matched and this_sigattrlog[14].utf8p1 ~= nil then
  l_0_1 = this_sigattrlog[14].utf8p1
end
if this_sigattrlog[15].matched and this_sigattrlog[15].utf8p1 ~= nil then
  l_0_2 = this_sigattrlog[15].utf8p1
end
if this_sigattrlog[16].matched and this_sigattrlog[16].utf8p1 ~= nil then
  l_0_3 = this_sigattrlog[16].utf8p1
end
if this_sigattrlog[17].matched and this_sigattrlog[17].utf8p1 ~= nil then
  l_0_4 = this_sigattrlog[17].utf8p1
end
if this_sigattrlog[18].matched and this_sigattrlog[18].utf8p1 ~= nil then
  l_0_5 = this_sigattrlog[18].utf8p1
end
if this_sigattrlog[19].matched and this_sigattrlog[19].utf8p1 ~= nil then
  l_0_6 = this_sigattrlog[19].utf8p1
end
if l_0_1 ~= nil and l_0_1 == l_0_2 and l_0_2 == l_0_3 and l_0_3 == l_0_4 and l_0_4 == l_0_5 and l_0_5 == l_0_6 then
  return mp.INFECTED
end
return mp.CLEAN
