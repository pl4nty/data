-- Threat: !InfrastructureShared
-- Name: 43788c1dbb2c
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
