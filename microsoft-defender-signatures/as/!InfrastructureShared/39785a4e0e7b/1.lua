-- Threat: !InfrastructureShared
-- Name: 39785a4e0e7b
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
