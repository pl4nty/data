-- Threat: !InfrastructureShared
-- Name: 4e786c1469e2
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
