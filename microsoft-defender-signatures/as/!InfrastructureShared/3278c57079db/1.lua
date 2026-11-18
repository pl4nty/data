-- Threat: !InfrastructureShared
-- Name: 3278c57079db
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
