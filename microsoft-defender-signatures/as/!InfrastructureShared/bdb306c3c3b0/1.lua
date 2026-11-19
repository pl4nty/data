-- Threat: !InfrastructureShared
-- Name: bdb306c3c3b0
-- Type: 21

if this_sigattrlog[3].utf8p2 == this_sigattrlog[3].utf8p1 then
  return mp.INFECTED
end
return mp.CLEAN
