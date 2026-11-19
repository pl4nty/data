-- Threat: !InfrastructureShared
-- Name: 3a78c17747c9
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
