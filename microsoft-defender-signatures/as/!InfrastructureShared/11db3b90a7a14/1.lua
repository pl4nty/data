-- Threat: !InfrastructureShared
-- Name: 11db3b90a7a14
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 then
  return mp.INFECTED
end
return mp.CLEAN
