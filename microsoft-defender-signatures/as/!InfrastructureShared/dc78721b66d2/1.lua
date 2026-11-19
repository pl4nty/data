-- Threat: !InfrastructureShared
-- Name: dc78721b66d2
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
