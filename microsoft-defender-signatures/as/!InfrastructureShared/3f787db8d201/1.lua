-- Threat: !InfrastructureShared
-- Name: 3f787db8d201
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
