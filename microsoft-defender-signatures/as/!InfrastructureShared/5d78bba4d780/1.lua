-- Threat: !InfrastructureShared
-- Name: 5d78bba4d780
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
