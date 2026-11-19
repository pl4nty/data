-- Threat: !InfrastructureShared
-- Name: 447864f65d31
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
