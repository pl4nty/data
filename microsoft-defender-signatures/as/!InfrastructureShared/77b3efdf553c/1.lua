-- Threat: !InfrastructureShared
-- Name: 77b3efdf553c
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil and string.match(this_sigattrlog[1].utf8p1, "%.ini$") ~= nil then
  return mp.CLEAN
end
return mp.INFECTED
