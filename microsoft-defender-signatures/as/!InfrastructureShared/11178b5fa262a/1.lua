-- Threat: !InfrastructureShared
-- Name: 11178b5fa262a
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
