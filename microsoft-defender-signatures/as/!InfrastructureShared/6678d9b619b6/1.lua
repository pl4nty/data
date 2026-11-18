-- Threat: !InfrastructureShared
-- Name: 6678d9b619b6
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
