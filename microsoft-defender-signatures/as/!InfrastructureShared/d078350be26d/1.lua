-- Threat: !InfrastructureShared
-- Name: d078350be26d
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
