-- Threat: !InfrastructureShared
-- Name: 30787c865442
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
