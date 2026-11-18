-- Threat: !InfrastructureShared
-- Name: 4078d33290cc
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
