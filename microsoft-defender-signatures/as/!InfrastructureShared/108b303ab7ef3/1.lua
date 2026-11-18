-- Threat: !InfrastructureShared
-- Name: 108b303ab7ef3
-- Type: 21

if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  local l_0_0 = this_sigattrlog[2].utf8p1
  local l_0_1 = l_0_0:match("%.([^\\/%s]+)$")
  local l_0_2 = {
    scr = true,
    pif = true,
    com = true,
    bat = true
  }
  if l_0_1 and l_0_2[l_0_1:lower()] then
    return mp.INFECTED
  end
end
return mp.CLEAN
