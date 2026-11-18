-- Threat: !InfrastructureShared
-- Name: 4c787a7e69b5
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
