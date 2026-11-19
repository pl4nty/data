-- Threat: !InfrastructureShared
-- Name: 54781b3bd4c5
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
