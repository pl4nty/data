-- Threat: !InfrastructureShared
-- Name: 1b78bf529d41
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
