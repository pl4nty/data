-- Threat: !InfrastructureShared
-- Name: 397881d04cd0
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
