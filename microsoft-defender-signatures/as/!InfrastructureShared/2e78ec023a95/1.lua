-- Threat: !InfrastructureShared
-- Name: 2e78ec023a95
-- Type: 21

if peattributes.no_security == true and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
