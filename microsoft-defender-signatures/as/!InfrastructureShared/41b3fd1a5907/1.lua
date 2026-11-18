-- Threat: !InfrastructureShared
-- Name: 41b3fd1a5907
-- Type: 21

if this_sigattrlog[3].matched then
  local l_0_0 = this_sigattrlog[3].utf8p1:lower():match("\\([^\\]+)$")
  local l_0_1 = this_sigattrlog[3].utf8p2:lower():match("\\([^\\]+)%.exe$")
  if l_0_0 ~= nil and l_0_1 ~= nil and l_0_0 == l_0_1 then
    return mp.INFECTED
  end
end
return mp.CLEAN
