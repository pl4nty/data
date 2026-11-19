-- Threat: !InfrastructureShared
-- Name: 5b78a28a7105
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
