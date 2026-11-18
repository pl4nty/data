-- Threat: !InfrastructureShared
-- Name: 727862c408b1
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
