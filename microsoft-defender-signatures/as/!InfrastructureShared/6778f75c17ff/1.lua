-- Threat: !InfrastructureShared
-- Name: 6778f75c17ff
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
