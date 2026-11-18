-- Threat: !InfrastructureShared
-- Name: 73b3a4394a58
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  local l_0_0 = string.lower(this_sigattrlog[1].utf8p1)
  if string.match(l_0_0, "\\google\\chrome\\user data\\default\\extensions\\[^\\]+\\") == nil then
    return mp.INFECTED
  elseif string.match(l_0_0, "\\google\\chrome\\user data\\default\\extensions\\[^\\]+\\$") ~= nil then
    return mp.INFECTED
  else
    return mp.CLEAN
  end
end
return mp.CLEAN
