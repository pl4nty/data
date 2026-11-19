-- Threat: !InfrastructureShared
-- Name: 65781c6e3f8a
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
