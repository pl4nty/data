-- Threat: !InfrastructureShared
-- Name: 467857f2da50
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
