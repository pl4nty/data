-- Threat: !InfrastructureShared
-- Name: 7078e1e8dd5f
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
