-- Threat: !InfrastructureShared
-- Name: 6c787a203996
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
