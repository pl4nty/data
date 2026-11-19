-- Threat: !InfrastructureShared
-- Name: 23789b8fb090
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
