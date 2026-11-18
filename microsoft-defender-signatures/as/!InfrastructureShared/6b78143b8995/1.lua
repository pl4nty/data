-- Threat: !InfrastructureShared
-- Name: 6b78143b8995
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
