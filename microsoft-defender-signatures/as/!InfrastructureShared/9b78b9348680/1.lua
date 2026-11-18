-- Threat: !InfrastructureShared
-- Name: 9b78b9348680
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
