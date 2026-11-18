-- Threat: !InfrastructureShared
-- Name: 5478bad86b32
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
