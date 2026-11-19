-- Threat: !InfrastructureShared
-- Name: 4878b3f31851
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
