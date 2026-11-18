-- Threat: !InfrastructureShared
-- Name: 51783d04c12c
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
