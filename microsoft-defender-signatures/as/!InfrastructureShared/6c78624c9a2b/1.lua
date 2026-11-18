-- Threat: !InfrastructureShared
-- Name: 6c78624c9a2b
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
