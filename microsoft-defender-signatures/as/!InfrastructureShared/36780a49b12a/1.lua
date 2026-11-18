-- Threat: !InfrastructureShared
-- Name: 36780a49b12a
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
