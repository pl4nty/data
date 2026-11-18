-- Threat: !InfrastructureShared
-- Name: 218b3bf2f1a9a
-- Type: 21

local l_0_0, l_0_1, l_0_2, l_0_3, l_0_4
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[3].utf8p2)
end
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_1 = string.lower(this_sigattrlog[4].utf8p2)
end
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_2 = l_0_0:match("\\services\\(.-)\\\\")
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_3 = l_0_1:match("\\services\\(.-)\\parameters\\\\")
if l_0_2 == nil or l_0_3 == nil then
  return mp.CLEAN
end
if l_0_2 ~= l_0_3 then
  return mp.CLEAN
end
if this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2 ~= nil then
  l_0_4 = string.lower(this_sigattrlog[5].utf8p2)
elseif this_sigattrlog[6].matched and this_sigattrlog[6].utf8p2 ~= nil then
  l_0_4 = string.lower(this_sigattrlog[6].utf8p2)
end
if l_0_4 ~= nil and not string.match(l_0_4, l_0_2) then
  return mp.CLEAN
end
return mp.INFECTED
