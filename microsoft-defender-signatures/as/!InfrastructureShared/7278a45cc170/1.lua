-- Threat: !InfrastructureShared
-- Name: 7278a45cc170
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
