-- Threat: !InfrastructureShared
-- Name: 3678cf26872c
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
