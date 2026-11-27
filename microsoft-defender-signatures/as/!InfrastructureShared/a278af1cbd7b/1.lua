-- Threat: !InfrastructureShared
-- Name: a278af1cbd7b
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
