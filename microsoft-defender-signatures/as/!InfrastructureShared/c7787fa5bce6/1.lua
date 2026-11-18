-- Threat: !InfrastructureShared
-- Name: c7787fa5bce6
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
