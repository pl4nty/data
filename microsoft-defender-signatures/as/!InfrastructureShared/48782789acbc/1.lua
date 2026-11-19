-- Threat: !InfrastructureShared
-- Name: 48782789acbc
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
