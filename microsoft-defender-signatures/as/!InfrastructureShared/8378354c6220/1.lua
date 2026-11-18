-- Threat: !InfrastructureShared
-- Name: 8378354c6220
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
