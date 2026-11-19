-- Threat: !InfrastructureShared
-- Name: 4178001cd85c
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
