-- Threat: !InfrastructureShared
-- Name: c878195e8a5f
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
