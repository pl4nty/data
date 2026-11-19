-- Threat: !InfrastructureShared
-- Name: 5b616a9b2dbf
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
