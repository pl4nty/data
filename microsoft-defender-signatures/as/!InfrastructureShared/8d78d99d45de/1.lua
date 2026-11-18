-- Threat: !InfrastructureShared
-- Name: 8d78d99d45de
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
