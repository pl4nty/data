-- Threat: !InfrastructureShared
-- Name: f27869e7339b
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
