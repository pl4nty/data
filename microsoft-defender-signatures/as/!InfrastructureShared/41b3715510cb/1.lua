-- Threat: !InfrastructureShared
-- Name: 41b3715510cb
-- Type: 21

local l_0_0, l_0_1, l_0_2
if this_sigattrlog[1].matched and this_sigattrlog[3].matched then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p1)
  l_0_1 = string.lower(this_sigattrlog[3].utf8p1)
end
if l_0_0 ~= nil and l_0_1 ~= nil then
  l_0_2 = string.match(l_0_0, "\\([^\\]+)$")
  if l_0_2 ~= nil and l_0_2 == l_0_1 then
    return mp.INFECTED
  end
end
return mp.CLEAN
