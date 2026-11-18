-- Threat: !InfrastructureShared
-- Name: e478d1a54ebb
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
