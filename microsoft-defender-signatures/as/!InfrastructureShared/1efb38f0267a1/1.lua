-- Threat: !InfrastructureShared
-- Name: 1efb38f0267a1
-- Type: 21

local l_0_0, l_0_1, l_0_2
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p1)
end
if l_0_0 ~= nil and (string.find(l_0_0, "\\irj\\servlet_jsp\\irj\\root\\", 1, true) ~= nil or string.find(l_0_0, "\\irj\\servlet_jsp\\irj\\work\\", 1, true) ~= nil) then
  return mp.INFECTED
end
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[4].utf8p1)
end
if l_0_0 ~= nil and (string.find(l_0_0, "\\irj\\servlet_jsp\\irj\\root\\", 1, true) ~= nil or string.find(l_0_0, "\\irj\\servlet_jsp\\irj\\work\\", 1, true) ~= nil) then
  return mp.INFECTED
end
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_1 = string.lower(this_sigattrlog[2].utf8p1)
end
if l_0_1 ~= nil and (string.find(l_0_1, "\\irj\\servlet_jsp\\irj\\root\\", 1, true) ~= nil or string.find(l_0_1, "\\irj\\servlet_jsp\\irj\\work\\", 1, true) ~= nil) then
  return mp.INFECTED
end
if this_sigattrlog[5].matched and this_sigattrlog[5].utf8p1 ~= nil then
  l_0_1 = string.lower(this_sigattrlog[5].utf8p1)
end
if l_0_1 ~= nil and (string.find(l_0_1, "\\irj\\servlet_jsp\\irj\\root\\", 1, true) ~= nil or string.find(l_0_1, "\\irj\\servlet_jsp\\irj\\work\\", 1, true) ~= nil) then
  return mp.INFECTED
end
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p1 ~= nil then
  l_0_2 = string.lower(this_sigattrlog[3].utf8p1)
end
if l_0_2 ~= nil and (string.find(l_0_2, "\\irj\\servlet_jsp\\irj\\root\\", 1, true) ~= nil or string.find(l_0_2, "\\irj\\servlet_jsp\\irj\\work\\", 1, true) ~= nil) then
  return mp.INFECTED
end
if this_sigattrlog[6].matched and this_sigattrlog[6].utf8p1 ~= nil then
  l_0_2 = string.lower(this_sigattrlog[6].utf8p1)
end
if l_0_2 ~= nil and (string.find(l_0_2, "\\irj\\servlet_jsp\\irj\\root\\", 1, true) ~= nil or string.find(l_0_2, "\\irj\\servlet_jsp\\irj\\work\\", 1, true) ~= nil) then
  return mp.INFECTED
end
return mp.CLEAN
