-- Threat: !InfrastructureShared
-- Name: e878d2e42335
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
