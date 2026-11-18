-- Threat: !InfrastructureShared
-- Name: 64786d23a5d5
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
