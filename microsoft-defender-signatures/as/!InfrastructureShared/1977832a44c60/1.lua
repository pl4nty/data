-- Threat: !InfrastructureShared
-- Name: 1977832a44c60
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
