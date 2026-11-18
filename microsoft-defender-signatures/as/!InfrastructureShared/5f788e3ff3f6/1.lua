-- Threat: !InfrastructureShared
-- Name: 5f788e3ff3f6
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
