-- Threat: !InfrastructureShared
-- Name: 7278f687e6af
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
