-- Threat: !InfrastructureShared
-- Name: 3678cd8dfd52
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
