-- Threat: !InfrastructureShared
-- Name: 3c78faac3ef2
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
