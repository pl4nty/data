-- Threat: !InfrastructureShared
-- Name: 3178ed0054a2
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
