-- Threat: !InfrastructureShared
-- Name: 6e78d2a4dee9
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
