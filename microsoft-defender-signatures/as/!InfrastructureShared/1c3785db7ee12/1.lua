-- Threat: !InfrastructureShared
-- Name: 1c3785db7ee12
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
