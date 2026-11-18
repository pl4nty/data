-- Threat: !InfrastructureShared
-- Name: 11e7877be16b9
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
