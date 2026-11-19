-- Threat: !InfrastructureShared
-- Name: 59781732520b
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
