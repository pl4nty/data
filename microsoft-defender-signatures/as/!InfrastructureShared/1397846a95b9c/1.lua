-- Threat: !InfrastructureShared
-- Name: 1397846a95b9c
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
