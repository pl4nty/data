-- Threat: !InfrastructureShared
-- Name: 26eb30c3ec78d
-- Type: 21

local l_0_0
if this_sigattrlog[11].matched and this_sigattrlog[11].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[11].utf8p2)
end
if this_sigattrlog[12].matched and this_sigattrlog[12].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[12].utf8p2)
end
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  local l_0_1 = string.lower(this_sigattrlog[1].utf8p1)
  local l_0_2 = l_0_1:match("_exec:(.+)$")
  if l_0_2 ~= nil and l_0_0:find(l_0_2, 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
