-- Threat: !InfrastructureShared
-- Name: 5b419166cae8
-- Type: 21

local l_0_0
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p1
end
if l_0_0 ~= nil then
  local l_0_1, l_0_2 = string.find(l_0_0, "User", 1, true)
  local l_0_3, l_0_4 = string.find(l_0_0, "Netlogon", 1, true)
  if l_0_2 ~= nil and l_0_3 ~= nil and l_0_2 < l_0_3 and 130 < l_0_3 - l_0_2 then
    return mp.INFECTED
  end
end
return mp.CLEAN
