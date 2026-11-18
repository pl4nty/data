-- Threat: !InfrastructureShared
-- Name: e378c6e9b691
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
