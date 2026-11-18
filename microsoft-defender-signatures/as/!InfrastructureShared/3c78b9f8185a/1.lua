-- Threat: !InfrastructureShared
-- Name: 3c78b9f8185a
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
