-- Threat: !InfrastructureShared
-- Name: 6c7829783ea5
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
