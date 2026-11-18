-- Threat: !InfrastructureShared
-- Name: 58788d40e13f
-- Type: 21

if peattributes.isdll == false and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
