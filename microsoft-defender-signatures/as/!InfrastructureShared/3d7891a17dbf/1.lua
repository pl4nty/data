-- Threat: !InfrastructureShared
-- Name: 3d7891a17dbf
-- Type: 21

if peattributes.isdll == false and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
