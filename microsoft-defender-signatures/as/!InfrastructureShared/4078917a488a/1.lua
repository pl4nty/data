-- Threat: !InfrastructureShared
-- Name: 4078917a488a
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
