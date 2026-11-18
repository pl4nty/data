-- Threat: !InfrastructureShared
-- Name: 4c7850e6a52e
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
