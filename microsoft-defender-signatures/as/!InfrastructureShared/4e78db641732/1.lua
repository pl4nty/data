-- Threat: !InfrastructureShared
-- Name: 4e78db641732
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
