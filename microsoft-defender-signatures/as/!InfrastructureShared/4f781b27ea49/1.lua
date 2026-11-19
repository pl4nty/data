-- Threat: !InfrastructureShared
-- Name: 4f781b27ea49
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
