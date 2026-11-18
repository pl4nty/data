-- Threat: !InfrastructureShared
-- Name: 81b338b0debc
-- Type: 21

if bm.GetSignatureMatchDuration() > 300000000 then
  return mp.CLEAN
end
local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p1)
end
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_1 = string.lower(this_sigattrlog[2].utf8p1)
end
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = string.match(l_0_1, "([^\\]+)$")
if l_0_2 == nil then
  return mp.CLEAN
end
if string.find(l_0_2, ":", 1, true) == nil then
  return mp.CLEAN
end
local l_0_3
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_3 = string.lower(this_sigattrlog[4].utf8p2)
end
if string.find(l_0_3, l_0_0, 1, true) == nil then
  return mp.CLEAN
end
return mp.INFECTED
