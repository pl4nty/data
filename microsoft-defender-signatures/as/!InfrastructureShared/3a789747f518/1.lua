-- Threat: !InfrastructureShared
-- Name: 3a789747f518
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
