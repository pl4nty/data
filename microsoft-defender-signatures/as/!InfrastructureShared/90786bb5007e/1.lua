-- Threat: !InfrastructureShared
-- Name: 90786bb5007e
-- Type: 21

if peattributes.no_security == true and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
