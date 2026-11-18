-- Threat: !InfrastructureShared
-- Name: 59783fc28369
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
