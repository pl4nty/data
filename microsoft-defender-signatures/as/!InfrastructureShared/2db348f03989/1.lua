-- Threat: !InfrastructureShared
-- Name: 2db348f03989
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].wp1 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p1
end
if this_sigattrlog[1].matched then
  local l_0_1 = this_sigattrlog[1].utf8p1
  if l_0_1 ~= nil and l_0_0 ~= nil then
    local l_0_2 = string.match(l_0_1, "(.*\\)")
    local l_0_3 = string.match(l_0_0, "(.*\\)")
    if l_0_3 ~= nil and l_0_3 == l_0_2 then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
