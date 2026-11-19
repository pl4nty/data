-- Threat: !InfrastructureShared
-- Name: 11cb3e3c2d63f
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[3].utf8p2)
end
if string.find(l_0_0, "iexplore", 1, true) then
  return mp.CLEAN
end
if string.find(l_0_0, " iex", 1, true) or string.find(l_0_0, "iex ", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
