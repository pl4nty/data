-- Threat: !InfrastructureShared
-- Name: 60787a3ab922
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
