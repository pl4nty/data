-- Threat: !InfrastructureShared
-- Name: 112785d6b3d8c
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
