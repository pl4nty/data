-- Threat: !InfrastructureShared
-- Name: e3b30a7730dd
-- Type: 21

if this_sigattrlog[2].matched and this_sigattrlog[5].matched then
  local l_0_0 = string.lower(this_sigattrlog[2].utf8p1)
  local l_0_1 = string.lower(this_sigattrlog[5].utf8p2)
  if l_0_0 ~= nil and l_0_1 ~= nil and string.find(l_0_1, l_0_0, 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
