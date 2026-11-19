-- Threat: !InfrastructureShared
-- Name: 8a787425f19e
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
