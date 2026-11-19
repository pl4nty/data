-- Threat: !InfrastructureShared
-- Name: 5c78445a3509
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
