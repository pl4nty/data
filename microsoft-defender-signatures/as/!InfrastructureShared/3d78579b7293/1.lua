-- Threat: !InfrastructureShared
-- Name: 3d78579b7293
-- Type: 21

if peattributes.isdll == false and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
