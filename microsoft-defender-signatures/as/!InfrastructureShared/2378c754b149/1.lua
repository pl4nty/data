-- Threat: !InfrastructureShared
-- Name: 2378c754b149
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
