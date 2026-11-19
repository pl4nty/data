-- Threat: !InfrastructureShared
-- Name: 7d7867eaab16
-- Type: 21

if peattributes.isdll and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
