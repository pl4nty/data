-- Threat: !InfrastructureShared
-- Name: 2f78b62bf27b
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
