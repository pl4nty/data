-- Threat: !InfrastructureShared
-- Name: b6b318f8b913
-- Type: 21

if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 ~= nil then
  local l_0_0 = string.lower(this_sigattrlog[4].utf8p1)
  if string.match(l_0_0, "%.bin$") then
    return mp.INFECTED
  end
end
return mp.CLEAN
