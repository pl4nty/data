-- Threat: !InfrastructureShared
-- Name: 7278a69c7616
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
