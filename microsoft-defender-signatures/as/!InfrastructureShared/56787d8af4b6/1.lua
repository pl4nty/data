-- Threat: !InfrastructureShared
-- Name: 56787d8af4b6
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
