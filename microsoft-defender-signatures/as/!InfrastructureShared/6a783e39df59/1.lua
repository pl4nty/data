-- Threat: !InfrastructureShared
-- Name: 6a783e39df59
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
