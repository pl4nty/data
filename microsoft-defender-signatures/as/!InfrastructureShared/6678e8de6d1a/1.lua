-- Threat: !InfrastructureShared
-- Name: 6678e8de6d1a
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
