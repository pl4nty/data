-- Threat: !InfrastructureShared
-- Name: 9d78047c2cdd
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
