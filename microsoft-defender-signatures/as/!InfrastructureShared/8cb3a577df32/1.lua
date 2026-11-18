-- Threat: !InfrastructureShared
-- Name: 8cb3a577df32
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p1
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
end
if l_0_0 then
  local l_0_1 = string.match(l_0_0, "\\([^\\]+)$")
  local l_0_2 = string.lower(l_0_1)
  if string.find(l_0_2, "%.ppa") then
    return mp.INFECTED
  end
end
return mp.CLEAN
