-- Threat: !InfrastructureShared
-- Name: 3d78d1ede40a
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
