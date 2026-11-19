-- Threat: !InfrastructureShared
-- Name: 44781ed5845c
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
