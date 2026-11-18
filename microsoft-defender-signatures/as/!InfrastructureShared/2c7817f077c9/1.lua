-- Threat: !InfrastructureShared
-- Name: 2c7817f077c9
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
