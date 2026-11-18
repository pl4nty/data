-- Threat: !InfrastructureShared
-- Name: bc78b4583c98
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
