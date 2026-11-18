-- Threat: !InfrastructureShared
-- Name: 627873c31423
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
