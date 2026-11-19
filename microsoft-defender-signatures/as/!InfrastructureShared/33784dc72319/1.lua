-- Threat: !InfrastructureShared
-- Name: 33784dc72319
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
