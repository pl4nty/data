-- Threat: !InfrastructureShared
-- Name: 367834f6e0e5
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == false then
  return mp.INFECTED
end
return mp.CLEAN
