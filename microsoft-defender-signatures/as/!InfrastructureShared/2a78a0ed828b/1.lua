-- Threat: !InfrastructureShared
-- Name: 2a78a0ed828b
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
