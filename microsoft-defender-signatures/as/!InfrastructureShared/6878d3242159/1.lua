-- Threat: !InfrastructureShared
-- Name: 6878d3242159
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
