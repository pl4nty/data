-- Threat: !InfrastructureShared
-- Name: 6478ac6a81ef
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
