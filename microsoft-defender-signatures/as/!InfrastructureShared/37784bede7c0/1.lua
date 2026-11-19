-- Threat: !InfrastructureShared
-- Name: 37784bede7c0
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
