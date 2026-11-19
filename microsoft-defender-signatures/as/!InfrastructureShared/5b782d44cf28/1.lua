-- Threat: !InfrastructureShared
-- Name: 5b782d44cf28
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
