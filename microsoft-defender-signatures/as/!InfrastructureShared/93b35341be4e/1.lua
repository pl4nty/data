-- Threat: !InfrastructureShared
-- Name: 93b35341be4e
-- Type: 21

local l_0_0, l_0_1, l_0_2
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p1
end
if l_0_0 == nil then
  return mp.CLEAN
end
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[2].utf8p2
end
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_2 = l_0_1:match("icacls%s+([^%s]+)")
if l_0_2 == nil then
  return mp.CLEAN
end
if l_0_2 == l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
