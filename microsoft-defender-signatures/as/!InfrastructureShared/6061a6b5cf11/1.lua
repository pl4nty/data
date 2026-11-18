-- Threat: !InfrastructureShared
-- Name: 6061a6b5cf11
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
