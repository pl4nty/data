-- Threat: !InfrastructureShared
-- Name: 6c78b9fe1f3c
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
