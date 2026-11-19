-- Threat: !InfrastructureShared
-- Name: 2e78ad7254ca
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
