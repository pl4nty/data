-- Threat: !InfrastructureShared
-- Name: 2db3d8c2d458
-- Type: 21

if this_sigattrlog[1].matched then
  local l_0_0 = this_sigattrlog[1].utf8p1
  if l_0_0 == nil then
    return mp.CLEAN
  end
  local l_0_1 = string.lower(string.match(l_0_0, "(.-)[^\\]-[^\\%.]+$"))
  if l_0_1 ~= nil and string.len(l_0_1) == 3 and l_0_1 ~= "c:\\" then
    return mp.INFECTED
  end
end
return mp.CLEAN
