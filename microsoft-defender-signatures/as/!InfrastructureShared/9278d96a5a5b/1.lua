-- Threat: !InfrastructureShared
-- Name: 9278d96a5a5b
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
