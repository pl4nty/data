-- Threat: !InfrastructureShared
-- Name: 5c78e4192c48
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
