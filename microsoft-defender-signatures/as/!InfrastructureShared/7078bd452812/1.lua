-- Threat: !InfrastructureShared
-- Name: 7078bd452812
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == false then
  return mp.INFECTED
end
return mp.CLEAN
