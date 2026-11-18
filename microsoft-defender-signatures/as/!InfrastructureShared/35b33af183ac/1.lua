-- Threat: !InfrastructureShared
-- Name: 35b33af183ac
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil and this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  local l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
  local l_0_1 = string.lower(this_sigattrlog[2].utf8p1)
  local l_0_2 = l_0_1:match("([^\\]+)$")
  if l_0_2 and string.find(l_0_0, l_0_2, 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
