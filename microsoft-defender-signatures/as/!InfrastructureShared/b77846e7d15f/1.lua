-- Threat: !InfrastructureShared
-- Name: b77846e7d15f
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
