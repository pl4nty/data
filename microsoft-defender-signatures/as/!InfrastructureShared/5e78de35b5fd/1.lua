-- Threat: !InfrastructureShared
-- Name: 5e78de35b5fd
-- Type: 21

if peattributes.no_security == true and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
