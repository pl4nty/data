-- Threat: !InfrastructureShared
-- Name: 207887a4436c
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
