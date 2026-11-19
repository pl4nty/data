-- Threat: !InfrastructureShared
-- Name: 35787b27f7e7
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
