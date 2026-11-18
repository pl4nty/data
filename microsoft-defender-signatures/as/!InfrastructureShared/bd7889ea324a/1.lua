-- Threat: !InfrastructureShared
-- Name: bd7889ea324a
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
