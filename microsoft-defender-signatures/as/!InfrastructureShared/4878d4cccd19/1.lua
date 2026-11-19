-- Threat: !InfrastructureShared
-- Name: 4878d4cccd19
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
