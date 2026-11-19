-- Threat: !InfrastructureShared
-- Name: 54b3e11b4a55
-- Type: 21

if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  local l_0_0 = string.lower(this_sigattrlog[2].utf8p1)
  if string.match(l_0_0, "%.tmp$") then
    return mp.INFECTED
  end
end
return mp.CLEAN
