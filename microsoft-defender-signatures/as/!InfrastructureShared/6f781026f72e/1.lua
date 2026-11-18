-- Threat: !InfrastructureShared
-- Name: 6f781026f72e
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
