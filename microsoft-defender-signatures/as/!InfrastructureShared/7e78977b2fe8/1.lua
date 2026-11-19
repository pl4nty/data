-- Threat: !InfrastructureShared
-- Name: 7e78977b2fe8
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
