-- Threat: !InfrastructureShared
-- Name: 10078b174027e
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
