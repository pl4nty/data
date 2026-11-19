-- Threat: !InfrastructureShared
-- Name: 67b3d07036dc
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].wp2 ~= nil then
  local l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
  local l_0_1 = string.match(l_0_0, "\\([^\\]+)$")
  if this_sigattrlog[2].matched and this_sigattrlog[2].wp1 ~= nil then
    local l_0_2 = string.lower(this_sigattrlog[2].utf8p1)
    local l_0_3 = string.match(l_0_2, "\\([^\\]+)$")
    if l_0_1 == l_0_3 then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
