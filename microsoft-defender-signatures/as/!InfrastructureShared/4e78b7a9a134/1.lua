-- Threat: !InfrastructureShared
-- Name: 4e78b7a9a134
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
