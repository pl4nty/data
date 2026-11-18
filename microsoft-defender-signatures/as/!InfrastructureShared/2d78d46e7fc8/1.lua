-- Threat: !InfrastructureShared
-- Name: 2d78d46e7fc8
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
