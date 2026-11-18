-- Threat: !InfrastructureShared
-- Name: 3778834f8fbd
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
