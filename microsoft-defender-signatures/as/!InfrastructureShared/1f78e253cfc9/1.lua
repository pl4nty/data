-- Threat: !InfrastructureShared
-- Name: 1f78e253cfc9
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
