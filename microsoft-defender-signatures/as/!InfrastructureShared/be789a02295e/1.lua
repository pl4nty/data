-- Threat: !InfrastructureShared
-- Name: be789a02295e
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
