-- Threat: !InfrastructureShared
-- Name: 69b3be7900ec
-- Type: 21

if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  local l_0_0 = string.lower(this_sigattrlog[4].utf8p2)
  if string.find(l_0_0, "mailto:", 1, true) then
    return mp.CLEAN
  end
end
return mp.INFECTED
