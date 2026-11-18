-- Threat: !InfrastructureShared
-- Name: c3b3d31478bc
-- Type: 21
-- Includes: BMLuaLib

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil and this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  local l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
  local l_0_1 = string.lower(this_sigattrlog[2].utf8p2)
  local l_0_2 = string.match(l_0_0, "([^\\]+%.exe)")
  if contains(l_0_2, l_0_1) then
    return mp.INFECTED
  end
end
return mp.CLEAN
